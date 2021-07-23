const robot = require('robotjs');

const ability = 'rake';
const energyCost = 30;
const comboPointRequirement = 4;

module.exports = {
  condition: (s) =>
    !s.targetDebuffs.rake &&
    s.targetInMeleeRange &&
    s.buffs.catForm &&
    s.spells[ability].castable &&
    s.spells[ability].equipped &&
    s.energyCurrent > energyCost &&
    s.comboPoints < comboPointRequirement,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 8,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info(`Casting ${ability}`),
};
