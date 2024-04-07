/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/1 18:03
 */
import router from '@ohos.router'

@Entry
@Component
struct Demo413{
  build() {
    Column({space:20}) {
      Row(){
        Text('页面列表')
          .fontSize(60)
          .fontWeight(FontWeight.Bold)
      }
      Row(){
        Button('1.                                              图片查看案例')
        .onClick(()=>{
          router.pushUrl({
            url:"pages/ThirdPage/Index"
          })
        })
        .fontColor(Color.White)
        .width('100%')
        .height(50)
      }
      Row(){
        Button('1.                                              商品列表案例')
          .onClick(()=>{
            router.pushUrl({
              url:"pages/SecondPage/ShopList"
            })
          })
          .fontColor(Color.White)
          .width('100%')
          .height(50)
      }
      Row(){
        Button('2.                                              Jack和他的女友')
          .onClick(()=>{
            router.pushUrl({
              url:"pages/ThirdPage/StatePage"

            })
          })
          .fontColor(Color.White)
          .width('100%')
          .height(50)
      }
      Row(){
        Button('3.                                              任务列表案例')
          .onClick(()=>{
            router.pushUrl({
              params:{id:3},
              url:"pages/ThirdPage/Task"
            })
          })
          .fontColor(Color.White)
          .width('100%')
          .height(50)
      }

    }
    .width('100%')
    .height('100%')
  }
}


