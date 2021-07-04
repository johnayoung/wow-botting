const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.targetInMeleeRange &&
    !s.buffs.meditate &&
    s.spells.meditate.castable &&
    s.spells.meditate.equipped &&
    s.energyCurrent > 35 &&
    s.comboPoints >= 2,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 7,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting meditate'),
};
