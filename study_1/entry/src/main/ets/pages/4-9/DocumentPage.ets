import common from '@ohos.app.ability.common'
import Want from '@ohos.app.ability.Want'

@Entry
@Component
struct DocumentPage {
  private context = getContext(this) as common.UIAbilityContext
  @State flag:boolean = true
  @State text:string = ''
  build() {
    Column(){
      Row() {
        Image($r('app.media.ic_public_back'))
          .width(20)
          .onClick(()=>{
            //跨应用(Ability)
            let want:Want={
              deviceId: '',
              bundleName: 'com.example.testapplication',
              moduleName: 'entry',
              abilityName: 'EntryAbility',
            }
            this.context.startAbility(want)
            //返回上一页:同一个应用(Ability)下的不同页面之间
          })
        TextInput({
          placeholder:'标题'
        })
          .onFocus(()=>{
            this.flag = true
          })
          .layoutWeight(1)
        if(this.flag){
          Button('确定')
            .onClick(()=>{
              this.flag = false
            })
        }

      }
      .width('100%')
      Divider()
      TextArea({
        placeholder:'请输入内容',
        text: this.text
      })
        .layoutWeight(1)
    }
    .height('100%')

  }
}