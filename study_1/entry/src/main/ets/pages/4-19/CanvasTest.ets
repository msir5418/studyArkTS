/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/19 18:33
 */
@Entry
@Component
struct CanvasTest {
  context:CanvasRenderingContext2D = new CanvasRenderingContext2D()
  build() {
    Row() {
      Canvas(this.context)
        .width('100%')
        .height('100%')
        .backgroundColor('#ddf1dd')
        .onReady(()=>{
          var grad = this.context.createLinearGradient(50,50, 100,100)
          grad.addColorStop(0.0, '#ff0000')
          grad.addColorStop(0.5, '#ffffff')
          grad.addColorStop(1.0, '#00ff00')
          this.context.fillStyle = grad
          this.context.fillRect(0, 0, 300, 300)
        })
    }
  }
}