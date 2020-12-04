// Initializes the `reroller` service on path `/reroller`
const { Reroller } = require('./reroller.class');
const hooks = require('./reroller.hooks');

module.exports = function (app) {
  const options = {
    paginate: app.get('paginate')
  };

  // Initialize our service with any options it requires
  app.use('/reroller', new Reroller(options, app));

  // Get our initialized service so that we can register hooks
  const service = app.service('reroller');

  service.hooks(hooks);
};
