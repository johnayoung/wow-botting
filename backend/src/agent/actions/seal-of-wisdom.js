const robot = require('robotjs');
const _ = require('lodash');

const buff = 'sealOfWisdom';

module.exports = {
  condition: (s) =>
    !s.buffs[buff] && s.spells[buff].castable && s.spells[buff].equipped,
  effect: (s) => {
    const nextState = _.set(s, ['buffs', buff, 'active'], true);
    return nextState;
  },
  cost: (s) => 9,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info(`Casting ${buff}`),
};
