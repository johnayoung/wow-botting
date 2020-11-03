const { readFileSync } = require('fs');
const { resolve } = require('path');
const robot = require('robotjs');
const bufferToPng = require('./buffer-to-png');
const assignBinaryVariables = require('./assign-binary-variables');
const SquareReader = require('./square-reader');
const coordinates = require('./coordinates.json');

const raw = readFileSync(resolve(__dirname, 'coordinates.json'), 'utf-8');
const config = JSON.parse(raw);
// const config = [
//   { x: 1, y: 1 },
//   { x: 5, y: 32 },
//   { x: 7, y: 32 },
//   { x: 10, y: 32 },
//   { x: 13, y: 32 },
//   { x: 16, y: 32 },
//   { x: 19, y: 32 },
//   { x: 22, y: 32 },
//   { x: 25, y: 32 },
//   { x: 28, y: 32 },
//   { x: 31, y: 32 },
//   { x: 34, y: 32 },
//   { x: 37, y: 32 },
//   { x: 40, y: 32 },
//   { x: 43, y: 32 },
//   { x: 46, y: 32 },
//   { x: 49, y: 32 },
//   { x: 52, y: 32 },
// ];

// const bottomY = 107;
// const config = [
//   { x: 1, y: 1 },
//   { x: 4, y: bottomY },
//   { x: 6, y: bottomY },
//   { x: 8, y: bottomY },
//   { x: 10, y: bottomY },
//   { x: 13, y: bottomY },
//   { x: 15, y: bottomY },
//   { x: 17, y: bottomY },
//   { x: 20, y: bottomY },
//   { x: 22, y: bottomY },
//   { x: 24, y: bottomY },
//   { x: 26, y: bottomY },
//   { x: 29, y: bottomY },
//   { x: 31, y: bottomY },
// ];

function getRandomInt(max) {
  return Math.floor(Math.random() * Math.floor(max));
}

function getGameState() {
  const [, , xcoord, ycoord, direction, zone, corpseX, corpseY] = config;

  const pixel = {
    xMin: 0,
    yMin: 0,
    xMax: 73,
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
    level: reader.getIntAtCell(config[15]),
    // range detects if a target range. Bases information off of action slot 2, 3, and 4. Outputs: 50, 35, 30, or 20
    range: reader.getIntAtCell(config[16]),
    // Grabs the target ID, whether we are in combat, how much food and potions we have left, and if our target is kill
    target:
      reader.getStringAtCell(config[17]) + reader.getStringAtCell(config[18]),
    // Targets current percentage of health
    targetHealth: reader.getIntAtCell(config[19]),
  };

  console.log(gameState);

  return gameState;
}

module.exports = getGameState;
