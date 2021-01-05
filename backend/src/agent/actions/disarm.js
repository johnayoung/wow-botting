const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.targetInMeleeRange &&
    s.spells.disarm.castable &&
    s.spells.disarm.equipped &&
    s.rageCurrent > 15,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 4,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting disarm'),
};
