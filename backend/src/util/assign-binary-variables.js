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
    // spell: {
    //     drinkWater: {
    //         active
    //     }
    // }
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
      //   case 13:
      //     spell.drinkWater.active = active;
      //     break;
      //   case 12:
      //     spell.evocation.active = active;
      //     break;
      //   case 11:
      //     needFood = active;
      //     break;
      //   case 10:
      //     flying = active;
      //     break;
      //   case 9:
      //     itemsAreBroken = active;
      //     break;
      //   case 8:
      //     spell.iceBarrier.active = active;
      //     break;
      //   case 7:
      //     spell.arcaneIntellect.active = active;
      //     break;
      //   case 6:
      //     spell.frostArmor.active = active;
      //     break;
      //   case 5:
      //     spell.eatFood.active = active;
      //     break;
      //   case 4:
      //     needWater = active;
      //     break;
      //   case 3:
      //     talentPoints = active;
      //     break;
      //   case 2:
      //     deadStatus = active;
      //     break;
      //   case 1:
      //     targetIsDead = active;
      //     break;
      //   case 0:
      //     targetInCombat = active;
      //     break;
    }
    if (active) {
      base2Operation -= Math.pow(2, i);
    }
  }

  return values;
}

module.exports = assignBinaryVariables;
