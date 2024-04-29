import Want from '@ohos.app.ability.Want'
import common from '@ohos.app.ability.common'
@Entry
@Component
struct NormaImage {
  src:Resource[] = [
    $r('app.media.icon'),
    $r('app.media.fish'),
    $r('app.media.mateX5'),
    $r('app.media.watchGT4'),
    $r('app.media.mateBookProX'),
    $r('app.media.freeBudsPro3')
  ]
  private context = getContext(this) as common.UIAbilityContext
  build() {
    Row() {
      Column() {
        ForEach(this.src,(item:Resource,index)=>{
          Image(item)
            .interpolation(ImageInterpolation.Low)
            .width(150)
            .onClick(()=>{
              let  want:Want={
                deviceId: '',
                bundleName: 'com.example.testapplication',
                moduleName: 'entry',
                abilityName: 'HighAbility',
                parameters:{
                  info: item
                }
              }
              this.context.startAbility(want)
            })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}