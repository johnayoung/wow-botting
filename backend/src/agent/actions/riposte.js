const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.targetInMeleeRange &&
    s.spells.riposte.castable &&
    s.spells.riposte.equipped &&
    s.energyCurrent > 10 &&
    s.comboPoints < 4,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 9,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Sinister Strike'),
};
