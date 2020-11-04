/* eslint-disable no-unused-vars */
const runAgent = require('bot');
const getGameState = require('../state/get-game-state');

function start(app) {
  const gameState = getGameState();

  runAgent({ state: gameState, rotation: 'mage' });

  app.service('state').create(gameState);
}

exports.Agent = class Agent {
  constructor(options) {
    this.options = options || {};

    this.agentState = {
      status: 'stopped',
      updateInterval: 1000,
    };

    this.timer = null;
  }

  async setup(app) {
    this.app = app;
    this.timer = setInterval(() => start(app), this.agentState.updateInterval);

    this.agentState = {
      ...this.agentState,
      status: 'running',
    };
  }

  async find(params) {
    return this.agentState;
  }

  async get(id, params) {
    return {
      id,
      text: `A new message with ID: ${id}!`,
    };
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
      () => start(this.app),
      this.agentState.updateInterval
    );

    this.agentState = {
      ...this.agentState,
      status: 'running',
    };

    return this.agentState;
  }

  async update(id, data, params) {
    return data;
  }

  async patch(id, data, params) {
    return data;
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
