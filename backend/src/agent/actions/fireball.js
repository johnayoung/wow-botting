const _ = require('lodash');
const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.maelstromWeapon &&
    s.spells.fireball.castable &&
    s.playerInCombat &&
    s.mana > 10 &&
    // s.spell.maelstromWeapon.active &&
    s.spells.fireball.equipped,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => {
    if (s.maelstromWeapon) {
      return 7;
    }
    return 10;
  },
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting fireball'),
};
