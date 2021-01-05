const _ = require('lodash');
const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.targetPurgeable &&
    s.spells.purge.castable &&
    s.playerInCombat &&
    s.mana > 30 &&
    // s.spell.maelstromWeapon.active &&
    s.spells.purge.equipped,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => {
    if (s.targetPurgeable) {
      return 3;
    }
    return 10;
  },
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting purge'),
};
