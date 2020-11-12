module.exports = {
  label: 'Pull',
  validate: (prevState, nextState) =>
    prevState.playerInCombat === false && prevState.target,
  condition: (s) => !s.playerInCombat,
};
