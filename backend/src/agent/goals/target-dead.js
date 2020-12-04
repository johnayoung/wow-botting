module.exports = {
  label: 'Target is dead',
  validate: (prevState, nextState) => nextState.targetIsDead === true,
  condition: (s) => s.playerInCombat && s.targetIsDead === false,
};
