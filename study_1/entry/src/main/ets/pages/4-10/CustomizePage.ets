import common from '@ohos.app.ability.common'
import Want from '@ohos.app.ability.Want'
@Entry
@Component
struct CustomizePage {
  private context = getContext(this) as common.UIAbilityContext

  build() {
    Row() {
      Column() {
        Button('跳转EntryAbility')
          .onClick(()=>{
            let want:Want={
              deviceId: '',
              bundleName: 'com.example.testapplication',
              moduleName: 'entry',
              abilityName: 'EntryAbility',
            }
            this.context.startAbility(want)
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}