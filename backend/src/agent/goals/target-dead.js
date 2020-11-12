module.exports = {
  label: 'Target is dead',
  validate: (prevState, nextState) => nextState.targetDead === true,
  condition: (s) => s.playerInCombat && !s.targetDead,
};
