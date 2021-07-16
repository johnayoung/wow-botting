const robot = require('robotjs');

const ability = 'whirlwind';

module.exports = {
  condition: (s) =>
    s.playerInCombat &&
    s.targetInMeleeRange &&
    s.spells[ability].castable &&
    s.spells[ability].equipped &&
    s.rageCurrent > 25,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 7,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info(`Casting ${ability}`),
};
