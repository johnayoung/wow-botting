const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.isFrozen && s.spells.deepFreeze.castable && s.spells.deepFreeze.equipped,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 7,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Deep Freeze'),
};
