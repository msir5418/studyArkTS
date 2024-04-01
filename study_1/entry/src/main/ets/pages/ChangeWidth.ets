/**
 * 设置number默认值,并加上@State注解
 * 利用$rawfile()找到图片资源
 * onChange()获取input实时改变的值,转为int类型后赋给wth
 */
import router from '@ohos.router'
import { Head } from './Header'
@Entry
@Component
struct wIndex {
  @State wth: number = 50
  build() {
      Column() {
        Head({title:''})
        Image($rawfile('icon.png'))
          .width(this.wth)
        TextInput()
          .onChange((val:string)=>this.wth = parseInt(val))
          .width('50%')
        Button(){
            Text('Pre')
              .fontSize(30)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FFF')
        }.width(80)
        .height(40)
        // 增加一个单击跳转到ChangeText的功能
          .onClick(()=>{
          console.info(`Succeeded in clicking the 'Next' button.`)
          router.pushUrl({url:'pages/ChangeText'}).then(()=>{
            console.info('Succeeded in jumping to the second page.')
          }).catch((err)=>{
            console.info('Succeeded in jumping to the second page.')
          })
        })
      }

  }
}