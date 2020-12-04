const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.spell.markOfTheWild.active === false &&
    s.spells.markOfTheWild.castable &&
    s.spells.markOfTheWild.equipped,
  effect: (s) => {
    s.spell.markOfTheWild.active = true;
    return s;
  },
  cost: (s) => 9,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting MOTW'),
};
