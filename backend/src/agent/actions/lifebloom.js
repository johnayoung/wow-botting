const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.playerInCombat &&
    !s.buffs.metamorphosis &&
    !s.buffs.lifebloom &&
    s.spells.lifebloom.castable &&
    s.spells.lifebloom.equipped &&
    s.health <= 60 &&
    s.mana > 10,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 2,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting lifebloom'),
};
