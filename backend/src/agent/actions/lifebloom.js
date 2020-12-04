const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.playerInCombat &&
    s.spell.metamorphosis.active !== true &&
    s.spell.lifebloom.active === false &&
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
