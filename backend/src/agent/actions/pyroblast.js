const _ = require('lodash');
const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.buffs.hotStreak &&
    s.spells.pyroblast.castable &&
    s.playerInCombat &&
    s.mana > 10 &&
    // s.spell.maelstromWeapon.active &&
    s.spells.pyroblast.equipped,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => {
    if (s.buffs.hotStreak) {
      return 4;
    }
    return 10;
  },
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting pyroblast'),
};
