/* eslint-disable default-case */
function isActive(base2Operation, i) {
  return base2Operation - Math.pow(2, i) >= 0;
}

function assignBinaryVariables(base2Operation) {
  const values = {
    processExitStatus: false,
    needManaGem: false,
    targetOfTargetIsPlayer: false,
    playerInCombat: false,
    debuffs: {
      slow: {
        active: false,
      },
      corruption: {
        active: false,
      },
    },
    spell: {
      earthShield: {
        active: false,
      },
      lifebloom: {
        active: false,
      },
      fingersOfFrost: {
        active: false,
      },
      powerWordFortitude: {
        active: false,
      },
      rejuvenation: {
        active: false,
      },
      maelstromWeapon: {
        active: false,
      },
      waterShield: {
        active: false,
      },
      markOfTheWild: {
        active: false,
      },
      iceArmor: {
        active: false,
      },
      metamorphosis: {
        active: false,
      },
    },
    isFrozen: false,
    needFood: false,
    needWater: false,
    flying: false,
    itemsAreBroken: false,
    inMeleeRange: false,
    deadStatus: false,
    targetIsDead: false,
    targetInCombat: false,
  };

  for (let i = 17; i >= 0; i--) {
    const active = base2Operation - Math.pow(2, i) >= 0;
    switch (i) {
      case 17:
        values.processExitStatus = active;
        break;
      case 16:
        values.needManaGem = active;
        break;
      case 15:
        values.targetOfTargetIsPlayer = active;
        break;
      case 14:
        values.playerInCombat = active;
        break;
      case 13:
        values.spell.earthShield.active = active;
        break;
      case 12:
        values.spell.fingersOfFrost.active = active;
        break;
      case 11:
        // values.debuffs.slow.active = active;
        values.spell.lifebloom.active = active;
        break;
      case 10:
        values.spell.markOfTheWild.active = active;
        break;
      case 9:
        values.spell.iceArmor.active = active;
        break;
      case 8:
        values.spell.powerWordFortitude.active = active;
        break;
      case 7:
        values.spell.rejuvenation.active = active;
        break;
      case 6:
        values.spell.maelstromWeapon.active = active;
        break;
      case 5:
        values.spell.waterShield.active = active;
        break;
      case 4:
        values.spell.metamorphosis.active = active;
        // values.isFrozen = active;
        break;
      case 3:
        values.inMeleeRange = active;
        break;
      case 2:
        values.debuffs.corruption.active = active;
        break;
      case 1:
        values.targetIsDead = active;
        break;
      case 0:
        values.targetInCombat = active;
        break;
    }
    if (active) {
      base2Operation -= Math.pow(2, i);
    }
  }

  return values;
}

module.exports = assignBinaryVariables;
