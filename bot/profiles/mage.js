const actions = require('../actions');

module.exports = {
  actions: {
    rejuvenation: {
      condition: (s) =>
        s.spell.rejuvenation.active === false &&
        s.spells.rejuvenation.castable &&
        s.spells.rejuvenation.equipped &&
        s.health < 85 &&
        s.mana > 30,
      effect: (s) => {
        s.targetDead = true;
        return s;
      },
      cost: (s) => 1,
    },
    lightningShield: {
      condition: (s) =>
        s.spell.lightningShield.active === false &&
        s.spells.lightningShield.castable &&
        s.spells.lightningShield.equipped,
      effect: (s) => {
        s.targetDead = true;
        return s;
      },
      cost: (s) => 9,
    },
    sinisterStrike: {
      condition: (s) =>
        s.inMeleeRange &&
        s.spells.sinisterStrike.castable &&
        s.spells.sinisterStrike.equipped &&
        s.energyCurrent > 40 &&
        s.comboPoints < 4,
      effect: (s) => {
        s.targetDead = true;
        return s;
      },
      cost: (s) => 10,
    },
    eviscerate: {
      condition: (s) =>
        s.inMeleeRange &&
        s.spells.eviscerate.castable &&
        s.spells.eviscerate.equipped &&
        s.energyCurrent > 35 &&
        s.comboPoints >= 4,
      effect: (s) => {
        s.targetDead = true;
        return s;
      },
      cost: (s) => 10,
    },
    heroicStrike: {
      condition: (s) =>
        s.inMeleeRange &&
        s.spells.heroicStrike.castable &&
        s.spells.heroicStrike.equipped &&
        s.rageCurrent > 15,
      effect: (s) => {
        s.targetDead = true;
        return s;
      },
      cost: (s) => 10,
    },
    execute: {
      condition: (s) =>
        s.targetHealth <= 20 &&
        s.inMeleeRange &&
        s.spells.execute.castable &&
        s.spells.execute.equipped &&
        s.rageCurrent > 15,
      effect: (s) => {
        s.targetDead = true;
        return s;
      },
      cost: (s) => 8,
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
