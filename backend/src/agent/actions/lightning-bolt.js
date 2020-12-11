const _ = require('lodash');
const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.maelstromWeapon &&
    s.spells.lightningBolt.castable &&
    s.playerInCombat &&
    // s.spell.maelstromWeapon.active &&
    s.spells.lightningBolt.equipped,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => {
    if (s.maelstromWeapon) {
      return 8;
    }
    return 10;
  },
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting lightningBolt'),
};
