const _ = require('lodash');
const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.maelstromWeapon &&
    s.spells.frostbolt.castable &&
    s.playerInCombat &&
    s.mana > 30 &&
    // s.spell.maelstromWeapon.active &&
    s.spells.frostbolt.equipped,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => {
    if (s.maelstromWeapon) {
      return 6;
    }
    return 10;
  },
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting frostbolt'),
};
