/* eslint-disable global-require */
const _ = require('lodash');
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

function performPlan(plan, mapping) {
  const { actions } = plan;

  actions.forEach((actionName) => {
    const { act, log } = actionConfig[actionName];
    const key = mapping[actionName];

    log(logger);

    return act(key);
  });
}

function setPlan(state, actions, goal) {
  const plan = createPlan(state, actions, goal);

  if (!plan) {
    return null;
  }

  return plan;
  // return performPlan(plan);
}

function determineGoal(state, goals) {
  const goal = _.find(goals, (o) => {
    const { condition } = o;

    const outcome = condition(state);
    return outcome;
  });

  return goal;
}

const defaultRotation = require(`./profiles/mage`);
async function run({ state, rotation = defaultRotation }) {
  const { mapping, actions, goals } = rotation;

  const goal = determineGoal(state, goals);

  const { title } = await activeWin().catch((e) => 'cant get window');

  // return setPlan(state, actions, goal);
  if (title === 'World of Warcraft') {
    try {
      const plan = setPlan(state, actions, goal);

      if (!plan) {
        logger.info('No plan. Idling.');
        return null;
      }

      return performPlan(plan, mapping);
    } catch (e) {
      logger.error(e);
      return e;
    }
  }

  logger.info('Pausing');
}

module.exports = run;
