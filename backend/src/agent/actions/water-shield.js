const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.spell.waterShield.active === false &&
    s.spells.waterShield.castable &&
    s.spells.waterShield.equipped,
  effect: (s) => {
    s.targetDead = true;
    return s;
  },
  cost: (s) => 9,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Water Shield'),
};
