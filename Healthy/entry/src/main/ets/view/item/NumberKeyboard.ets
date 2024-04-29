/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/22 16:24
 */
import { CommonConstants } from '../../common/constants/CommonConstants'



@Component
export default struct NumberKeyboard {
  @Link amount:number
  @Link value:string
  // flag:boolean = false
  arr:string[] = ['1','2','3','4','5','6','7','8','9','0','.']
  @Styles keyBoxStyle(){
    .backgroundColor(Color.White)
  }
  clickNumber(num:string){
    // 1.拼接用户输入的内容
    let val = this.value + num
    // 2.校验输入格式是否正确
    let firstIndex = val.indexOf('.')
    let lastIndex = val.lastIndexOf('.')
    if(firstIndex !== lastIndex || (lastIndex != -1 && lastIndex < val.length - 2)){
      // 非法输入
      return
    }
    // 3.将字符串转为数值
    let amount = parseFloat(val)
    // 4.保存
    if(amount >= 999.9){
      this.amount = 999.0
      this.value = '999'
    }else{
      this.amount = amount
      this.value = val
    }
    // if (item == '.'){
      //   this.flag = true
      // }
      // if (parseInt(item)) {
      //   this.amount = parseInt(item)+this.amount*10
      // }
      // if (item=='删除'){
      //   this.amount = (this.amount - this.amount%10)/10
      // }
      // if (this.amount>=999) {
      //   this.amount = 999
      // }

  }
  clickDelete(){
    if(this.value.length <= 0){
      this.value = '0'
      this.amount = 0
      return
    }
    this.value = this.value.substring(0, this.value.length - 1)
    this.amount = this.parseFloat(this.value)
  }
  parseFloat(str: string){
    if(!str){
      return 0
    }
    if(str.endsWith('.')){
      str = str.substring(0, str.length - 1)
    }
    return parseFloat(str)
  }
  build() {
    Grid(){
      ForEach(this.arr,(item,index)=>{
        GridItem(){
          Button({type:ButtonType.Normal}){
            Text(item)
              .fontSize(20)
              .fontWeight(CommonConstants.FONT_WEIGHT_600)
          }
          .onClick(()=>{
            this.clickNumber(item)
          })
          .width('100%')
          .height(63)
          .borderRadius(10)
          .backgroundColor(Color.White)
        }
      })
      GridItem(){
        Button({type:ButtonType.Normal}){
          Text('删除')
            .fontSize(20)
            .fontWeight(CommonConstants.FONT_WEIGHT_600)
        }
        .width('100%')
        .height(60)
        .borderRadius(10)
        .backgroundColor(Color.White)
        .onClick(()=>{
          this.clickDelete()
        })
      }
    }
    .columnsTemplate('1fr 1fr 1fr')
    .height(280)
    .padding(5)
    .columnsGap(5)
    .rowsGap(5)
    .backgroundColor('#F2F2F2')
  }
}