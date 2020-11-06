const robot = require('robotjs');

function effect() {
  return robot.keyTap('4');
}

module.exports = {
  condition: (s) =>
    s.spells.sinisterStrike.castable &&
    s.spells.sinisterStrike.equipped &&
    !s.spells.sinisterStrike.notEnoughMana,
  effect: (s) => {
    s.targetDead = true;
    return s;
  },
  cost: (s) => 2,
  activate: () => robot.keyTap('4'),
};
