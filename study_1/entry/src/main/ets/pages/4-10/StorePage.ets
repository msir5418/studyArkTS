
import storeModel from '../../model/StoreModel'
import StoreInfo from '../../viewmodel/StoreInfo'
import StoreItem from '../../views/StoreItem'
import { Head } from '../Header'

@Entry
@Component
struct StorePage {
  //1.发送网络请求,访问shopServer
  //2.获取shopServer的数据返回并遍历展示
  @State stores:StoreInfo[] = []
  onPageShow(){
    //加载商店数据
    this.loadStoreInfo()
  }
  build() {
    Row() {
      Column() {
        Head({title:'商铺列表'})
      }
      .width('100%')
      Column(){
        List({space:10}){
          ForEach(this.stores,shop=>{
            ListItem(){
              Column(){
                Text(this.stores[0].id+'')
                StoreItem({store:shop})
              }

            }
          })

        }
        .onReachEnd(()=>{

        })
      }
      .width('100%')
    }
    .backgroundColor('#f2f2f2')
    .height('100%')
  }
  loadStoreInfo(){
    //调用StoreModel完成的数据
    storeModel.getStoreList()
      .then(stores=>{
        //给图片加上服务器的地址前缀
        stores.forEach(s=>{
          s.images.forEach((img,i)=>{
            s.images[i] = 'http://localhost:3000'+img
          })
        })
        this.stores = stores
        console.log(JSON.stringify(this.stores[0]));

      })
  }
}