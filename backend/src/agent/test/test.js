const agent = require('../index');

const state1 = require('./state1');

const config = { state: state1, rotation: 'mage' };
agent(config);
