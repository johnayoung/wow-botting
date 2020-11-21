const robot = require('robotjs');

module.exports = {
  condition: (s) => {
    // Sudden Death
    if (s.spell.suddenDeath.active === true) {
      return (
        s.inMeleeRange &&
        s.spells.execute.castable &&
        s.spells.execute.equipped &&
        s.rageCurrent > 10
      );
    }

    // Normal
    return (
      s.targetHealth <= 20 &&
      s.inMeleeRange &&
      s.spells.execute.castable &&
      s.spells.execute.equipped &&
      s.rageCurrent > 15
    );
  },
  effect: (s) => {
    s.targetDead = true;
    return s;
  },
  cost: (s) => {
    if (s.spell.suddenDeath.active === true) {
      return 1;
    }
    return 8;
  },
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Execute'),
};
