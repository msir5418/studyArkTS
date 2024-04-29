import router from '@ohos.router'
import common from '@ohos.app.ability.common'
import preferenceUtil from '../uitil/PreferencesUtil'
import IndexFontSizePanel from '../views/IndexFontSizePanel'

class RouterInfo{
  // 页面路径
  url: string
  // 页面标题
  title: string

  constructor(url: string, title: string) {
    this.url = url;
    this.title = title
  }
}
const routers: RouterInfo[] = [
  new RouterInfo('pages/ImagePage', '图片查看案例'),
  new RouterInfo("pages/SecondPage/ShopList", '商品列表案例'),
  new RouterInfo("pages/ThirdPage/StatePage", 'Jack和他的女友案例'),
  // new RouterInfo("pages/ThirdPage/Task", '任务列表案例'),
  // new RouterInfo("pages/FifthPage/AnimationPage", '小鱼动画案例摇杆版'),
  // new RouterInfo('pages/4-9/DocumentListPage', 'UIAbilityTech启动模式案例'),
  // new RouterInfo('pages/4-9/NormaImage', '图片切换案例'),
  // new RouterInfo('pages/4-10/StorePage', '访问商铺案例'),
  // new RouterInfo('pages/4-10/CustomizePage', '跳转EntryAbility'),
  new RouterInfo('pages/4-15/TaskManagePage', '任务列表持久化'),
  new RouterInfo('pages/4-16/NotificationPage', '通知案例'),
  new RouterInfo('pages/4-16/StoreImagePage', '图片存储'),
  // new RouterInfo("pages/4-25/ImplicitWant", '隐式Want跳转'),
  new RouterInfo("pages/4-28/WebTestPage", 'Web组件'),
]

@Component
struct RouterItem{
  r: RouterInfo
  i: number
  @Consume fontSize: number

  build(){
    Row(){
      Text(this.i + '.')
        .fontSize(this.fontSize)
        .fontColor(Color.White)
      Blank()
      Text(this.r.title)
        .fontSize(this.fontSize)
        .fontColor(Color.White)
    }
    .width('90%')
    .padding(12)
    .backgroundColor('#38f')
    .borderRadius(20)
    .shadow({radius: 6, color: '#4F0000', offsetX: 2, offsetY: 4})
    .onClick(() => {
      // router跳转
      router.pushUrl(
        {
          url: this.r.url,
          params: {id: this.i}
        },
        router.RouterMode.Single,
        err => {
          if(err){
            console.log(`路由失败，errCode: ${err.code} errMsg:${err.message}`)
          }
        }
      )
    })
  }
}
@Entry
@Component
struct Index {
  @State message: string = '页面列表'
  @State showPanel: boolean = false
  flag:boolean=false
  @Provide fontSize: number = 16
  timer:number=-1
  tag:string='Index'
  dialogController: CustomDialogController = new CustomDialogController({
    builder:authorization({timer:this.timer,flag:this.flag})
  })
  async aboutToAppear(){
    this.fontSize = await preferenceUtil.getPreferenceValue('myPreference','IndexFontSize',16) as unknown as number
    this.flag=await preferenceUtil.getPreferenceValue('myPreference','TFflag',false)as unknown as boolean

    console.log(this.tag,'about To Appear')
    if(!this.flag){
      this.timer=setTimeout(async ()=>{
        await this.dialogController.open()
      },2000)
      this.flag=true
    }
  }
  build() {
    Column() {
      // 顶部标题
      this.Title()
      // 导航列表
      this.RouterList()
      if (this.showPanel){
        IndexFontSizePanel()
          .transition({
            type:TransitionType.Insert,
            translate:{y:150}
          })
      }
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  Title() {
    Row() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .height(80)
      Image($r('app.media.ic_public_settings'))
        .width(30)
        .onClick(() => {
          animateTo({ duration: 500, curve: Curve.EaseInOut },
            () => this.showPanel = !this.showPanel)
        })
    }
    .justifyContent(FlexAlign.SpaceAround)
    .width('100%')
  }

  @Builder
  RouterList() {
    List({ space: 15 }) {
      ForEach(
        routers,
        (router, index) => {
          ListItem() {
            RouterItem({ r: router, i: index + 1 })
          }
        }
      )
    }
    .layoutWeight(1)
    .alignListItem(ListItemAlign.Center)
    .width('100%')
  }


}

@CustomDialog
struct authorization {
  timer:number
  flag:boolean
  private context=getContext(this) as common.UIAbilityContext
  controller: CustomDialogController
  build() {
    Column(){
      Text('请授予打开权限').fontSize(40).fontWeight(FontWeight.Bold)
      Row({space:8}){
        Button('同意')
          .onClick(()=>{
            /* router.pushUrl({
               url:'pages/Index'
             })*/
            clearTimeout(this.timer)
            preferenceUtil.putPreferenceValue('myPreference','TFflag',this.flag)
            this.controller.close()
          })
        Button('不同意')
          .onClick(()=>{
            //关闭程序
            this.context.terminateSelf()
          })
      }.justifyContent(FlexAlign.Center)
    }.width('100%')

  }
}