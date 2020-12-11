const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.targetInMeleeRange &&
    s.spells.cleave.castable &&
    s.spells.cleave.equipped &&
    s.rageCurrent > 20,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 10,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Cleave'),
};
