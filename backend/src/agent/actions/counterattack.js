const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.targetInMeleeRange &&
    s.spells.counterattack.castable &&
    s.spells.counterattack.equipped &&
    s.manaCurrent > 30,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 10,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Counterattack'),
};
