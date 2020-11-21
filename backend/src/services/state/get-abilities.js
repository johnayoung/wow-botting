const _ = require('lodash');
const { readFileSync } = require('fs');
const { resolve } = require('path');

const rawSpells = readFileSync(
  resolve(__dirname, '../spells/spells.json'),
  'utf-8'
);
const spells = JSON.parse(rawSpells);

function getAbilities(config, reader, app) {
  const mainStart = 12;
  const mainEnd = mainStart + 24; // 24 Abilities 1-12, 61-72

  const actionBarAbilities = {};
  for (let position = mainStart; position < mainEnd; position++) {
    const spellId = reader.getIntAtCell(config[position]);

    if (_.has(spells, spellId)) {
      const { camelName } = spells[spellId];

      actionBarAbilities[camelName] = {};
    } else {
      console.log(`${spellId} not found.`);
      actionBarAbilities[`slot${position}`] = {};
      // try {
      //   app.service('spells').get(spellId);
      // } catch (e) {
      //   console.log(`Spell ${spellId} not found.`);
      // }
    }
  }

  return actionBarAbilities;
}

module.exports = getAbilities;
