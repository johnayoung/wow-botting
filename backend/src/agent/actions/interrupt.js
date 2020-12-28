const robot = require('robotjs');

const interrupts = ['windShear'];
const ability = 'crusaderStrike';

const mods = {
  target: null,
  focus: 'shift',
  mouseover: 'alt',
};

function getInterruptTarget(targetsToInterrupt) {
  const [targetToInterrupt] = Object.keys(targetsToInterrupt).filter(
    (t) => targetsToInterrupt[t] === true
  );

  return targetToInterrupt;
}

// First one that is castable, usable, etc.

module.exports = {
  condition: (s) => {
    console.log(getInterruptTarget(s.targetsToInterrupt));

    return (
      getInterruptTarget(s.targetsToInterrupt) &&
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
  act: (k) => robot.keyTap(k),
  log: (l) => l.info(`Casting ${ability}`),
};
