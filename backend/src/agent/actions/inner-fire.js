const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.spell.innerFire.active === false &&
    s.spells.innerFire.castable &&
    s.spells.innerFire.equipped,
  effect: (s) => {
    s.targetDead = true;
    return s;
  },
  cost: (s) => 9,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Lightning Shield'),
};
