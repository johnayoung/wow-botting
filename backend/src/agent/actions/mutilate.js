const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.playerInCombat &&
    s.targetInMeleeRange &&
    s.spells.mutilate.castable &&
    s.spells.mutilate.equipped &&
    // s.comboPoints < 4 &&
    s.energyCurrent > 50,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 8,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Mutilate'),
};
