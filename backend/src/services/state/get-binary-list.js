function getBinaryList(base2Operation, list) {
  const members = {};

  const memberCount = list.length;

  for (let i = memberCount; i > 0; i--) {
    const active = base2Operation - Math.pow(2, i) >= 0;

    members[list[i - 1]] = active;

    if (active) {
      base2Operation -= Math.pow(2, i);
    }
  }

  return members;
}

module.exports = getBinaryList;
