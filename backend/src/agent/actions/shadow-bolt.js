const _ = require('lodash');
const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    (s.buffs.shadowTrance || s.buffs.backlash) &&
    s.spells.shadowBolt.castable &&
    s.playerInCombat &&
    s.mana > 30 &&
    // s.spell.maelstromWeapon.active &&
    s.spells.shadowBolt.equipped,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => {
    if (s.buffs.shadowTrance || s.buffs.backlash) {
      return 7;
    }
  },
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting shadowBolt'),
};
