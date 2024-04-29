import ShopItem from '../../views/ShopItem'
import shopModel from '../../model/ShopModel'
import { Head } from '../Header'
import ShopInfo from '../../viewmodel/ShopInfo'

@Entry
@Component
struct ShopPage {

  //1.发起网络请求
  //2.获取shopServer的数据返回并遍历展示

  @State shops:ShopInfo[] = []
  isMore:boolean = true
  isLoading:boolean = false
  aboutToAppear(){
    //加载商品数据
    this.loadShopInfo()
  }

  build() {
    Row(){
      Column(){
        Head({title:'商铺列表'})
        List({space:10}){
          ForEach(this.shops, shop=>{
            ListItem(){
              ShopItem({shop:shop})
            }
          })
        }
        .onReachEnd(()=>{
          // if (shopModel.pageNo<this.shops.length) {
          if (!this.isLoading && this.isMore) {
            this.isLoading = true
            shopModel.pageNo++
            this.loadShopInfo()
          }
          // shopModel.pageSize++

        })
        .onReachStart(()=>{
          if (shopModel.pageNo>1) {
            shopModel.pageNo--
            this.loadShopInfo()
          }
          // shopModel.pageSize++
        })
      }
      .width('100%')
      .height("100%")
      .backgroundColor('#F2F2F2')
      .padding(12)

    }
    .height("100%")
  }

  //加载数据
  loadShopInfo(){
    //调用ShopModel完成数据的获取
    shopModel.getShopList()
      .then(shops=>{
        //给图片加上服务器地址前缀
        shops.forEach(s=>{
          s.images.forEach((src,i)=>{
            s.images[i] = 'http://localhost:3000' + src
          })

        })
        this.shops = shops.concat(shops)
        this.isLoading = false
        if (shops.length === 0) {
          this.isMore = false
        }
      })
  }
}