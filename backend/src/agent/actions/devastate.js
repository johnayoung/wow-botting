const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.targetInMeleeRange &&
    s.spells.devastate.castable &&
    s.spells.devastate.equipped &&
    s.rageCurrent > 15,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 8,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Devastate'),
};
