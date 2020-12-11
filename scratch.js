const _ = require('lodash');
const axios = require('axios');

async function getSpells() {
  const uri = 'http://localhost:3030/spells';

  const response = await axios.get(uri);
  const { data } = response;

  const urlsToFetch = [];
  Object.keys(data).forEach((spellId) => {
    const spell = data[spellId];
    const other = _.get(spell, ['ranks', 'other']);

    if (_.size(other) > 1) {
      other.forEach(async (sid) => {
        const url = `${uri}/${sid}`;
        // await axios.get(url).catch((e) => console.log(e.toJSON()));
        urlsToFetch.push(url);
      });
    }
  });

  console.log(urlsToFetch);
  await axios.get(urlsToFetch[0]);
}

getSpells();
