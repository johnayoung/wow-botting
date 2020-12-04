const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.spell.fingersOfFrost.active &&
    s.spells.deepFreeze.castable &&
    s.spells.deepFreeze.equipped,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 7,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Deep Freeze'),
};
