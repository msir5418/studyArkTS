/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/25 19:22
 */
@Entry
@Component
struct TestScrollBar {
  private scroller:Scroller = new Scroller()
  private arr:number[] = [1,2,3,4,5,6,7,8,9,0]
  build() {
    Column() {
      Stack({alignContent:Alignment.End}){
        Scroll(this.scroller){
          Flex({ direction: FlexDirection.Column }) {
            ForEach(this.arr, item => {
              Row() {
                Text(item+'')
                  .width('80%')
                  .height(100)
                  .fontColor('#fff')
                  .backgroundColor('#67676A')
                  .borderRadius(15)
                  .textAlign(TextAlign.Center)
              }
              .margin(2)

            })
          }
        }
        .width('90%')
        .scrollBar(BarState.Off)
        .scrollable(ScrollDirection.Vertical)
        ScrollBar({ scroller: this.scroller, direction: ScrollBarDirection.Vertical,state: BarState.Auto }) {
          Text()
            .width(20)
            .height(100)
            .borderRadius(10)
            .backgroundColor('#C0C0C0')
        }.width(20).backgroundColor('#ededed')
      }

    }
  }
}