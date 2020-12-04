const assert = require('assert');
const app = require('../../src/app');

describe('\'reroller\' service', () => {
  it('registered the service', () => {
    const service = app.service('reroller');

    assert.ok(service, 'Registered the service');
  });
});
