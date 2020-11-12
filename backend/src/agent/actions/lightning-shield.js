const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.spell.lightningShield.active === false &&
    s.spells.lightningShield.castable &&
    s.spells.lightningShield.equipped,
  effect: (s) => {
    s.targetDead = true;
    return s;
  },
  cost: (s) => 9,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Lightning Shield'),
};
