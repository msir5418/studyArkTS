/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/14 21:42
 */
@Entry
@Component
struct TestDemo {
  @State isAnti:boolean = true
  private settings: RenderingContextSettings = new RenderingContextSettings(!this.isAnti)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  build() {
    Column(){
      Row() {
        Canvas(this.context)
          .width('100%').height('95%').backgroundColor('#FFFF00')
          .onReady(()=>{
            this.context.beginPath()
            this.context.arc(180,290,120,0,6.28)
            this.context.stroke()
          })
      }
    }

  }
}