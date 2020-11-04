// Initializes the `agent` service on path `/agent`
const { Agent } = require('./agent.class');
const hooks = require('./agent.hooks');

module.exports = function (app) {
  const options = {
    paginate: app.get('paginate')
  };

  // Initialize our service with any options it requires
  app.use('/agent', new Agent(options, app));

  // Get our initialized service so that we can register hooks
  const service = app.service('agent');

  service.hooks(hooks);
};
