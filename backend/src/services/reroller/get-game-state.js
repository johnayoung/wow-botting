const { readFileSync } = require('fs');
const { resolve } = require('path');
const robot = require('robotjs');
const SquareReader = require('../state/square-reader');

const raw = readFileSync(
  resolve(__dirname, '..', 'state', 'coordinates.json'),
  'utf-8'
);
const config = JSON.parse(raw);

const spellsToTarget = ['Stealth', 'Sprint', 'Evasion', 'Gouge'];

function getGameState(app) {
  const pixel = {
    xMin: 0,
    yMin: 0,
    xMax: 299,
    yMax: 35,
  };

  const bitmap = robot.screen.capture(
    pixel.xMin,
    pixel.yMin,
    pixel.xMax,
    pixel.yMax
  );
  const reader = new SquareReader(bitmap);

  const spell1 = reader.getIntAtCell(config[2]);
  const spell2 = reader.getIntAtCell(config[3]);
  const spell3 = reader.getIntAtCell(config[4]);
  const spell4 = reader.getIntAtCell(config[5]);

  const gameState = {
    name: 'reroller',
    // test: reader.getIntAtCell(config[1]),
    spells: [spell1, spell2, spell3, spell4].filter((spell) => spell !== 0),
    spell1: reader.getIntAtCell(config[2]),
    spell2: reader.getIntAtCell(config[3]),
    spell3: reader.getIntAtCell(config[4]),
    spell4: reader.getIntAtCell(config[5]),
  };

  return gameState;
}

module.exports = getGameState;
