const robot = require('robotjs');

const ability = 'thunderClap';

module.exports = {
  condition: (s) =>
    s.targetInMeleeRange &&
    s.playerInCombat &&
    s.spells[ability].castable &&
    s.spells[ability].equipped &&
    s.rageCurrent >= 20,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 7,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info(`Casting ${ability}`),
};
