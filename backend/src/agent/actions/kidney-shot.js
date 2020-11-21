const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.inMeleeRange &&
    s.spells.kidneyShot.castable &&
    s.spells.kidneyShot.equipped &&
    s.energyCurrent > 25 &&
    // s.notUnderCC &&,
    s.comboPoints >= 4,
  effect: (s) => {
    s.targetDead = true;
    return s;
  },
  cost: (s) => 9,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Kidney Shot'),
};
