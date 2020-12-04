const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    // s.spell.riptide.active === false &&
    s.spells.riptide.castable &&
    s.spells.riptide.equipped &&
    s.health < 85 &&
    s.mana > 30,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 1,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting riptide'),
};
