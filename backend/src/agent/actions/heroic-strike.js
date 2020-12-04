const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.targetInMeleeRange &&
    s.spells.heroicStrike.castable &&
    s.spells.heroicStrike.equipped &&
    s.rageCurrent > 50,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 10,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Heroic Strike'),
};
