const _ = require('lodash');
const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.maelstromWeapon &&
    s.spells.fireball.castable &&
    s.spells.fireball.equipped &&
    s.spells.bloodlust.castable &&
    s.spells.bloodlust.equipped &&
    s.playerInCombat &&
    s.mana > 10,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => {
    if (s.maelstromWeapon) {
      return 4;
    }
    return 10;
  },
  act: (k) => robot.keyTap('5', 'shift'),
  log: (l) => l.info('Casting bloodlust'),
};
