const robot = require('robotjs');

const ability = 'thunderstorm';

module.exports = {
  condition: (s) =>
    s.targetInMeleeRange &&
    s.playerInCombat &&
    s.spells[ability].castable &&
    s.spells[ability].equipped &&
    s.manaCurrent >= 5,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 7,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info(`Casting ${ability}`),
};
