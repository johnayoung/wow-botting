const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.targetInMeleeRange &&
    s.spells.bloodthirst.castable &&
    s.spells.bloodthirst.equipped &&
    s.rageCurrent > 20,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => {
    if (s.buffs.bloodsurge) {
      return 6;
    }
    return 7;
  },
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Bloodthirst'),
  
};
