/**
 * 定义Boolean类型
 * 为Text()方法绑定单击事件(单击使Boolean取反)
 * @State注解对数据双向绑定,使得Boolean改变,能实时改变页面字体
 */
@Entry
@Component
struct tIndex {
  @State message: boolean = true
  build() {
    Row() {
      Column() {
        Text(this.message?'Hello World':'Hello ArkTS')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(()=>this.message = !this.message)
      }
      .width('100%')
    }
    .height('100%')
  }
}