const _ = require('lodash');
const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.isFrozen &&
    s.playerInCombat &&
    s.spells.iceLance.castable &&
    s.spells.iceLance.equipped,
  // s.spell.maelstromWeapon.active,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 7,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Ice Lance'),
};
