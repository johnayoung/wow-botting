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
    spell: {
      drinkWater: {
        active: false,
      },
      evocation: {
        active: false,
      },
      iceBarrier: {
        active: false,
      },
      arcaneIntellect: {
        active: false,
      },
      frostArmor: {
        active: false,
      },
      eatFood: {
        active: false,
      },
    },
    needFood: false,
    needWater: false,
    flying: false,
    itemsAreBroken: false,
    talentPoints: false,
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
        values.spell.drinkWater.active = active;
        break;
      case 12:
        values.spell.evocation.active = active;
        break;
      case 11:
        values.needFood = active;
        break;
      case 10:
        values.flying = active;
        break;
      case 9:
        values.itemsAreBroken = active;
        break;
      case 8:
        values.spell.iceBarrier.active = active;
        break;
      case 7:
        values.spell.arcaneIntellect.active = active;
        break;
      case 6:
        values.spell.frostArmor.active = active;
        break;
      case 5:
        values.spell.eatFood.active = active;
        break;
      case 4:
        values.needWater = active;
        break;
      case 3:
        values.talentPoints = active;
        break;
      case 2:
        values.deadStatus = active;
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
