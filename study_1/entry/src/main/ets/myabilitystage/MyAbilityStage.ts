import AbilityStage from '@ohos.app.ability.AbilityStage';
import Want from '@ohos.app.ability.Want';

export default class MyAbilityStage extends AbilityStage{
  onAcceptWant(want:Want):string {
    if (want.abilityName === 'StageModulePage') {
      return `StageModulePage${want.parameters.instanceKey}`
    }
    if (want.abilityName === 'DocumentAbility') {
      return `DocumentAbility${want.parameters.instanceKey}`
    }
    if (want.abilityName === 'HighAbility') {
      return `HighAbility${want.parameters.info}`
    }
    // if (want.abilityName === 'EntryAbility') {
    //   return `EntryAbility${want.parameters.info}`
    // }
    return ''
  }
}