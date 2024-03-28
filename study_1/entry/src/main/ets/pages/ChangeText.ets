/**
 * 定义Boolean类型
 * 为Text()方法绑定单击事件(单击使Boolean取反)
 * @State注解对数据双向绑定,使得Boolean改变,能实时改变页面字体
 */
import router from '@ohos.router'
@Entry
@Component
struct tIndex {
  @State message: boolean = true
  build() {
    Row() {
      Column({space:10}) {
        // Text('helloWorld')
        // Text('helloWorld')
        // Text('helloWorld')
        Text(this.message?'Hello World':'Hello ArkTS')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(()=>this.message = !this.message)
        Button(){
          Text('next')
            .fontColor('#fff')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#000')
        .width('40%')
        .height('5%')
        // 增加一个单击跳转到ChangeWidth的功能
        .onClick(()=>{
              console.info(`Succeeded in clicking the 'Next' button.`)
              router.pushUrl({url:'pages/ChangeWidth'}).then(()=>{
                console.info('Succeeded in jumping to the second page.')
            }).catch((err)=>{
                console.info('Succeeded in jumping to the second page.')
            })
        })
      }

      .width('100%')
    }
    .alignItems(VerticalAlign.Top)
    .height('100%')
  }
}