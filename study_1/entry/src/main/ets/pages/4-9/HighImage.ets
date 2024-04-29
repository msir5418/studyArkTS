import common from '@ohos.app.ability.common'
import Want from '@ohos.app.ability.Want'
@Entry
@Component
struct HighImage {
  private context = getContext(this) as common.UIAbilityContext

  build() {
    Row() {
      Column() {
        Image($r('app.media.ic_public_back'))
          .width(20)
          .onClick(()=>{
            let want:Want={
              deviceId: '',
              bundleName: 'com.example.testapplication',
              moduleName: 'entry',
              abilityName: 'EntryAbility',
            }
            this.context.startAbility(want)
          })
        Image(globalThis.entryAbilityWant.parameters.info)
          .interpolation(ImageInterpolation.High)
          .width(400)
      }
      .width('100%')
    }
    .height('100%')
  }
}