const { readFileSync, writeFileSync } = require('fs');
const { resolve } = require('path');
const extractSpells = require('./_helpers');

/* eslint-disable no-unused-vars */
exports.Spells = class Spells {
  constructor(options) {
    this.options = options || {};
  }

  setup(app) {
    this.app = app;
    this.httpClient = app.get('httpClient');
    this.url = `https://data.project-ascension.com/api/talentcalculator/data`;
    this.pathToSpells = resolve(__dirname, 'spells.json');

    const spells = readFileSync(this.pathToSpells, 'utf-8');
    app.set('spells', spells);
  }

  async find(params) {
    const data = await this.app.service('abilities').find({});

    const spells = extractSpells(data);

    writeFileSync(this.pathToSpells, JSON.stringify(spells, null, 2));

    return spells;
  }

  async get(id, params) {
    const url = `https://data.project-ascension.com/api/spells/${id}`;

    try {
      const response = await this.httpClient.get(url);

      return response.data;
    } catch (e) {
      console.log(`Nothing found for ${id}`);
      return null;
    }
  }
};
