const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    !s.buffs.iceArmor &&
    s.spells.iceArmor.castable &&
    s.spells.iceArmor.equipped,
  effect: (s) => {
    s.buffs.iceArmor = {};
    return s;
  },
  cost: (s) => 9,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Ice Armor'),
};
