/**
 * @author mxd
 * @vesion 1.0
 * @since 2024/3/29 11:46
 * 测试@State属性是否触发页面刷新
 * 测试各种数据类型及其数组是否支持@State
 */
import { Person } from '../entryability/Person'

enum Student_info{
  NAME = 'name',
  SEX = 'sex'
}

@Entry
@Component
struct StatePage {
  // @State name:string = 'amy'
  // @State age:number = 19
  // @State i:number = 1
  // amy:Person = new Person('amy',19)
  // jack:Person = new Person('jack',21,this.amy)
  // @State arr:Array<Person> = [this.amy,this.jack]
  // @State isHot:boolean = false
  // @State isHots:Array<boolean> = [false,true]
  // @State info:Student_info = false
  @State info_s:Array<Student_info> = [Student_info.NAME,Student_info.SEX]
  build() {
    Row() {
      Column(){
        // Text(`${this.jack.name}:${this.jack.age}${this.jack.girl.name}:${this.jack.girl.age}`)
        // Text(`${this.jack.name}:${this.jack.age}`)
        //   .fontSize(50)
        //   .fontWeight(FontWeight.Bold)
        //   .fontColor('#000')
        //   .onClick(()=>{
        //     this.jack.age+=1
        //   })
        // Button('添加')
        //   .onClick(()=>{
        //     this.arr.push(new Person('女友'+this.i++,this.i))
        //   })
        // Text('=====List====')
        //   .fontSize(50)
        //   .fontWeight(FontWeight.Bold)
        // ForEach(this.arr,(g:Person,index)=>{
        //   Row(){
        //     Text(`${g.name}:${g.age}`)
        //       .fontSize(30)
        //       .fontColor('#F00')
        //       .onClick(()=>g.age++)
        //     Button('删除')
        //       .onClick(()=> {
        //         this.arr.splice(index,1)
        //       })
        //
        //   }
        // })th
        //验证@State 能否支持 boolean及其数组
        // Text(`今天天气很:${this.isHot? '热': '冷'}`)
        //   .onClick(()=>this.isHot = !this.isHot)
        //   .fontSize(30)
        // ForEach(this.isHots,(item,index)=>{
        //   Text(`arr:${index}今天天气很:${item? '热': '冷'}`)
        //     .onClick(()=>this.isHots[index] = !item)
        //     .fontSize(30)
        // })
        //验证@State 能否支持 enum及其数组
        Button('添加枚举数组')
          .onClick(()=>{
            this.info_s.push(Student_info.NAME,Student_info.SEX)
          })
          .width(100)
          .height(50)
        ForEach(this.info_s,(item,index)=>{
          Text(`arr:${index},${item}`)
            .fontSize(30)
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}