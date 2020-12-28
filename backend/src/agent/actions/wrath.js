const _ = require('lodash');
const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.wildWrath &&
    s.spells.wrath.castable &&
    s.playerInCombat &&
    s.mana > 10 &&
    // s.spell.maelstromWeapon.active &&
    s.spells.wrath.equipped,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => {
    if (s.wildWrath) {
      return 7;
    }
    return 10;
  },
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting wrath'),
};
