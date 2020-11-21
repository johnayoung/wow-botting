// Initializes the `abilities` service on path `/abilities`
const { Abilities } = require('./abilities.class');
const createModel = require('../../models/abilities.model');
const hooks = require('./abilities.hooks');

module.exports = function (app) {
  const options = {
    Model: createModel(app),
  };

  // Initialize our service with any options it requires
  app.use('/abilities', new Abilities(options, app));

  // Get our initialized service so that we can register hooks
  const service = app.service('abilities');

  service.hooks(hooks);
};
