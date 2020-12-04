const identifier = 'id';

module.exports = (options = {}) => async (context) => {
  try {
    const { data, service, params } = context;
    const { name, ...rest } = data;

    const payload = { name, ...rest };

    // try to find the record ( we destructure the first entry from array)
    const [record] = await service.find({
      query: { name },
      paginate: false,
    });

    // if records exists -> patch it using id and return
    if (record) {
      // important set the context.result so that the actual service call (CREATE) will be skiped
      context.result = await service
        .patch(record[identifier], payload)
        .catch((e) => console.log(e)); // else patch it
      return context;
    }

    // rename fields in data to match fields of sequelize
    context.data = payload;

    return context;
  } catch (e) {
    console.log(e);
    return context;
  }
};
