const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.targetHealth <= 20 &&
    s.inMeleeRange &&
    s.spells.execute.castable &&
    s.spells.execute.equipped &&
    s.rageCurrent > 15,
  effect: (s) => {
    s.targetDead = true;
    return s;
  },
  cost: (s) => 8,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Execute'),
};
