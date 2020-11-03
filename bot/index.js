const _ = require('lodash');
const robot = require('robotjs');
const activeWin = require('active-win');
const client = require('./client');
const actionConfig = require('./actions');
const { createPlan } = require('./planner');

function performAction(actionName) {
  const { key, log } = actionConfig[actionName];
  console.log(log);

  return robot.keyTap(key);
}

function performPlan(plan) {
  const { actions } = plan;

  actions.forEach((actionName) => performAction(actionName));
}

function setPlan(state, actions, goal) {
  const plan = createPlan(state, actions, goal);

  if (!plan) {
    return;
  }

  return performPlan(plan);
}

function determineGoal(state, goals) {
  const goal = _.find(goals, (o) => {
    const { condition, label } = o;

    const outcome = condition(state);
    console.log({ outcome, label });
    return outcome;
  });

  return goal;
}

async function main({ state, rotation }) {
  const classRotation = require(`./profiles/${rotation}`);
  const { actions, goals } = classRotation;

  const goal = determineGoal(state, goals);

  console.log(JSON.stringify(goal));

  const { title } = await activeWin().catch((e) => 'cant get window');

  if (title === 'World of Warcraft') {
    try {
      return setPlan(state, actions, goal);
    } catch (e) {
      console.log('error in set plan', e);
    }
  }

  console.log('Pausing bot');
}

const state = {
  target: true,
  targetDead: false,
  playerInCombat: true,
  spells: {
    fireblast: {
      onCooldown: false,
    },
    fireball: {},
  },
};

const updateFrequency = 1000;
const config = { state, rotation: 'mage' };
// setInterval(() => main(config), updateFrequency);
// main();

const service = client.service('state');

service.on('patched', async (gameState) =>
  main({ state: gameState, rotation: 'mage' })
);
