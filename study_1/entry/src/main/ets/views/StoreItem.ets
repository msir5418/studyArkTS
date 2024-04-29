/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/10 14:28
 */
import StoreInfo from '../viewmodel/StoreInfo'
@Entry
@Component
export default struct StoreItem {
  store:StoreInfo
  build() {
    Column({space:5}){
      //名字
      Row() {
        Text(this.store.name)
          .fontSize(20)
          .fontWeight(FontWeight.Bold )
      }
      .width('100%')
      //地址
      Row() {
        Text(this.store.address)
          .fontColor('#ccc')
      }
      .width('100%')
      //点评
      Row() {
        Rating({rating:this.store.score/10,indicator:true}).stars(5)
        Text(`${this.store.score/10}`)
          .fontColor(Color.Yellow)
        Text(`${this.store.comments}条`)
        Blank()
        Text(`¥${this.store.avgPrice}/人`)
      }
      Row(){
        Image(this.store.images[0])
        Image(this.store.images[1])
      }
    }
    .width('100%')
    .height('250')
    .padding(12)
    .backgroundColor(Color.White)
    .borderRadius(15)

  }
}