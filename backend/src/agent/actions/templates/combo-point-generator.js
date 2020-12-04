const robot = require('robotjs');

const ability = 'mangleCat';
const energyCost = 34;
const comboPointRequirement = 4;

module.exports = {
  condition: (s) =>
    s.targetInMeleeRange &&
    s.spells[ability].castable &&
    s.spells[ability].equipped &&
    s.energyCurrent > energyCost &&
    s.comboPoints < comboPointRequirement,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 9,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info(`Casting ${ability}`),
};
