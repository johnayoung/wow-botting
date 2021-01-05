const robot = require('robotjs');

const ability = 'wyvernSting';
const key = 'f8';

const mods = {
  target: null,
  focus: 'shift',
  mouseover: 'alt',
};

function getModifier(targetToInterrupt) {
  if (targetToInterrupt) {
    return mods[targetToInterrupt];
  }
  return null;
}

// First one that is castable, usable, etc.

module.exports = {
  condition: (s) => {
    const [targetToInterrupt] = Object.keys(s.targetsToInterrupt).filter(
      (t) => s.targetsToInterrupt[t] === true
    );

    return (
      targetToInterrupt &&
      s.playerInCombat &&
      s.spells[ability].castable &&
      s.spells[ability].equipped &&
      s.manaCurrent >= 100
    );
  },
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 3,
  act: (k, s) => {
    const [targetToInterrupt] = Object.keys(s.targetsToInterrupt).filter(
      (t) => s.targetsToInterrupt[t] === true
    );
    const modifier = getModifier(targetToInterrupt);

    if (modifier) {
      return robot.keyTap(key, modifier);
    }
    return robot.keyTap(key);
  },
  log: (l) => l.info(`Casting ${ability}`),
};
