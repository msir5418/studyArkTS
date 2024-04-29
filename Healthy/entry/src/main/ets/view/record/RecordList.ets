/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/19 15:36
 */
import router from '@ohos.router'
import { CommonConstants } from '../../common/constants/CommonConstants'
import RecordType from '../../viewmodel/RecordType'
@Extend(Text) function  grayText(){
  .fontSize(12)
  .fontColor($r('app.color.light_gray'))
}
@Component
export default struct RecordList {
  @State foodArr:number[] = [1,2]
  @State mealArr:RecordType[] = [
    new RecordType(),
    new RecordType(),
    new RecordType(),
    new RecordType()
  ]


    // [{value:1,arr:this.foodArr},
    // {value:2,arr:this.foodArr},
    // {value:3,arr:this.foodArr},
    // {value:4,arr:this.foodArr},
    // {value:5,arr:this.foodArr}]
  build() {
    List({space:10}){
      ForEach(this.mealArr,(item:string,index)=>{
        ListItem(){
          Column() {
            Row({space:5}){
              Column(){
                Image($r('app.media.ic_breakfast'))
                  .width(20)
                  .linearGradient({
                    direction:GradientDirection.Top,
                    colors:[[Color.Red,0.0],[Color.White,0]]
                  })
              }
              .width(20)
              .height(20)


              Text(item).fontSize(18).fontWeight(700)
              Text('建议432~592大卡').grayText()
              Blank()
              Text('190').fontSize(14).fontColor($r('app.color.primary_color'))
              Text('千卡').grayText()
              Image($r('app.media.ic_public_add_norm_filled'))
                .width(20)
                .fillColor($r('app.color.primary_color'))
                .onClick(()=>{
                  router.pushUrl({url:"pages/ItemIndex"})
                })
            }
            .width('100%')
            List(){
              ForEach(this.foodArr,(item,index)=>{
                ListItem(){
                  Row(){
                    Image($r('app.media.toast'))
                      .width(50)
                    Column(){
                      Text('全麦吐司')
                        .fontWeight(CommonConstants.FONT_WEIGHT_500)
                      Text('1片')
                        .grayText()
                    }
                    Blank()
                    Text('91千卡')
                      .grayText()
                  }.width('100%').padding(6)
                }.swipeAction({end:this.deleteButton(index)})
              })
            }
            .width('100%')

          }
          .width('100%')
          .backgroundColor('#fff')
          .borderRadius(18)
          .padding(12)
        }
      })
    }
    .width(CommonConstants.THOUSANDTH_940)
    .height('100%')
    .margin({top:10})

  }
  @Builder
  deleteButton(index:number){
    Image($r('app.media.ic_public_delete_filled'))
      .width(20)
      .height(20)
      .fillColor(Color.Red)
      .margin(5)
      .onClick(()=>{
        this.foodArr.splice(index,1)
      })
  }
}