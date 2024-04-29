@Entry
@Component
struct ArrayUIPage {
  @State message: string = 'TestDemo '
  @State arr:Array<TestDemo> =[]
  static i:number = 0
  build() {
    Row() {
      Column() {
          Button('添加数组')
            .onClick(()=>{
              this.arr.push(new TestDemo(this.message+ArrayUIPage.i++))
            })
          ForEach(this.arr,(item:TestDemo,index)=>{
            Row(){
                Text(item.message)
                  .fontSize(50)
                  .fontWeight(FontWeight.Bold)
            }
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
class TestDemo {
  message: string = 'TestDemo '
  aboutToAppear(){
    console.log(this.message+"about To Appear");
  }
  onPageShow(){
    console.log(this.message+"on Page Show")
  }
  onBackPress(){
    console.log(this.message+"on Back Press")
  }
  onPageHide(){
    console.log(this.message+"on Page Hide")
  }
  aboutToDisappear(){
    console.log(this.message+"about To Disappear")
  }
  constructor(message:string){
    this.message = message
  }

}