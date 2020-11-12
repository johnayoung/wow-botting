const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.inMeleeRange &&
    s.spells.eviscerate.castable &&
    s.spells.eviscerate.equipped &&
    s.energyCurrent > 35 &&
    s.comboPoints >= 4,
  effect: (s) => {
    s.targetDead = true;
    return s;
  },
  cost: (s) => 10,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Eviscerate'),
};
