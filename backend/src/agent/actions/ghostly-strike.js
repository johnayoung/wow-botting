const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.targetInMeleeRange &&
    s.spells.ghostlyStrike.castable &&
    s.spells.ghostlyStrike.equipped &&
    s.energyCurrent > 45 &&
    s.comboPoints < 4,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 6,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Ghostly Strike'),
};
