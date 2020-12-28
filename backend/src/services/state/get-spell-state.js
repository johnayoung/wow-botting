const _ = require('lodash');
const actions = require('../../agent/actions');

const keyBindings = {
  // Action bar 1
  0: 'g',
  1: 'r',
  2: 't',
  3: 'v',
  4: 'w',
  5: 'a',
  6: 'q',
  7: 'z',
  8: 'c',
  9: '4',
  10: '5',
  11: '6',
  12: 'y',
  13: 'h',
  14: 'b',
  15: '1',
  16: '2',
  17: '3',
  18: '7',
  19: '8',
  20: '9',
  21: '0',
  22: '',
  23: '',
  // Bottom Right Action Bar
  24: 'f1',
  25: 'f2',
  26: 'f3',
  27: 'f4',
  28: 'f5',
  29: 'f6',
  30: 'f7',
  31: 'f8',
  32: 'f9',
  33: 'f10',
  34: 'f11',
  35: 'f12',
  // Shapeshift bar
  36: 'g',
  37: 'r',
  38: 't',
  39: 'v',
  40: 'w',
  41: 'a',
  42: 'q',
  43: 'z',
  44: 'c',
  45: '4',
  46: '5',
  47: '6',
};

function getSpellState(app, config, reader, spells, start, end) {
  const data = {};
  for (let position = start; position < end; position++) {
    const counter = position - start;
    const spellId = reader.getIntAtCell(config[position]);

    if (_.has(spells, spellId)) {
      const { camelName } = spells[spellId];

      let meta = {
        spellId,
        castable: true,
        equipped: true,
        keybind: keyBindings[counter],
      };

      const spellConfig = actions[camelName];

      if (spellConfig) {
        meta = {
          ...meta,
          ...spellConfig,
        };
      } else {
        meta = {
          ...meta,
          condition: () => {},
          effect: () => {},
          cost: () => {},
          act: () => {},
          log: () => {},
        };
      }

      data[camelName] = meta;
    } else {
      // console.log(`${spellId} not found.`);
      // data[`${type}${position}`] = {};
      // try {
      //   app.service('spells').get(spellId);
      // } catch (e) {
      //   console.log(`Spell ${spellId} not found.`);
      // }
    }
  }

  return data;
}

module.exports = getSpellState;
