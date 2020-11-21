const _ = require('lodash');

function extractSpellsFromTalentCalculator(data) {
  const { classes } = data;

  const spells = {};
  classes.forEach((clss) => {
    const { specializations } = clss;

    specializations.forEach((specialization) => {
      const { abilities, talents } = specialization;

      abilities.forEach((ability) => {
        const { id, name } = ability;

        spells[id] = {
          ...ability,
          camelName: _.camelCase(name),
          type: 'ability',
        };
      });

      talents.forEach((talent) => {
        const { id, name } = talent;

        spells[id] = {
          ...talent,
          camelName: _.camelCase(name),
          type: 'talent',
        };
      });
    });
  });

  return spells;
}

function extractSpells(data) {
  const spells = {};
  data.forEach((ability) => {
    const { id, name } = ability;

    spells[id] = {
      ...ability,
      camelName: _.camelCase(name),
    };
  });

  return spells;
}

module.exports = extractSpells;
