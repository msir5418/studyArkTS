/**
 * @author mxd
 * @vesion 1.0
 * @since 2024/3/28 18:51
 * 测试Row()容器和Column()容器
 * 横向和纵向布局的对齐方式
 */
@Entry
@Component
struct ShowList {
  build() {
    Row(){
      Text('Test')
        .fontSize(40)
      Text('Test')
        .fontSize(40)
      Text('Test')
        .fontSize(40)
      Text('Test')
        .fontSize(40)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    // .justifyContent(FlexAlign.Center)
    // .justifyContent(FlexAlign.End)
    // .justifyContent(FlexAlign.SpaceBetween)
    // .justifyContent(FlexAlign.SpaceEvenly)
    // .justifyContent(FlexAlign.SpaceAround)
    // .alignItems(VerticalAlign.Top)
    // .alignItems(VerticalAlign.Bottom)
    // .alignItems(VerticalAlign.Center)
    // Column(){
    //   Text('Test')
    //     .fontSize(40)
    //   Text('Test')
    //     .fontSize(40)
    //   Text('Test')
    //     .fontSize(40)
    //   Text('Test')
    //     .fontSize(40)
    // }
    // .width('100%')
    // .height('100%')
    // .justifyContent(FlexAlign.Start)
    // .justifyContent(FlexAlign.Center)
    // .justifyContent(FlexAlign.End)
    // .justifyContent(FlexAlign.SpaceBetween)
    // .justifyContent(FlexAlign.SpaceEvenly)
    // .justifyContent(FlexAlign.SpaceAround)
    // .alignItems(HorizontalAlign.Start)
    // .alignItems(HorizontalAlign.End)
    // .alignItems(HorizontalAlign.Center)
  }
}