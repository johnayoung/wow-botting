const actions = require('../actions');

module.exports = {
  actions: {
    sinisterStrike: {
      condition: (s) => s.playerInCombat,
      effect: (s) => {
        s.targetDead = true;
        return s;
      },
      cost: (s) => 1,
    },
    fireball: {
      condition: (s) => !s.playerInCombat,
      effect: (s) => {
        s.playerInCombat = true;
        return s;
      },
      cost: (s) => 2,
    },
  },
  goals: {
    combat: {
      label: 'Combat',
      validate: (prevState, nextState) => nextState.targetDead === true,
      condition: (s) => s.playerInCombat && !s.targetDead,
    },
    pull: {
      label: 'Pull',
      validate: (prevState, nextState) =>
        nextState.playerInCombat === false && nextState.target === true,
      condition: (s) => !s.playerInCombat,
    },
  },
};
