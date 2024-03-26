import {Rectangle,Square,Oblong} from '../entryability/Rectangle'
@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
        s1:Rectangle = new Square(1)
        o1:Rectangle = new Oblong(1,2)
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(()=>this.message='Hello ArkTS')
      }
      .width('100%')
    }
    .height('100%')
  }
}