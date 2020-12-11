const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    !s.buffs.metamorphosis &&
    !s.buffs.waterShield &&
    s.spells.waterShield.castable &&
    s.spells.waterShield.equipped,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 9,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Water Shield'),
};
