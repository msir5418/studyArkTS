/**
 * @author mxd
 * @version 1.0
 * @since 2024/3/29 14:56
 * 一个综合的任务管理
 * 添加了Progress画出圆形进度条
 * 通过Stack()容器将内容置于圆内
 * 学习了@Prop和@Link使用方式
 * 学习了@Provide和Consume使用方式
 * 使用@Styles封装了一个样式card()
 */
import { Head } from '../Header'
import router from '@ohos.router'

@Extend(Text) function abc(){
  .decoration({type:TextDecorationType.LineThrough})
  .fontColor('#ccc')
}
@Component
struct TaskStatistic{
  @Consume task_fNum:number
  @Consume task_num:number
  // @Prop task_fNum:number
  // @Prop task_num:number
  build() {
    Row(){
      Text('任务进度:')
        .fontSize(40)
        .fontWeight(FontWeight.Bold)
      Stack(){ //堆叠容器
        Row(){
          Text(this.task_fNum+"")
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Blue)
            .fontSize(30)
          Text(' / '+this.task_num)
            .fontWeight(FontWeight.Bold)
            .fontSize(30)
        }
        Progress({
          value:this.task_fNum,
          total:this.task_num,
          type: ProgressType.Ring
        })
          .width(120)
      }


    }
    .card()
    .justifyContent(FlexAlign.SpaceEvenly)
    .height(180)
  }
}
@Component
struct TaskList{
  @Consume task_fNum:number
  @Consume task_num:number
  // @Link task_fNum:number
  // @Link task_num:number
  @State task_arr:Array<Tack_Vo> = []
  build() {
    Column(){
      Row(){
        Button('新增任务')
          .width(150)
          .onClick(()=>{
            this.task_num++
            this.task_arr.push(new Tack_Vo('任务'+Task.i++,false))
          })
      }
      List({space:10,initialIndex:0}){
        ForEach(this.task_arr,(p:Tack_Vo,index)=>{
          ListItem(){
            TaskItem({
              index:index,
              task_fNum:$task_fNum,
              task_num:$task_num,
              task_arr:$task_arr,
              p:p
            })
          }
          .width('100%')
          .swipeAction({ end:itemEnd(index)})

        })
      }
      .width('100%')
      .height('60%')
      .alignListItem(ListItemAlign.Center)
      .edgeEffect(EdgeEffect.Spring)
    }


  }
}
@Builder function  itemEnd(index:number){
  Row(){
    Button(){
      Image($r('app.media.ic_public_delete'))
        .width(20)
    }
    .type(ButtonType.Capsule)
    .width(60)
    .height(60)
    .backgroundColor('#f00')
    .onClick(()=>{
      if (this.task_arr[index].isFinish) {
        this.task_fNum--
      }
      this.task_arr.splice(index,1)
      this.task_num--

    })
  }
}
@Entry
@Component
struct Task {
  static i:number = 1
  @Provide task_fNum:number = 0
  @Provide task_num:number = 0
  @State task_arr:Array<Tack_Vo> = []

  build() {
    Column({space:10}) {
      Row(){
        Head({title:''})
      }
      TaskStatistic()
      TaskList()
    }
    .backgroundColor('#F1F2F4')
    .width('100%')
    .height('100%')
  }
}
@Observed
class Tack_Vo{
  //任务名称
  name:string
  //是否完成
  isFinish:boolean

  constructor(name: string, isFinish: boolean) {
    this.name = name
    this.isFinish = isFinish
  }
}
@Styles function card(){
  .width('90%')
  .backgroundColor('#fff')
  .borderRadius(15)
  .shadow({radius:20,color:'#6e6e6e',offsetX:10,offsetY:5})
}
//构建视图渲染的第三方组件
@Component
struct TaskItem{
  index:number
  @ObjectLink p:Tack_Vo
  @Link task_fNum:number
  @Link task_num:number
  @Link task_arr:Array<Tack_Vo>
  build(){
    Row(){
      if (this.p.isFinish) {
        Text(this.p.name)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .decoration({type:TextDecorationType.LineThrough,color:'#e2e2e2'})
          .fontColor('#e2e2e2')
      }else {
        Text(this.p.name)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      Checkbox()
        .select(this.p.isFinish)
        .onChange((bol)=>{
          // this.task_arr[this.index] = new Tack_Vo(this.p.name,bol)
          this.p.isFinish = bol
          if (bol) {
            this.task_fNum++
          }else{
            this.task_fNum--
          }
        })
    }
    .margin(10)
    .padding(10)
    .justifyContent(FlexAlign.SpaceBetween)
    .card()
    .height(80)
  }
}