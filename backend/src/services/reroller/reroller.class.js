/* eslint-disable no-unused-vars */
const _ = require('lodash');
const getGameState = require('./get-game-state');
const clicker = require('./clicker');

const { handleUnlearn } = clicker;

const coordinates = {
  clickSpell: [
    { x: '1568', y: '408' },
    { x: '1568', y: '456' },
    { x: '1568', y: '504' },
    { x: '1568', y: '550' },
  ],
  unlearnSpell: [
    { x: '1414', y: '509' },
    { x: '1414', y: '554' },
    { x: '1414', y: '602' },
    { x: '1414', y: '650' },
  ],
};

function start(app, agentState) {
  // const { profile } = agentState;
  const gameState = getGameState(app);

  const { tameBeast } = agentState;

  // Spells is array of index of targeted spells we successfully learned
  const { spells } = gameState;

  // Slots to unlearn; 4128831 is an error color to be ignored
  const slots = [1, 2, 3, 4, 4128831];
  const [spellToUnlearn] = slots.filter((spell) => !spells.includes(spell));

  console.log({ gameState, spellToUnlearn });

  if (spellToUnlearn) {
    if (tameBeast) {
      if (spells.includes(1) || spells.includes(2)) {
        console.log('We have found tamed beast. Stopping');
        return;
      }
    }
    return handleUnlearn(coordinates, spellToUnlearn - 1, tameBeast);
    // return findAndUnlearnSpell(coordinates, spellToUnlearn - 1);
  }

  console.log('We have successfully learned all spells');
}

exports.Reroller = class Reroller {
  constructor(options) {
    this.options = options || {};

    this.agentState = {
      tameBeast: false,
    };
  }

  async setup(app) {
    // this.state = setInterval(() => start(app, this.agentState), 1000);
  }

  async find(params) {
    return [];
  }

  async get(id, params) {
    return {
      id,
      text: `A new message with ID: ${id}!`,
    };
  }

  async create(data, params) {
    if (Array.isArray(data)) {
      return Promise.all(data.map((current) => this.create(current, params)));
    }

    return data;
  }

  async update(id, data, params) {
    return data;
  }

  async patch(id, data, params) {
    return data;
  }

  async remove(id, params) {
    return { id };
  }
};
