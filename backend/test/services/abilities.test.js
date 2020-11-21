const assert = require('assert');
const app = require('../../src/app');

describe('\'abilities\' service', () => {
  it('registered the service', () => {
    const service = app.service('abilities');

    assert.ok(service, 'Registered the service');
  });
});
