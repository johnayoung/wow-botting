const _ = require('lodash');

function getBlock(app, config, reader, spells, start, end, type = 'buff') {
  const data = {};
  for (let position = start; position < end; position++) {
    const spellId = reader.getIntAtCell(config[position]);

    if (_.has(spells, spellId)) {
      const { camelName } = spells[spellId];

      let meta = {
        spellId,
      };

      if (type === 'buff') {
        meta = {
          ...meta,
          active: true,
        };
      }

      if (type === 'ability') {
        meta = {
          ...meta,
          castable: true,
          equipped: true,
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

module.exports = getBlock;
