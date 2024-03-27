/**
 * 设置number默认值,并加上@State注解
 * 利用$rawfile()找到图片资源
 * onChange()获取input实时改变的值,转为int类型后赋给wth
 */
@Entry
@Component
struct wIndex {
  @State wth: number = 50
  build() {
      Column() {
        Image($rawfile('icon.png'))
          .width(this.wth)
        TextInput()
          .onChange((val:string)=>this.wth = parseInt(val))
          .width('50%')
      }

  }
}