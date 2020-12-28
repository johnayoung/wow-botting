const robot = require('robotjs');

const ability = 'arcaneShot';

module.exports = {
  condition: (s) =>
    s.playerInCombat &&
    s.spells[ability].castable &&
    s.spells[ability].equipped &&
    s.manaCurrent >= 243,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 9,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info(`Casting ${ability}`),
};
