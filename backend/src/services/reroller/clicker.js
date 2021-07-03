const robot = require('robotjs');
const activeWin = require('active-win');

function moveToAndClick(coordinate) {
  const { x, y } = coordinate;
  robot.moveMouse(x, y);

  robot.mouseClick();
}

async function spamReroll() {
  const { title } = await activeWin().catch((e) => 'cant get window');

  if (title === 'World of Warcraft') {
    await robot.setMouseDelay(2000);
    return robot.keyTap('z');
  }

  console.log('pausing clicker');
}

async function findAndUnlearnSpell(coords, spell) {
  const clickSpell = coords.clickSpell[spell];
  const unlearnSpell = coords.unlearnSpell[spell];

  const { title } = await activeWin().catch((e) => 'cant get window');

  if (title === 'World of Warcraft') {
    await moveToAndClick(clickSpell);
    await robot.setMouseDelay(100);
    await moveToAndClick(unlearnSpell);
    await robot.setMouseDelay(200);
    await robot.keyTap('c');
    await robot.keyTap('c');

    return;
  }

  console.log('pausing clicker');
}

async function handleUnlearn(coords, spell, tameBeast = false) {
  if (tameBeast) {
    return spamReroll();
  }

  return findAndUnlearnSpell(coords, spell);
}

module.exports = {
  handleUnlearn,
};
