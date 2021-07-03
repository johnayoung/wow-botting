const state = require('./state/state.service.js');
const agent = require('./agent/agent.service.js');
const spells = require('./spells/spells.service.js');
const abilities = require('./abilities/abilities.service.js');
const reroller = require('./reroller/reroller.service.js');
// eslint-disable-next-line no-unused-vars
module.exports = function (app) {
  app.configure(state);
  app.configure(agent);
  app.configure(spells);
  app.configure(abilities);
  app.configure(reroller);
};
