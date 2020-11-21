const defaultMapping = {
  // Main Bar
  slot1: {},
  slot2: {}, // Slot 2
  slot3: {}, // Slot 3
  slot4: {}, // Slot 4
  slot5: {}, // Slot 5
  slot6: {}, // Slot 6
  slot7: {}, // Slot 7
  slot8: {}, // Slot 8
  slot9: {}, // Slot 9
  slot10: {}, // Slot 10
  slot11: {}, // Slot 11
  slot12: {}, // Slot 12

  // Bottom Left
  slot61: {}, // Slot 61
  slot62: {}, // Slot 62
  slot63: {}, // Slot 63
  slot64: {}, // Slot 64
  slot65: {}, // Slot 65
  slot66: {}, // Slot 66
  slot67: {}, // Slot 67
  slot68: {}, // Slot 68
  slot69: {},
  slot70: {},
  slot71: {},
  slot72: {},
};

function getSpellState(config, reader, currentSpells) {
  const spell = currentSpells;
  // const spell = {
  //   desperatePrayer: {},
  //   silence: {}, // Slot 2
  //   kidneyShot: {}, // Slot 3
  //   charge: {}, // Slot 4
  //   execute: {}, // Slot 5
  //   heroicStrike: {}, // Slot 6
  //   sinisterStrike: {}, // Slot 7
  //   eviscerate: {},
  //   lightningShield: {}, // Slot 9
  //   rejuvenation: {}, // Slot 10
  //   slot11: {}, // Slot 11
  //   slot12: {},
  //   fortitude: {}, // Slot 61
  //   hammerOfJustice: {}, // Slot 62
  //   bloodthirst: {}, // Slot 63
  //   innerFire: {}, // Slot 64
  //   aspectOfTheViper: {}, // Slot 65
  //   arcaneTorrent: {}, // Slot 66
  //   insigniaOfTheHorde: {}, // Slot 67
  //   bloodrage: {}, // Slot 68
  //   waterShield: {},
  //   slow: {},
  //   riptide: {},
  //   slot72: {},
  // };

  const spellObj = Object.keys(spell);
  console.log({ spell, spellObj });
  // Assigns each spell slot up to three statuses: Is there a spell equipped, is it on cooldown (can we cast it or not), and do we have enough mana to cast it
  let castableBinary = reader.getIntAtCell(config[35]);
  let equippedBinary = reader.getIntAtCell(config[36]);
  let notEnoughManaBinary = reader.getIntAtCell(config[37]);
  let spellInRangeBinary = reader.getIntAtCell(config[38]);

  // Loops through binaries of three pixels. Currently does 24 slots. 1-12 and 61-72.
  for (let i = 23; i >= 0; i--) {
    // Checks if the spell is currently castable, is it not on cooldown, are we not stunned, are we out of mana, etc.
    if (castableBinary - Math.pow(2, i) >= 0) {
      spell[spellObj[i]].castable = true;
      castableBinary -= Math.pow(2, i);
    } else {
      spell[spellObj[i]].castable = false;
    }
    // Checks if there is a spell equipped in this slot
    if (equippedBinary - Math.pow(2, i) >= 0) {
      spell[spellObj[i]].equipped = true;
      equippedBinary -= Math.pow(2, i);
    } else {
      spell[spellObj[i]].equipped = false;
    }
    // Checks if the reason we can't cast a spell is due to not having enough mana. castable also checks if we are out of mana, but is used for more specific instances such as switching to wand/melee.
    if (notEnoughManaBinary - Math.pow(2, i) >= 0) {
      spell[spellObj[i]].notEnoughMana = true;
      notEnoughManaBinary -= Math.pow(2, i);
    } else {
      spell[spellObj[i]].notEnoughMana = false;
    }
    // Checks if we are in range of casting the spell
    if (spellInRangeBinary - Math.pow(2, i) >= 0) {
      spell[spellObj[i]].spellInRange = true;
      spellInRangeBinary -= Math.pow(2, i);
    } else {
      spell[spellObj[i]].spellInRange = false;
    }
  }

  return spell;
}

module.exports = getSpellState;
