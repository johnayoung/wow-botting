/* eslint-disable global-require */
const _ = require('lodash');
const robot = require('robotjs');
const activeWin = require('active-win');
const logger = require('pino')({
  name: 'log-action',
  prettyPrint: {
    levelFirst: true,
  },
  prettifier: require('pino-pretty'),
});
const actionConfig = require('./actions');
const { createPlan } = require('./planner');

function performAction(actionName) {
  const { key, log } = actionConfig[actionName];
  logger.info(log);

  return robot.keyTap(key);
}

function performPlan(plan) {
  console.log(plan);
  const { actions } = plan;

  actions.forEach((actionName) => performAction(actionName));
}

function setPlan(state, actions, goal) {
  console.log(goal);
  const plan = createPlan(state, actions, goal);

  console.log('PLAN ===> ', plan);

  if (!plan) {
    return;
  }

  return performPlan(plan);
}

function determineGoal(state, goals) {
  const goal = _.find(goals, (o) => {
    const { condition, label } = o;

    const outcome = condition(state);
    return outcome;
  });

  return goal;
}

async function run({ state, rotation }) {
  const classRotation = require(`./profiles/${rotation}`);
  const { actions, goals } = classRotation;

  const goal = determineGoal(state, goals);

  const { title } = await activeWin().catch((e) => 'cant get window');

  return setPlan(state, actions, goal);
  // if (title === 'World of Warcraft') {
  //   try {
  //     return setPlan(state, actions, goal);
  //   } catch (e) {
  //     console.log('error in set plan', e);
  //   }
  // }

  // console.log('Pausing bot');
}

module.exports = run;
