const assert = require('assert');
const app = require('../../src/app');

describe('\'state\' service', () => {
  it('registered the service', () => {
    const service = app.service('state');

    assert.ok(service, 'Registered the service');
  });
});
