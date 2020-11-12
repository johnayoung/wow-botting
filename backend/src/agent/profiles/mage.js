const {
  rejuvenation,
  lightningShield,
  sinisterStrike,
  eviscerate,
  heroicStrike,
  execute,
  pull,
} = require('../actions');
const goals = require('../goals');

module.exports = {
  mapping: {
    rejuvenation: 'a',
    lightningShield: 'c',
    sinisterStrike: '5',
    eviscerate: '6',
    heroicStrike: '4',
    execute: 'w',
    pull: null,
  },
  actions: {
    rejuvenation,
    lightningShield,
    sinisterStrike,
    eviscerate,
    heroicStrike,
    execute,
    pull,
  },
  goals,
};
