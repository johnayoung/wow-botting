const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.playerInCombat &&
    s.buffs.tasteForBlood &&
    s.spells.overpower.castable &&
    s.spells.overpower.equipped &&
    s.rageCurrent > 5,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 2,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting overpower'),
};
