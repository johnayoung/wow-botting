const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.inMeleeRange &&
    s.spells.heroicStrike.castable &&
    s.spells.heroicStrike.equipped &&
    s.rageCurrent > 15,
  effect: (s) => {
    s.targetDead = true;
    return s;
  },
  cost: (s) => 10,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Heroic Strike'),
};
