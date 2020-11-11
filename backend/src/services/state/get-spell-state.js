function getSpellState(config, reader) {
  const spell = {
    slot1: {},
    slot2: {}, // Slot 2
    hammerOfJustice: {}, // Slot 3
    charge: {}, // Slot 4
    execute: {}, // Slot 5
    heroicStrike: {}, // Slot 6
    sinisterStrike: {}, // Slot 7
    eviscerate: {},
    lightningShield: {}, // Slot 9
    rejuvenation: {}, // Slot 10
    slot11: {}, // Slot 11
    slot12: {},
    conjureFood: {}, // Slot 61
    conjureWater: {}, // Slot 62
    frostArmor: {}, // Slot 63
    arcaneIntellect: {}, // Slot 64
    blink: {}, // Slot 65
    conjureGem: {}, // Slot 66
    consumeGem: {}, // Slot 67
    iceBarrier: {}, // Slot 68
    slot69: {},
    hearthstone: {},
    slot71: {},
    slot72: {},
  };

  const spellObj = Object.keys(spell);
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
