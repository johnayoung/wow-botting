const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.targetInMeleeRange &&
    s.spells.hamstring.castable &&
    s.spells.hamstring.equipped &&
    s.rageCurrent > 5,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 9,
  act: (k) => robot.keyTap('f5'),
  log: (l) => l.info('Casting Hamstring'),
};
