//完成一个卡片功能


import ShopInfo from '../viewmodel/ShopInfo'

@Entry
@Component
export default struct ShopItem {
  shop:ShopInfo
  build() {
    Column({space:5}){
      //餐厅名
      Row(){
        Text(this.shop.name)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width("100%")

      //餐厅地址
      Row(){
        Text(this.shop.address)
          .fontColor('#A3A3A3')
      }
      .width("100%")

      //餐厅点评
      Row(){
        Rating({rating:this.shop.score, indicator:true})
          .stars(5)
          .stepSize(0.1)
        Text(` ${this.shop.score/10}    `)
          .fontColor(Color.Orange)

        Text(`${this.shop.comments}条`)
        Blank()
        Text(`￥${this.shop.avgPrice}/人`)
      }
      .width("100%")


      //餐厅图片
      List({space: 10}){
        ForEach(this.shop.images,(image)=>{
          ListItem(){
            Column(){
              Image(image)
                .width(150)
                .height(150)
                .aspectRatio(1.1)
                .borderRadius(5)
            }
          }
        })
      }
      .listDirection(Axis.Horizontal).width('100%')

    }
    .width('100%')
    .height(250)
    .padding(12)
    .backgroundColor(Color.White)
    .borderRadius(15)
    .shadow({radius:10, color:"#F2F2F2",offsetX:5,offsetY:5})

  }
}