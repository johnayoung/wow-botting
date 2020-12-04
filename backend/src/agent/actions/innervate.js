const robot = require('robotjs');
const _ = require('lodash');

const buff = 'innervate';

module.exports = {
  condition: (s) =>
    s.playerInCombat &&
    s.mana <= 55 &&
    s.spells[buff].castable &&
    s.spells[buff].equipped,
  effect: (s) => {
    const nextState = _.set(s, ['buffs', buff, 'active'], true);
    return nextState;
  },
  cost: (s) => 9,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info(`Casting ${buff}`),
};
