/**
 * Column布局
 * 调整justifyContent属性值
 * 使用ForEach遍历数组方法
 * 添加Scroll滚动条
 */
//构建全局样式函数
@Styles function fillScreen(){
  .width('100%')
  .height('100%')
  .padding(20)
  .backgroundColor('f2f2f2')
}
//继承模式,只能写成全局函数
@Extend (Text) function textControl(){
  //非通用属性只能使用继承模式并且只能是全局
  .fontSize(20)
  .fontColor(0x00ff00)
  .fontWeight(FontWeight.Bold)
}
import {Head,FontBold} from './Header'
class Shop{
  name:string
  image:Resource
  price:number
  subsidy:number
  stock:number

  constructor(name: string, image:Resource,price:number,subsidy:number,stock:number) {
    this.name = name
    this.image = image
    this.price = price
    this.subsidy = subsidy
    this.stock = stock
  }
}
@Entry
@Component
struct ShopList{
  @State col:string = 'f00'
  //商品信息
  private items:Array<Shop> = [
    new Shop('华为mate60',$r('app.media.mate60'),6999,0,10),
    new Shop('mateBookProX',$r('app.media.mateBookProX'),16999,3000,3),
    new Shop('mateX5',$r('app.media.mateX5'),2999,500,2),
    new Shop('freeBudsPro3',$r('app.media.freeBudsPro3'),999,300,20),
    new Shop('watchGT4',$r('app.media.watchGT4'),1599,0,2),
    new Shop('mateX5',$r('app.media.mate60'),1599,99,1),
  ]
  // private item = [
  //   {name:'华为mate60',image:$r('app.media.mate60'),price:6999},
  //   {name:'华为mate60',image:$r('app.media.mate60'),price:6999},
  //   {name:'华为mate60',image:$r('app.media.mate60'),price:6999},
  //   {name:'华为mate60',image:$r('app.media.mate60'),price:6999},
  //   {name:'华为mate60',image:$r('app.media.mate60'),price:6999}
  // ]

  build() {
      Column({ space: 15 }) {
        Row() {
          //调用组件
          Head({title:'商品列表'} )

        }
        .width('90%')
        .height('10%')
        .justifyContent(FlexAlign.Start)
        List({ space: 20}) {
          ForEach(this.items, (s: Shop) => {
          // ForEach(this.item, (s: any) => {
            ListItem(){
              Row({ space: 4 }) {
                Column() {
                  Image(s.image)
                    .width(100)
                }

                Column() {
                  Row() {
                    FontBold({text:s.name,fSize:22})
                  }
                  .width('100%')
                  .margin({
                    bottom: 10
                  })
                  if (s.subsidy){
                    Row() {
                      Text('原价:¥' + s.price)
                        .fontSize(16)
                        .fontColor('#F00')
                        .decoration({type:TextDecorationType.LineThrough})
                    }
                    .width('100%')
                    Row() {
                      Text('折扣价:¥' + (s.price-s.subsidy))
                        .textControl()
                    }
                    .width('100%')
                    Row() {
                      Text('补贴:¥' + s.subsidy)
                        .fontSize(16)
                        .fontColor('#F00')
                    }
                    .width('100%')
                  }else{
                    Row() {
                      Text('原价:¥' + s.price)
                        .fontSize(16)
                        .fontColor('#F00')
                    }
                    .width('100%')
                  }
                  if (s.stock <= 5) {
                    Row() {
                      Text('库存('+s.stock+')')
                        .fontSize(16)
                        .fontColor(this.col)
                        .onHover(()=>this.col='#fff')
                    }
                  }

                }
                .height('90%')
              }
              .width('100%')
              .height(120)
              .backgroundColor('#fff')
              .borderRadius(20)
            }
          })
        }
        .width('90%')
        Text('到底了')
          .fontSize(18)
          .fontColor('#ccc')
      }
      .width('100%')
      .backgroundColor('#F2F2F2')


  }
}