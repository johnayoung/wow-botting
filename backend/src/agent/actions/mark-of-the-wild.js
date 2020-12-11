const _ = require('lodash');
const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    !s.buffs.markOfTheWild &&
    s.spells.markOfTheWild.castable &&
    s.spells.markOfTheWild.equipped,
  effect: (s) => {
    const nextState = _.set(s, ['buffs', 'markOfTheWild', 'active'], true);
    return nextState;
  },
  cost: (s) => 9,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting MOTW'),
};
