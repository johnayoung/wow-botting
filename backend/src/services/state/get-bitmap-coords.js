const robot = require('robotjs');
const path = require('path');
const fs = require('fs');
const bufferToPng = require('./buffer-to-png');

const baseDir = path.resolve(__dirname);

const AUTO_TOGGLE_DATATOCOLOR = false;
const startX = 2;
const startY = 32;

// Step 1: Input # of frames
// Step 2: type "/dc" ingame
// Step 3: Run function
// Step 4: Adjust xMax in get-game-state.js
function configureDataCoords() {
  const metadataColor = robot.getPixelColor(startX, startY);
  const metaData = parseInt(metadataColor, 16);

  return new Promise((resolve, reject) => {
    // const numberOfFrames = parseInt(metaData.toString().slice(-2));
    const numberOfFrames = 130;
    const frameRows = parseInt(metaData.toString().slice(-5, -3));
    // Size of data frames. Only needs a rough estimation for the bitmap. Resolution and rounding alters dimensions, so there is a multiplier of 2 to correct for potentially missed pixels.
    const cellSize = parseInt(metaData.toString().slice(-7, -5)) * 2;

    console.log({ metadataColor, numberOfFrames, frameRows, cellSize });

    // Numbers of frame columns
    const frameCols = Math.ceil(numberOfFrames / frameRows);
    // Starting point X of bitmap
    const bitMapX1 = startX;
    // Starting point Y of bitmap
    const bitMapY1 = startY;
    // Width of bitmap / Ending point
    const bitMapX2 = frameCols * cellSize;
    // Height of bitmap / Ending point
    const bitMapY2 = frameRows * cellSize;
    // Array to be filled with objects containing coordinates of data points
    const dataPointCoordinateArray = [
      {
        x: bitMapX1,
        y: bitMapY1,
      },
    ];
    console.log({ bitMapX1, bitMapY1, bitMapX2, bitMapY2 });
    // Saving bitmap
    const dataBitmap = robot.screen.capture(
      bitMapX1,
      bitMapY1,
      bitMapX2,
      bitMapY2
    );
    console.log({
      numberOfFrames,
      bitMapX1,
      bitMapY1,
      bitMapX2,
      bitMapY2,
      dataBitmap,
    });
    bufferToPng(dataBitmap.image, bitMapX2, bitMapY2);
    // Loops through total number of data frames excluding the meta data frame
    for (let frame = 1; frame < numberOfFrames + 1; frame++) {
      // Loops through every pixel of bitmap horizontally...
      for (let pixelX = 0; pixelX < bitMapX2; pixelX++) {
        // ...and vertically
        for (let pixelY = 0; pixelY < bitMapY2; pixelY++) {
          const color = dataBitmap.colorAt(pixelX, pixelY);
          if (parseInt(color, 16) === frame) {
            dataPointCoordinateArray.push({ x: pixelX, y: pixelY + startY });

            // Breaks out of 2nd and 3rd loop
            pixelX = Infinity;
            pixelY = Infinity;
          }
          // If bitmap meta data is ridicuously large, cancel process
          if (bitMapY2 > 1000 || bitMapX2 > 1000) {
            reject();
          }
        }
      }
    }

    console.log(dataPointCoordinateArray);

    // Writing array of frame coordinate objects to a .json file. There must be a minimum of 10 data points found, otherwise no new file will be written.
    if (dataPointCoordinateArray.length > 10) {
      fs.writeFileSync(
        path.join(baseDir, 'coordinates.json'),
        JSON.stringify(dataPointCoordinateArray)
      );
      console.log('New frame coordinates saved.');
      // If AUTO_TOGGLE_DATATOCOLOR is on, changes back to regular DataToColor display when complete.
      if (AUTO_TOGGLE_DATATOCOLOR) {
        robot.setKeyboardDelay(100);
        robot.keyTap('enter');
        robot.typeStringDelayed('/dc', 400);
        robot.keyTap('enter');
        robot.setKeyboardDelay(0);
        console.log('DataToColor display initialized.');
      }
      resolve();
    } else {
      console.error(
        'ERROR: Game Client is not open, left window is not primary monitor, and/or Game Client is on incorrect window.'
      );
      console.log('Type: /dc [enter] to enter bitmap configuration mode.');
    }
  });
}

configureDataCoords();
