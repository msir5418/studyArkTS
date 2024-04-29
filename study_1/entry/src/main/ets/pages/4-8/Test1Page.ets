import router from '@ohos.router';
@Entry
@Component
struct Test1Page {
  @State show:boolean = false
  message: string = 'Test1 Page '
  @State arr:string[] = []
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

  build() {
    Row() {
      Column({space:20}) {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Row(){
          Button('push page2')
            .onClick(()=>{
              router.pushUrl({
                url:'pages/4-8/Test2Page'
              },router.RouterMode.Single)
            })
          Blank()
          Button('replace page2')
            .onClick(()=>{
              router.replaceUrl({
                url:'pages/4-8/Test2Page'
              },router.RouterMode.Single)
            })
        }
        .width('100%')
      }
      .width('100%')
    }
    .height('100%')
  }
}