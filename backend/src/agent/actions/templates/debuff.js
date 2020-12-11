const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    !s.targetDebuffs.rend &&
    s.playerInCombat === true &&
    s.spells.rend.castable &&
    s.spells.rend.equipped &&
    s.rageCurrent >= 10,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 7,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting corruption'),
};
