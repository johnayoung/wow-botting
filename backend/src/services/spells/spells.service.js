// Initializes the `spells` service on path `/spells`
const { Spells } = require('./spells.class');
const hooks = require('./spells.hooks');

module.exports = function (app) {
  const options = {
    paginate: app.get('paginate')
  };

  // Initialize our service with any options it requires
  app.use('/spells', new Spells(options, app));

  // Get our initialized service so that we can register hooks
  const service = app.service('spells');

  service.hooks(hooks);
};
