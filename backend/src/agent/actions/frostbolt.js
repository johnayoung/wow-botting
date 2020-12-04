const _ = require('lodash');
const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.spells.frostbolt.castable &&
    s.playerInCombat &&
    // s.spell.maelstromWeapon.active &&
    s.spells.frostbolt.equipped,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => {
    if (_.has(s, ['spell', 'maelstromWeapon', 'active'])) {
      if (s.spell.maelstromWeapon.active) {
        return 6;
      }
      return 10;
    }
    return 10;
  },
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Frostbolt'),
};
