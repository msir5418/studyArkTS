@Observed
export default class Tack_Vo{
  id:number
  //任务名称
  name:string
  //是否完成
  isFinish:boolean

  constructor(id:number,name: string, isFinish?: boolean) {
    this.name = name
    this.isFinish = false
  }
}