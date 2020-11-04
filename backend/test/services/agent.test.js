const assert = require('assert');
const app = require('../../src/app');

describe('\'agent\' service', () => {
  it('registered the service', () => {
    const service = app.service('agent');

    assert.ok(service, 'Registered the service');
  });
});
