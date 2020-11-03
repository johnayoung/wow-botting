const DataURIParser = require('datauri/parser');
const Jimp = require('jimp');

function bufferToPng(buffer, width, height) {
  const fileName = 'test.png';

  const imageToWrite = new Jimp(
    { data: buffer, width, height },
    (err, image) => {
      if (err) {
        console.log(err);
      }

      image.writeAsync(fileName);
    }
  );

  return imageToWrite;
}

module.exports = bufferToPng;
