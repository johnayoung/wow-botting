const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    !s.buffs.demonArmor &&
    s.spells.demonArmor.castable &&
    s.spells.demonArmor.equipped,
  effect: (s) => {
    s.buffs.demonArmor = {};
    return s;
  },
  cost: (s) => 9,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Demon Armor'),
};
