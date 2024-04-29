import router from '@ohos.router'
import { CommonConstants } from '../common/constants/CommonConstants'
import ItemCard from '../view/item/ItemCard'
import ItemList from '../view/item/ItemList'
import ItemPanelHeader from '../view/item/ItemPanelHeader'
import NumberKeyboard from '../view/item/NumberKeyboard'
import RecordItem from '../viewmodel/RecordItem'
@Extend(Button) function panelButtonStyle(){
  .width(120)
  .type(ButtonType.Normal)
  .borderRadius(6)
}

@Entry
@Component
struct ItemIndex {
  @State showPanel: boolean = false
  @State recordItem:RecordItem = null
  @State amount:number = 1
  @State value:string = '1'
  onPanelShow(item:RecordItem){
    this.recordItem = item
    this.showPanel = true
  }
  @Builder panelButton(){
    Row({space:5}){
      Button('取消')
        .onClick(()=>{
          this.showPanel = false
        })
        .panelButtonStyle()
        .backgroundColor($r('app.color.light_gray'))
      Button('提交')
        .onClick(()=>{
          this.showPanel = false
          //持久化保存
        })
        .panelButtonStyle()
        .backgroundColor($r('app.color.primary_color'))
    }.margin({top:15})
  }
  build() {
      Column() {
        this.Header()
        ItemList({showPanel:this.onPanelShow.bind(this)})
        .layoutWeight(1)
        Panel(this.showPanel){
          ItemPanelHeader()
          if (this.recordItem){
            ItemCard({amount:this.amount,item:$recordItem})

          }
          NumberKeyboard({amount:$amount,value:$value})
            .margin({top:8,bottom:5})
          this.panelButton()
        }
        .mode(PanelMode.Full)
        .dragBar(false)
        .backgroundMask($r('app.color.light_gray'))
        .backgroundColor(Color.White)
      }
      .width('100%')
      .height('100%')
  }
  @Builder
  Header(){
    Row(){
      Image($r('app.media.ic_public_back'))
        .width(24)
        .onClick(()=>{
          router.back()
        })
      Blank()
      Text('早餐')
        .fontSize(18)
        .fontWeight(CommonConstants.FONT_WEIGHT_600)
    }
    .width(CommonConstants.THOUSANDTH_940)
    .height(32)
  }
}
