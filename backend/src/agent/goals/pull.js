module.exports = {
  label: 'Pull',
  validate: (prevState, nextState) => prevState.playerInCombat === false,
  condition: (s) => !s.playerInCombat,
};
