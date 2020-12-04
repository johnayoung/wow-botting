const robot = require('robotjs');
const _ = require('lodash');

module.exports = {
  condition: (s) =>
    !s.lowMana &&
    !s.buffs.powerWordFortitude &&
    s.spells.powerWordFortitude.castable &&
    s.spells.powerWordFortitude.equipped,
  effect: (s) => {
    // s.buffs.powerWordFortitude.active = true;
    const nextState = _.set(s, ['buffs', 'powerWordFortitude', 'active'], true);
    return nextState;
  },
  cost: (s) => 9,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Power Word: Fortitude'),
};
