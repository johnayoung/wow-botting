const defaultCoords = [{ x: 2, y: 32 }];

const init = () => {
  const max = 484;
  const coords = [];
  let x = 2;
  const pixel = 5;
  let keepGoing = true;

  while (keepGoing) {
    coords.push({ x, y: 32 });

    x += pixel;

    if (x > max) {
      keepGoing = false;
    }
  }

  console.log(coords);
};

init();
