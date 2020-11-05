const actions = require('../actions');

module.exports = {
  actions: {
    sinisterStrike: {
      condition: (s) =>
        s.spells.sinisterStrike.castable &&
        s.spells.sinisterStrike.equipped &&
        s.spells.sinisterStrike.notEnoughMana,
      effect: (s) => {
        s.targetDead = true;
        return s;
      },
      cost: (s) => 2,
    },
    fireball: {
      condition: (s) =>
        s.spells.fireball.castable &&
        s.spells.fireball.equipped &&
        s.spells.fireball.notEnoughMana,
      effect: (s) => {
        s.targetDead = true;
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
