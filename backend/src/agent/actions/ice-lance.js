const _ = require('lodash');
const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.playerInCombat &&
    s.spells.iceLance.castable &&
    s.spells.iceLance.equipped,
  // s.spell.maelstromWeapon.active,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => {
    if (s.isFrozen) {
      return 7;
    }

    return 10;
  },
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Ice Lance'),
};
