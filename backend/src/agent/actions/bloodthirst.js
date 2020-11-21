const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.inMeleeRange &&
    s.spells.bloodthirst.castable &&
    s.spells.bloodthirst.equipped &&
    s.rageCurrent > 17,
  effect: (s) => {
    s.targetDead = true;
    return s;
  },
  cost: (s) => 7,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Bloodthirst'),
};
