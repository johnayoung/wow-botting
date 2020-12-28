const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.targetInMeleeRange &&
    s.targetDebuffs.frostbolt &&
    s.spells.blastWave.castable &&
    s.spells.blastWave.equipped &&
    s.manaCurrent >= 500,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 6,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Blast Wave'),
};
