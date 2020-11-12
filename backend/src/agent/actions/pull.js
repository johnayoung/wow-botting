const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    // s.spells.fireball.castable &&
    // s.spells.fireball.equipped &&
    // !s.spells.fireball.notEnoughMana &&
    s.playerInCombat === false,
  effect: (s) => {
    s.playerInCombat = true;
    return s;
  },
  cost: (s) => 10,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Pulling'),
};
