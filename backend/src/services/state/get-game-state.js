const { readFileSync } = require('fs');
const { resolve } = require('path');
const robot = require('robotjs');
const getSpellState = require('./get-spell-state');
const bufferToPng = require('./buffer-to-png');
const assignBinaryVariables = require('./assign-binary-variables');
const SquareReader = require('./square-reader');

const raw = readFileSync(resolve(__dirname, 'coordinates.json'), 'utf-8');
const config = JSON.parse(raw);

function getRandomInt(max) {
  return Math.floor(Math.random() * Math.floor(max));
}

function getGameState() {
  const [, , xcoord, ycoord, direction, zone, corpseX, corpseY] = config;

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
  const healthMax = reader.getIntAtCell(config[11]);
  const healthCurrent = reader.getIntAtCell(config[12]);

  // Mana stats
  const manaMax = reader.getIntAtCell(config[13]);
  const manaCurrent = reader.getIntAtCell(config[14]);

  const energyMax = reader.getIntAtCell(config[15]);
  const energyCurrent = reader.getIntAtCell(config[16]);
  const comboPoints = reader.getIntAtCell(config[17]);

  const rageMax = reader.getIntAtCell(config[19]);
  const rageCurrent = reader.getIntAtCell(config[20]);

  const gameState = {
    name: 'track-game-state',
    xcoord: reader.getFixedPointAtCell(xcoord) * 10,
    ycoord: reader.getFixedPointAtCell(ycoord) * 10,
    direction: reader.getFixedPointAtCell(direction),
    zone: reader
      .getStringAtCell(config[5])
      .concat(reader.getStringAtCell(config[6])),
    corpseX: reader.getFixedPointAtCell(config[7]),
    corpseY: reader.getFixedPointAtCell(config[8]),
    ...assignBinaryVariables(reader.getIntAtCell(config[9])),
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
    level: reader.getIntAtCell(config[18]),
    // range detects if a target range. Bases information off of action slot 2, 3, and 4. Outputs: 50, 35, 30, or 20
    range: reader.getIntAtCell(config[16]),
    // Grabs the target ID, whether we are in combat, how much food and potions we have left, and if our target is kill
    target:
      reader.getStringAtCell(config[17]) + reader.getStringAtCell(config[18]),
    // Targets current percentage of health
    targetHealth: reader.getIntAtCell(config[19]),
    spells: getSpellState(config, reader),
  };

  return gameState;
}

module.exports = getGameState;
