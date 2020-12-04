const { readFileSync } = require('fs');
const { resolve } = require('path');
const robot = require('robotjs');
const _ = require('lodash');
const getBinaryList = require('./get-binary-list');
const getBlock = require('./get-block');
const getSpellState = require('./get-spell-state');
const getMemberStatus = require('./get-member-status');
const getMemberCombatStatus = require('./get-member-combat-status');
const getMemberMeleeRange = require('./get-member-melee-range');
const bufferToPng = require('./buffer-to-png');
const assignBinaryVariables = require('./assign-binary-variables');
const SquareReader = require('./square-reader');

const raw = readFileSync(resolve(__dirname, 'coordinates.json'), 'utf-8');
const config = JSON.parse(raw);

const rawSpells = readFileSync(
  resolve(__dirname, '../spells/spells.json'),
  'utf-8'
);
const listOfAbilities = JSON.parse(rawSpells);

function getGameState(app) {
  const pixel = {
    xMin: 0,
    yMin: 0,
    xMax: 375,
    yMax: 35,
  };

  const bitmap = robot.screen.capture(
    pixel.xMin,
    pixel.yMin,
    pixel.xMax,
    pixel.yMax
  );
  const reader = new SquareReader(bitmap);
  const imageUri = bufferToPng(bitmap.image, pixel.xMax, pixel.yMax);

  // Health stats
  const healthMax = reader.getIntAtCell(config[2]);
  const healthCurrent = reader.getIntAtCell(config[3]);

  // Mana stats
  const manaMax = reader.getIntAtCell(config[4]);
  const manaCurrent = reader.getIntAtCell(config[5]);
  const mana = (manaCurrent / manaMax) * 100;
  const lowMana = mana < 30;

  const energyMax = reader.getIntAtCell(config[6]);
  const energyCurrent = reader.getIntAtCell(config[7]);
  const comboPoints = reader.getIntAtCell(config[8]);

  const rageMax = reader.getIntAtCell(config[9]);
  const rageCurrent = reader.getIntAtCell(config[10]);

  // const currentAbilities = getAbilities(config, reader, app);
  const numberOfBuffs = 20;
  const numberOfDebuffs = 20;
  const numberOfAbilities = 36;
  let startFrame = 11;

  const buffs = getBlock(
    app,
    config,
    reader,
    listOfAbilities,
    startFrame,
    startFrame + numberOfBuffs,
    'buff'
  );
  startFrame += numberOfBuffs;

  const debuffs = getBlock(
    app,
    config,
    reader,
    listOfAbilities,
    startFrame,
    startFrame + numberOfDebuffs,
    'debuff'
  );
  startFrame += numberOfDebuffs;

  const spells = getSpellState(
    app,
    config,
    reader,
    listOfAbilities,
    startFrame,
    startFrame + numberOfAbilities
  );
  startFrame += numberOfAbilities;

  const memberStatus = reader.getIntAtCell(config[startFrame]);
  startFrame += 1;
  const memberCombatStatus = reader.getIntAtCell(config[startFrame]);
  startFrame += 1;
  const memberMeleeRange = reader.getIntAtCell(config[startFrame]);
  startFrame += 1;

  const miscValue = ['hasWeaponEnchant'];
  const miscBinary = reader.getIntAtCell(config[startFrame]);
  const miscList = getBinaryList(miscBinary, miscValue);

  const gameState = {
    name: 'track-game-state',
    healthMax,
    healthCurrent,
    health: (healthCurrent / healthMax) * 100,
    manaMax,
    manaCurrent,
    mana,
    lowMana,
    energyMax,
    energyCurrent,
    energy: (energyCurrent / energyMax) * 100,
    comboPoints,
    rageMax,
    rageCurrent,
    rage: (rageCurrent / rageMax) * 100,
    buffs,
    debuffs,
    spells,
    ...getMemberStatus(memberStatus),
    ...getMemberCombatStatus(memberCombatStatus),
    ...getMemberMeleeRange(memberMeleeRange),
    ...miscList,
    // ...assignBinaryVariables(reader.getIntAtCell(config[11])),
    // // Grabs the target ID, whether we are in combat, how much food and potions we have left, and if our target is kill
    // target:
    //   reader.getStringAtCell(config[17]) + reader.getStringAtCell(config[18]),
    // // Targets current percentage of health
    // targetHealth: reader.getIntAtCell(config[19]),
    // spells: getSpellState(config, reader, currentAbilities),
    // direction: reader.getFixedPointAtCell(config[39]),
  };

  return gameState;
}

module.exports = getGameState;
