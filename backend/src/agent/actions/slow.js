const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.debuffs.slow.active === false &&
    s.playerInCombat === true &&
    s.spells.slow.castable &&
    s.spells.slow.equipped &&
    s.mana > 30,
  effect: (s) => {
    s.targetDead = true;
    return s;
  },
  cost: (s) => 7,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting slow'),
};
