import common from '@ohos.app.ability.common'
import router from '@ohos.router'
import PreferenceUtil from '../common/utils/PreferenceUtil'
import UserPrivacyDialog from '../view/welcome/UserPrivacyDialog'
@Extend(Text) function opacityWhiteText(opacity:number,fontSize:number=10){
  .fontColor(Color.White)
  .fontSize(fontSize)
  .opacity(opacity)
}
const PREF_KEY = 'userPrivacyKey'

@Entry
@Component
struct WelcomePage {
  context = getContext(this) as common.UIAbilityContext
  controller:CustomDialogController = new CustomDialogController({
    builder: UserPrivacyDialog({
      confirm: ()=>this.onConfirm(),
      cancel: ()=>this.exitApp()
    })
  })
  async aboutToAppear(){
    let isAgree = await PreferenceUtil.getPreferenceValue(PREF_KEY,false)
    if (isAgree) {
      this.jumpToIndex()
    }else {
      this.controller.open()
    }
  }
  jumpToIndex(){
    setTimeout(()=>{
      router.replaceUrl({url:"pages/Index"})
    },2000)
  }
  onConfirm(){
    this.jumpToIndex()
    PreferenceUtil.putPreferenceValue(PREF_KEY,true)
  }
  exitApp(){
    this.context.terminateSelf()
  }
  build() {
      Column({space:10}) {
        Row(){
          Image($r('app.media.home_slogan'))
            .width(300)
        }
        .layoutWeight(1)
        Image($r('app.media.home_logo'))
          .width(150)
        Row({space:5}){
          Text('饮食健康支持')
            .opacityWhiteText(0.8,12)
          Text('IPV6')
            .border({style:BorderStyle.Solid,width:1,color:Color.White,radius:15})
            .padding({left:5,right:5})
            .opacityWhiteText(0.8,12)
          Text('网络')
            .fontColor(Color.White)
            .opacityWhiteText(0.8,12)

        }
          Text(`'减更多',指饮食健康APP希望通过工具软件的形式,帮助更多用户实现身材管理`)
            .opacityWhiteText(0.8,10)
          Text('鄂J ICP备00000000号-24M')
            .opacityWhiteText(0.8,10)
            .margin({
              bottom:35
            })
      }
      .width('100%')
      .height('100%')
      .backgroundColor($r('app.color.welcome_page_background'))
  }
}

