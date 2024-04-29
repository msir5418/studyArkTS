
import http from '@ohos.net.http'
import StoreInfo from '../viewmodel/StoreInfo'

class StoreModel{
  pageNo:number = 1
  baseUrl:string = "http://localhost:3000"
  getStoreList(): Promise<StoreInfo[]>{
    return new Promise((resolve,reject)=>{
      //Promise作用
      //1.弥补请求发送的语法的不足，提供方法的返回值
      let httpRequest = http.createHttp()
      httpRequest.request(`${this.baseUrl}/shops?pageNo=${this.pageNo}&pageSize=10`,{
        method: http.RequestMethod.GET,
        // extraData:{pageNo:1,pageSize:3}
      }).then((resp)=>{
        if (resp.responseCode === 200) {
          console.log(resp.responseCode+'');
          resolve(JSON.parse(resp.result.toString()))
          console.log(JSON.parse(resp.result.toString()));
        }else {
          console.log('查询失败404',JSON.stringify(resp))
          reject('查询失败')

        }
      }).catch ((err)=>{
        reject('查询失败')
        console.log('查询失败500',JSON.stringify(err))
      })
    })

  }
}
const storeModel = new StoreModel()
export default storeModel as StoreModel