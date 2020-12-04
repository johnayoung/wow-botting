function getMemberMeleeRange(base2Operation) {
  const listOfMembers = [
    'target',
    'focus',
    'mouseover',
    'player',
    'pet',
    'party1',
    'party2',
    'party3',
    'party4',
    'party5',
  ];

  const members = {};

  const memberCount = listOfMembers.length;

  for (let i = memberCount; i > 0; i--) {
    const active = base2Operation - Math.pow(2, i) >= 0;

    const unit = listOfMembers[i - 1];
    members[`${unit}InMeleeRange`] = active;

    if (active) {
      base2Operation -= Math.pow(2, i);
    }
  }

  return members;
}

module.exports = getMemberMeleeRange;
