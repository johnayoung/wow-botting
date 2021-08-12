const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.targetInMeleeRange &&
    s.spells.hemorrhage.castable &&
    s.spells.hemorrhage.equipped &&
    s.energyCurrent > 35 &&
    s.comboPoints < 4,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 9,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Hemo'),
};
