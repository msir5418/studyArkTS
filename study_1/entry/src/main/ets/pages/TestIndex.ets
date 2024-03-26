@Entry
@Component
struct TestIndex {
  @State times: number = 0;
  build() {
    Column() {
      Row() {
        Button(`点我${this.times}次`)
          .backgroundColor('#38F')
          .fontColor('#fff')
          .onClick(() => this.times++)
      }
      .justifyContent(FlexAlign.Center)
    }

  }
}