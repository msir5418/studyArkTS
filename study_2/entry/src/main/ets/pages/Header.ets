/**
 * @author mxd
 * @vesion 1.0
 * @since 2024/3/28 18:37
 * 将标题,以及左右图片的布局独立成模块
 * 封装字体样式,减少代码冗余
 * 添加返回按钮和刷新按钮的触发时间
 * 利用router.back返回
 * 利用???????????刷新
 */
import router from '@ohos.router'

@Component
export struct Head{
  @State rotateAngle: number= 0;
  private title:ResourceStr
  build(){
    Column(){
      Row(){
        Image($r('app.media.ic_public_back'))
          .width(30)
          .onClick(()=>{
            router.showAlertBeforeBackPage({
              //返回前的警告
              //点击确定则返回,点击取消则不执行下面的代码
              message:'确定返回?'
            })
            router.back()
          })
        Text(`${this.title}`)
          .fontSize(40)
          .width(200)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Start)
        Image($r('app.media.ic_public_refresh'))
          .width(30)
          .onClick(()=>{
            router.pushUrl({
              url:'pages/Task'
            })
            router.back()

          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }

  }
}
@Component
export struct FontBold{
  private text:string
  private fSize:number
  build(){
    Text(this.text)
      .fontSize(this.fSize)
      .fontWeight(FontWeight.Bold)
  }
}