// Class system used to convert colors to usable data
class SquareReader {
  constructor(pixels) {
    this.pixels = pixels;
  }

  // Robotjs function to find the hexidecimal color of a pixel based on a given x,y coordinate
  getColorAtCell(cell) {
    return this.pixels.colorAt(cell.x, cell.y);
  }

  // Converts a cell's hexideciml color code to decimal data
  getIntAtCell(cell) {
    // Finding the hexidecimal color
    const color = this.getColorAtCell(cell);
    // Converting from base 16 (hexidecimal) to base 10 (decimal)
    return parseInt(color, 16);
  }

  // Converts a cell's hexidecimal color to a 6 point decimal
  getFixedPointAtCell(cell) {
    return this.getIntAtCell(cell) / 100000;
  }

  // Converts a cell's hexidecimal color to a 3 character string
  getStringAtCell(cell) {
    // Converting cell coordinates to a hexdecimal color
    let color = this.getIntAtCell(cell);
    // Checking that color exists
    if (color && color !== 0) {
      color = color.toString();
      let word = '';
      // Iterates through each ASCII code and sets it equal to relevant character
      for (let i = 0; i < 3; i++) {
        const char = color.slice(i * 2, (i + 1) * 2);
        word += String.fromCharCode(char);
      }
      // Removes null bytes if any, but leaves spaces
      word = word.replace('\0', '');
      return word;
      // If data input is 0, outputs empty string. e.g. no target
    }
    return '';
  }
}

module.exports = SquareReader;
