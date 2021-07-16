const robot = require('robotjs');

const ability = 'mortalStrike';

module.exports = {
  condition: (s) =>
    s.playerInCombat &&
    s.targetInMeleeRange &&
    s.spells[ability].castable &&
    s.spells[ability].equipped &&
    s.rageCurrent > 30,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 7,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info(`Casting ${ability}`),
};
