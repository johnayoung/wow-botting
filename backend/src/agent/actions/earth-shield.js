const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.spell.earthShield.active === false &&
    s.spells.earthShield.castable &&
    s.spells.earthShield.equipped,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 9,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Earth Shield'),
};
