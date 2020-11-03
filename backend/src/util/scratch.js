const robot = require('robotjs');
const assignBinaryVariables = require('./assign-binary-variables');
const SquareReader = require('./square-reader');

const config = [
  { x: 1, y: 1 },
  { x: 4, y: 32 },
  { x: 6, y: 32 },
  { x: 8, y: 32 },
  { x: 10, y: 32 },
  { x: 13, y: 32 },
  { x: 15, y: 32 },
  { x: 17, y: 32 },
  { x: 20, y: 32 },
  { x: 22, y: 32 },
  { x: 24, y: 32 },
  { x: 26, y: 32 },
  { x: 29, y: 32 },
  { x: 31, y: 32 },
];

function getRandomInt(max) {
  return Math.floor(Math.random() * Math.floor(max));
}

function main() {
  const [, xcoord, ycoord, direction, zone, corpseX, corpseY] = config;

  const cellSize = 3;
  const pixel = {
    xMin: 0,
    yMin: 0,
    xMax: 32,
    yMax: 2304,
  };

  const bitmap = robot.screen.capture(
    pixel.xMin,
    pixel.yMin,
    pixel.xMax,
    pixel.yMax
  );
  const reader = new SquareReader(bitmap);

  console.log({
    xcoord: reader.getFixedPointAtCell(xcoord) * 10,
    ycoord,
    direction: reader.getFixedPointAtCell(direction),
    manaCurrent: reader.getIntAtCell(config[13]),
    variables: reader.getIntAtCell(config[8]),
    ...assignBinaryVariables(reader.getIntAtCell(config[8])),
    color: reader.getColorAtCell(xcoord),
  });
}

const interval = 1000;

setInterval(main, interval);
