const actions = require('../actions');

module.exports = {
  actions: {
    sinisterStrike: {
      condition: (s) =>
        s.inMeleeRange &&
        s.spells.sinisterStrike.castable &&
        s.spells.sinisterStrike.equipped &&
        !s.spells.sinisterStrike.notEnoughMana,
      effect: (s) => {
        s.targetDead = true;
        return s;
      },
      cost: (s) => 2,
    },
    fireball: {
      condition: (s) =>
        !s.inMeleeRange &&
        s.spells.fireball.castable &&
        s.spells.fireball.equipped &&
        !s.spells.fireball.notEnoughMana,
      effect: (s) => {
        s.targetDead = true;
        return s;
      },
      cost: (s) => 2,
    },
    pull: {
      condition: (s) =>
        // s.spells.fireball.castable &&
        // s.spells.fireball.equipped &&
        // !s.spells.fireball.notEnoughMana &&
        s.playerInCombat === false,
      effect: (s) => {
        s.playerInCombat = true;
        return s;
      },
      cost: (s) => 2,
    },
  },
  goals: {
    targetDead: {
      label: 'Target is dead',
      validate: (prevState, nextState) => nextState.targetDead === true,
      condition: (s) => s.playerInCombat && !s.targetDead,
    },
    // combat: {
    //   label: 'Combat',
    //   validate: (prevState, nextState) => nextState.targetDead === true,
    //   condition: (s) => s.playerInCombat && !s.targetDead,
    // },
    pull: {
      label: 'Pull',
      validate: (prevState, nextState) =>
        prevState.playerInCombat === false && prevState.target,
      condition: (s) => !s.playerInCombat,
    },
  },
};
