/* eslint-disable import/no-dynamic-require */
/* eslint-disable global-require */
/* eslint-disable no-unused-vars */
const _ = require('lodash');
const runAgent = require('../../agent');
const getGameState = require('../state/get-game-state');

function start(app, agentState) {
  const { profile } = agentState;
  const gameState = getGameState(app);

  // console.log(gameState);

  const rotation = require(`../../agent/profiles/${profile}`);

  const { mapping, actions, goals, overrides } = rotation;

  const rotationWithOverrides = _.merge({}, rotation, { actions: overrides });

  runAgent({ state: gameState, rotation: rotationWithOverrides });

  app.service('state').create(gameState);
}

exports.Agent = class Agent {
  constructor(options) {
    this.options = options || {};

    this.agentState = {
      status: 'stopped',
      updateInterval: 100,
      profile: 'mage',
    };

    this.timer = null;
  }

  async setup(app) {
    this.app = app;
    this.timer = setInterval(
      () => start(app, this.agentState),
      this.agentState.updateInterval
    );

    this.agentState = {
      ...this.agentState,
      status: 'running',
    };
  }

  async find(params) {
    return this.agentState;
  }

  async create(data, params) {
    const { updateInterval } = data;
    clearInterval(this.timer);

    if (updateInterval) {
      this.agentState = {
        ...this.agentState,
        updateInterval,
      };
    }

    this.timer = setInterval(
      () => start(this.app, this.agentState),
      this.agentState.updateInterval
    );

    this.agentState = {
      ...this.agentState,
      status: 'running',
    };

    return this.agentState;
  }

  async remove(id, params) {
    clearInterval(this.timer);

    this.agentState = {
      ...this.agentState,
      status: 'stopped',
    };

    return this.agentState;
  }
};
