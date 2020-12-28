const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.targetInMeleeRange &&
    s.spells.sinisterStrike.castable &&
    s.spells.sinisterStrike.equipped &&
    s.energyCurrent > 45 &&
    s.comboPoints < 4,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 9,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Sinister Strike'),
};
