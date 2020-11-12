const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.inMeleeRange &&
    s.spells.sinisterStrike.castable &&
    s.spells.sinisterStrike.equipped &&
    s.energyCurrent > 40 &&
    s.comboPoints < 4,
  effect: (s) => {
    s.targetDead = true;
    return s;
  },
  cost: (s) => 10,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Sinister Strike'),
};
