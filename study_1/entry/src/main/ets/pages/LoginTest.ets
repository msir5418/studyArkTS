/**
 * 登录表单Demo
 */
import {Head} from './Header'
@Entry
@Component
struct login {
  build() {
      Column({space:30}) {
        Head({title:'登录图片'})
        Image($rawfile("icon.png"))
          .width(200)
          .interpolation(ImageInterpolation.High)
        Image($r("app.media.icon"))
          .width(100)
          .margin({
            top:60
          })
        TextInput({placeholder:'用户名'})
          .type(InputType.Normal)
          .width('90%')
          .borderWidth(1)
          .borderStyle(BorderStyle.Solid)
          .borderColor('#000')
          .backgroundColor('#fff')
        TextInput({placeholder:'密码'})
          .type(InputType.Password)
          .width('90%')
          .borderWidth(1)
          .borderStyle(BorderStyle.Solid)
          .borderColor('#000')
          .backgroundColor('#fff')
        Button() {
          Text('登录')
            .fontColor('#fff')
        }
        .width('90%')
        .height('5%')
        Row(){
          Checkbox()
          Text('记住我').fontColor('#0179FF')
        }
        .justifyContent(FlexAlign.Start)
        .width('90%')
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
    }
}