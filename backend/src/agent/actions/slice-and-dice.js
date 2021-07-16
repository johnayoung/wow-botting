const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.targetInMeleeRange &&
    !s.buffs.sliceAndDice &&
    s.spells.sliceAndDice.castable &&
    s.spells.sliceAndDice.equipped &&
    s.energyCurrent > 25 &&
    s.comboPoints >= 4,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 8,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Slice and Dice'),
};
