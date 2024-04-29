//页面接收服务器返回时的对象类

export default class ShopInfo{

  id: number
  name: string
  images: string[]
  area: string
  address: string
  avgPrice: number//平均消费
  comments: number
  score: number
  openHours: number

}