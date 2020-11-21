const identifier = '_id';

module.exports = (options = {}) => async (context) => {
  try {
    const { app, result } = context;

    console.log('trying to add');

    if (result) {
      const service = app.service('abilities');

      await service.create(result);
    } else {
      console.log('nothing to add');
    }

    return context;
  } catch (e) {
    console.log(e);
    return context;
  }
};
