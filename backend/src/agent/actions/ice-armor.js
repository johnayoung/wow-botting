const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.spell.iceArmor.active === false &&
    s.spells.iceArmor.castable &&
    s.spells.iceArmor.equipped,
  effect: (s) => {
    s.spell.iceArmor.active = true;
    return s;
  },
  cost: (s) => 9,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Ice Armor'),
};
