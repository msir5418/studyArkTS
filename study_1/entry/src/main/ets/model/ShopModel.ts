//网络请求写在这个位置
//是工具类
//ts的文档规范
//class是ts的最小单元

//引入对象
import ShopInfo from '../viewmodel/ShopInfo'

import http from '@ohos.net.http';
import axios from '@ohos/axios';

class ShopModel{

  //设置的全局的URL变量
  baseURl:string = "http://localhost:3000"
  pageNo:number = 1
  pageSize:number = 3
  /**
   * 基于axios实现异步查询商铺
   */
  //发送请求获取数据返回
  getShopList():Promise<ShopInfo[]>{
    return new Promise((resolve,reject)=> {

      axios.get(
        `${this.baseURl}/shops`,
        {
          params: { pageNo: this.pageNo, pageSize: this.pageSize }
        }
      ).then(res => {
        if (res.status === 200) {
          console.log('motherFucker', '查询商铺成功', JSON.stringify(res.data));
          resolve(res.data)
        } else {
          console.log('motherFucker', '查询商铺失败', JSON.stringify(res.data));
          reject('查询商铺失败')
        }

      }).catch(err => {
        console.log('motherFucker', '查询商铺失败', JSON.stringify(err));
        reject(err)
      })
              //     //Promise作用：
      //     //1.弥补请求发送的语法上的不足，提供方法的返回值
      //     //2.可以存放泛型
      //     //3.提供了resolve，reject两个API---》用于返回成功/失败的信息
      //     //resolve:
      //     //reject:返回失败时的信息
      //     //1.创建http的请求对象
      //     // let httpRequest = http.createHttp()
      //     //2.发送请求
      //     // httpRequest.request(
      //     //   `${this.baseURl}/shops?pageNo=${this.pageNo}&pageSize=${this.pageSize}`,//url
      //     //   //pageSize表示每页显示的参数
      //     //   {
      //     //     method:http.RequestMethod.GET,
      //     //   }
      //     // )
      //     //   .then(resp=>{//返回结果不一定是自己需要的结果
      //     //     if (resp.responseCode === 200) {
      //     //
      //     //       resolve(JSON.parse(resp.result.toString()))
      //     //
      //     //       //打印日志：查询商品成功
      //     //       console.log("查询商品成功");
      //     //
      //     //     }else {
      //     //       console.log('查询商品信息失败！error:',JSON.stringify(resp))
      //     //       reject("查询商品失败");
      //     //     }
      //     //   })
      //     //   .catch(error=>{
      //     //     reject("查询商品失败");
      //     //     console.log('查询商品信息失败！error:',JSON.stringify(error))
      //     //   })
      //
      //   })
      // }
      /**
       * 基于Axios实现同步查询商品
       */
      // async getShopListAsync():Promise<ShopInfo[]> {
      //   let res = await axios.get(
      //     `${this.baseURl}/shops`,
      //     {
      //       params:{pageNo:this.pageNo,pageSize:this.pageSize}
      //     }
      //   )
      //   if (res.status === 200) {
      //     console.log('motherFucker','查询商铺成功',JSON.stringify(res.data));
      //     return res.data
      //   }
      //     console.log('motherFucker','查询商铺失败',JSON.stringify(res.data));
      // }
      /**
       * 基于request实现同步查询
       */
      // async getShopRequestAsync():Promise<ShopInfo[]>{
      //   let httpRequest =http.createHttp()
      //   let rep = await httpRequest.request(`${this.baseURl}/shops? pageNo=$i{this. pageNo}&pageSize`,
      //     {
      //       method:http.RequestMethod.GET
      //     })
      //   if(rep.responseCode == 200){
      //   return JSON.parse(rep.result.toString())
      //   }//查询成功
      //   console.log('查询商品信息失败!error: ' ,JSON.stringify(rep))}
    })
  }
}
const shopModel = new ShopModel();

export default shopModel as ShopModel