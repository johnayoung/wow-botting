const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.debuffs.corruption.active === false &&
    s.playerInCombat === true &&
    s.spells.corruption.castable &&
    s.spells.corruption.equipped &&
    s.mana > 30,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 7,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting corruption'),
};
