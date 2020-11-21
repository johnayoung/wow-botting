const patchOrCreate = require('./patch-or-create');

module.exports = {
  before: {
    all: [],
    find: [],
    get: [],
    create: [patchOrCreate()],
    update: [],
    patch: [],
    remove: [],
  },

  after: {
    all: [],
    find: [],
    get: [],
    create: [],
    update: [],
    patch: [],
    remove: [],
  },

  error: {
    all: [],
    find: [],
    get: [],
    create: [],
    update: [],
    patch: [],
    remove: [],
  },
};
