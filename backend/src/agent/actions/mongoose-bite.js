const robot = require('robotjs');

const ability = 'mongooseBite';

module.exports = {
  condition: (s) =>
    s.playerInCombat &&
    s.targetInMeleeRange &&
    s.spells[ability].castable &&
    s.spells[ability].equipped &&
    s.manaCurrent >= 100,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 9,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info(`Casting ${ability}`),
};
