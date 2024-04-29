/**
 * 调整图片大小以及简单排版
 * input调整大小
 * 按钮调整大小
 * 滑动条调整大小
 */
import { Head } from '../Header'
@Entry
@Component
struct Index {

  @State wth: number = 275
  @State message: string = 'FadeIndex '
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
  build(){
    Column(){
      Head({title:''})
      Row(){
        Image($r('app.media.mate60'))
          .width(this.wth)
      }
      .width('100%')
      .height(540)
      .justifyContent(FlexAlign.Center)
        Row(){
          Text($r('app.string.width_label'))
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
          TextInput({text:this.wth+""})
            .width(150)
            .type(InputType.Number)
            .backgroundColor('#fff')
            .onChange((value:string)=>{
              this.wth = parseInt(value)
            })
        }
        .width('100%')
      .padding({
        left:14,
        right:14
      })
      .justifyContent(FlexAlign.SpaceBetween)
      Divider()
        Row(){
          Button('放大')
            .width(80)
            .onClick(()=>this.wth+=20)
          Button('缩小')
            .onClick(()=>this.wth-=20)
        }
      .width('100%')
        .margin({ top: 35, bottom: 35 })
      .justifyContent(FlexAlign.SpaceEvenly)
        Slider({
          min:100,
          max:300,
          value:this.wth,
          step:5,
          style:SliderStyle.InSet,
          direction:Axis.Horizontal,
          reverse:false
        }).onChange((value)=> this.wth=value)
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}