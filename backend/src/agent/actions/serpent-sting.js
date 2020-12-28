const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    !s.targetDebuffs.serpentSting &&
    s.playerInCombat === true &&
    s.spells.serpentSting.castable &&
    s.spells.serpentSting.equipped &&
    s.mana > 10,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 7,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting serpentSting'),
};
