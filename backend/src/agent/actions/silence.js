const robot = require('robotjs');

const spellName = 'silence';

function defaultCondition(s, spell) {
  const { spells } = s;
  return spells[spell].castable && spells[spell].equipped;
}

module.exports = {
  condition: (s) => defaultCondition(s, spellName) && s.targetInLineOfSight,
  effect: (s) => {
    s.targetDead = true;
    return s;
  },
  cost: (s) => 1,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Silence'),
};
