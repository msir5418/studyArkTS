/**
 * import导入接口和实现类
 * 创建对应实例,调用方法
 * Text()渲染到HarmonyOS
 */
import {Rectangle,Square,Oblong} from '../../entryability/Rectangle'
@Entry
@Component
struct cIndex {
  @State message: string = 'Hello World'
        s1:Rectangle = new Square(1)
        o1:Rectangle = new Oblong(1,2)
  build() {
    Row() {
      Column() {
        Text('正方形面积'+this.s1.calcArea())
        Text('正方形周长'+this.s1.calcCir())
        Text('长方形面积'+this.o1.calcArea())
        Text('长方形周长'+this.o1.calcCir())
        // Text(this.message)
        //   .fontSize(50)
        //   .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}