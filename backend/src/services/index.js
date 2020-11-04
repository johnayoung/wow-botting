const state = require('./state/state.service.js');
const agent = require('./agent/agent.service.js');
// eslint-disable-next-line no-unused-vars
module.exports = function (app) {
  app.configure(state);
  app.configure(agent);
};
