const actions = require('../../agent/actions');

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

const keyBindings = {
  // Action bar 1
  0: 'g',
  1: 'r',
  2: 't',
  3: 'v',
  4: 'w',
  5: 'a',
  6: 'q',
  7: 'z',
  8: 'c',
  9: '4',
  10: '5',
  11: '6',
  // Bottom Left Action Bar
  12: 'y',
  13: 'h',
  14: 'b',
  15: '1',
  16: '2',
  17: '3',
  18: '7',
  19: '8',
  20: '9',
  21: '0',
  22: '',
  23: '',
  // Bottom Right Action Bar
  24: 'f1',
  25: 'f2',
  26: 'f3',
  27: 'f4',
  28: 'f5',
  29: 'f6',
  30: 'f7',
  31: 'f8',
  32: 'f9',
  33: 'f10',
  34: 'f11',
  35: 'f12',
};

function getSpellState(
  config,
  reader,
  currentSpells,
  startFrame,
  numberOfAbilities
) {
  const spell = currentSpells;

  const spellObj = Object.keys(spell);
  // Assigns each spell slot up to three statuses: Is there a spell equipped, is it on cooldown (can we cast it or not), and do we have enough mana to cast it
  let castableBinary = reader.getIntAtCell(config[startFrame]);
  // let equippedBinary = reader.getIntAtCell(config[69]);
  // let notEnoughManaBinary = reader.getIntAtCell(config[70]);
  // let spellInRangeBinary = reader.getIntAtCell(config[71]);

  // Loops through binaries of three pixels. Currently does 60 slots. Action Bar, Bottom Left, Bottom Right, Right 1, Right 2.
  for (let i = numberOfAbilities; i >= 0; i--) {
    // Checks if the spell is currently castable, is it not on cooldown, are we not stunned, are we out of mana, etc.
    if (castableBinary - Math.pow(2, i) >= 0) {
      spell[spellObj[i]].castable = true;
      castableBinary -= Math.pow(2, i);
    } else {
      spell[spellObj[i]].castable = false;
    }
    // Checks if there is a spell equipped in this slot
    // if (equippedBinary - Math.pow(2, i) >= 0) {
    //   spell[spellObj[i]].equipped = true;
    //   equippedBinary -= Math.pow(2, i);
    // } else {
    //   spell[spellObj[i]].equipped = false;
    // }
    // // Checks if the reason we can't cast a spell is due to not having enough mana. castable also checks if we are out of mana, but is used for more specific instances such as switching to wand/melee.
    // if (notEnoughManaBinary - Math.pow(2, i) >= 0) {
    //   spell[spellObj[i]].notEnoughMana = true;
    //   notEnoughManaBinary -= Math.pow(2, i);
    // } else {
    //   spell[spellObj[i]].notEnoughMana = false;
    // }
    // // Checks if we are in range of casting the spell
    // if (spellInRangeBinary - Math.pow(2, i) >= 0) {
    //   spell[spellObj[i]].spellInRange = true;
    //   spellInRangeBinary -= Math.pow(2, i);
    // } else {
    //   spell[spellObj[i]].spellInRange = false;
    // }

    spell[spellObj[i]].keybind = keyBindings[i];

    const spellConfig = actions[spellObj[i]];

    if (spellConfig) {
      spell[spellObj[i]] = {
        ...spell[spellObj[i]],
        ...actions[spellObj[i]],
      };
    } else {
      spell[spellObj[i]] = {
        ...spell[spellObj[i]],
        condition: () => {},
        effect: () => {},
        cost: () => {},
        act: () => {},
        log: () => {},
      };
    }
  }

  return spell;
}

module.exports = getSpellState;
