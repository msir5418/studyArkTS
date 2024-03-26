import {Rectangle,Square,Oblong} from '../entryability/Rectangle'
@Entry
@Component
struct Index {
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