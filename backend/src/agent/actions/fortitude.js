const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.spell.powerWordFortitude.active === false &&
    s.spells.powerWordFortitude.castable &&
    s.spells.powerWordFortitude.equipped,
  effect: (s) => {
    s.spell.powerWordFortitude.active = true;
    return s;
  },
  cost: (s) => 9,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Power Word: Fortitude'),
};
