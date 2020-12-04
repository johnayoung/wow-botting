const { copy, pathExists } = require('fs-extra');
const { resolve } = require('path');

(async () => {
  const addons = ['Ascended', 'DataToColor', 'LoadedReroll'];

  const pathToAddons = resolve(
    'C:/Program Files/Ascension Launcher/resources/client/Interface/AddOns/'
  );

  const dir = await pathExists(pathToAddons).catch((e) => console.log(e));

  if (dir) {
    addons.forEach(async (dir) => {
      const from = resolve(__dirname, dir);
      const to = resolve(pathToAddons, dir);

      await copy(from, to);
    });
  }
})();
