const _ = require('lodash');
const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.maelstromWeapon &&
    s.health < 50 &&
    s.spells.lesserHealingWave.castable &&
    s.playerInCombat &&
    // s.spell.maelstromWeapon.active &&
    s.spells.lesserHealingWave.equipped,
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
  log: (l) => l.info('Casting lesserHealingWave'),
};
