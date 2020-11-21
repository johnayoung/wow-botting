const { readFileSync } = require('fs');
const { resolve } = require('path');
const robot = require('robotjs');
const getAbilities = require('./get-abilities');
const getSpellState = require('./get-spell-state');
const bufferToPng = require('./buffer-to-png');
const assignBinaryVariables = require('./assign-binary-variables');
const SquareReader = require('./square-reader');

const raw = readFileSync(resolve(__dirname, 'coordinates.json'), 'utf-8');
const config = JSON.parse(raw);

function getRandomInt(max) {
  return Math.floor(Math.random() * Math.floor(max));
}

function getGameState(app) {
  const pixel = {
    xMin: 0,
    yMin: 0,
    xMax: 185,
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

  const energyMax = reader.getIntAtCell(config[6]);
  const energyCurrent = reader.getIntAtCell(config[7]);
  const comboPoints = reader.getIntAtCell(config[8]);

  const rageMax = reader.getIntAtCell(config[9]);
  const rageCurrent = reader.getIntAtCell(config[10]);

  const currentAbilities = getAbilities(config, reader, app);

  const gameState = {
    name: 'track-game-state',
    healthMax,
    healthCurrent,
    health: (healthCurrent / healthMax) * 100,
    manaMax,
    manaCurrent,
    mana: (manaCurrent / manaMax) * 100,
    energyMax,
    energyCurrent,
    energy: (energyCurrent / energyMax) * 100,
    comboPoints,
    rageMax,
    rageCurrent,
    rage: (rageCurrent / rageMax) * 100,
    ...assignBinaryVariables(reader.getIntAtCell(config[11])),
    // Grabs the target ID, whether we are in combat, how much food and potions we have left, and if our target is kill
    abilities: getAbilities(config, reader, app),
    target:
      reader.getStringAtCell(config[17]) + reader.getStringAtCell(config[18]),
    // Targets current percentage of health
    targetHealth: reader.getIntAtCell(config[19]),
    // Debuffs
    dbSlow: reader.getIntAtCell(config[44]),
    spells: getSpellState(config, reader, currentAbilities),
  };

  return gameState;
}

module.exports = getGameState;
