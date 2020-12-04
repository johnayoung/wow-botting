const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.spells.desperatePrayer.castable &&
    s.spells.desperatePrayer.equipped &&
    s.health < 10 &&
    s.mana > 5,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 1,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Desperate Prayer'),
};
