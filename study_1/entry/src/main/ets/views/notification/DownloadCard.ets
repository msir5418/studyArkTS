
import promptAction from '@ohos.promptAction'
import notificationManager from '@ohos.notificationManager'
import wantAgent, { WantAgent } from '@ohos.app.ability.wantAgent'
import Want from '@ohos.app.ability.Want'
import common from '@ohos.app.ability.common'
//每种状态作为枚举定义出来
enum DownloadState{
  NOT_BEGIN = "未开始",
  DOWNLOADING = "下载中",
  PAUSE = "已暂停",
  FINISHED = "已完成"
}
@Component
export  default  struct DownloadCard {
  private context = getContext(this) as common.UIAbilityContext
  //下载进度
  @State progressValue:number = 0
  progressMaxValue:number = 100

  //任务状态
  @State
  state:DownloadState = DownloadState.NOT_BEGIN

  //模拟下载的任务id
  taskId:number = -1

  //下载的文件的名字
  filename:string = '圣诞星.mp4'

  //是否支持下载模版
  isSupport:boolean = false

  wantAgentInstance:WantAgent
  async aboutToAppear(){
    //1.判断当前系统是否支持进度条模版
    this.isSupport = await notificationManager.isSupportTemplate('downloadTemplate')

    //2.创建拉取当前应用行为意图
    let wantInfo: wantAgent.WantAgentInfo = {
      //创建wantInfo不建议在 发送通知 方法中,因为该方法总是在被定时器调用,会导致对象反复创建
        wants:[{
          bundleName:'com.example.testapplication',
          abilityName: 'EntryAbility'
          /**
           * 这里不需要指定拉取应用后具体在哪个页面,因为此时EntryAbility
           * 已经启动并且在下载,所以点击之后会回到下载页面
           */
        }],
      requestCode:0,
      operationType:wantAgent.OperationType.START_ABILITY,
      wantAgentFlags:[wantAgent.WantAgentFlags.CONSTANT_FLAG]
    }
    this.wantAgentInstance = await wantAgent.getWantAgent(wantInfo)
  }
  build() {
    Row({space:10}){
      Image($r('app.media.ic_files_video')).width(50)
      Column({space:5}){
        Row(){
          Text(this.filename)
          Text(`${this.progressValue}%`).fontColor('#E9EAEC')
            .fontWeight(FontWeight.Bold)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)

        //进度条组件
        Progress({
          value:this.progressValue,//确定当前值
          total:this.progressMaxValue,//确定最大值
        })

        Row(){
          Text(`${(this.progressValue*0.66).toFixed(2)}MB`)
            .fontColor('#E9EAEC').fontSize(14)
            .fontWeight(FontWeight.Bold)
          Blank()
          if (this.state === DownloadState.NOT_BEGIN){
            Button('开始').downloadButton()
              .onClick(()=>this.download())
          }else if (this.state === DownloadState.DOWNLOADING){
            Button('取消').downloadButton().backgroundColor("#E9EAEC")
              .onClick(()=>this.cancel())
            Button('暂停').downloadButton()
              .onClick(()=>this.pause())
          }else if (this.state === DownloadState.PAUSE){
            Button('取消').downloadButton().backgroundColor("#E9EAEC")
              .onClick(()=>this.cancel())
            Button('继续').downloadButton()
              .onClick(()=>this.download())
          }else{
            Button('打开').downloadButton()
              .onClick(()=>this.open())
          }
        }
        .width('100%')

      }
      .layoutWeight(1)//布局权重
    }
    .width("100%")
    .borderRadius(20)//弧度
    .padding(15)
    .backgroundColor(Color.White)

  }
  notificationId:number = 1002
  publishDownloadNotification(string){
    let template = {
      name : 'downloadTemplate',
      data : {
        progressValue:this.progressValue,
        progressMaxValue:this.progressMaxValue
      }
    }
    let notificationRequest:notificationManager.NotificationRequest = {
      id:this.notificationId,
      template:template,
      wantAgent:this.wantAgentInstance,
      content:{
        contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal:{
          title:string+this.filename,
          text: string,
          additionalText:this.progressValue +'%'
        }
      },
      slotType:1
    }
    notificationManager.publish(notificationRequest)
      .then(()=>{
        console.log('motherTag','通知发送成功');
      })
      .catch(err=>{
        console.log('motherTag','通知发送失败');
      })
  }
  publishUndownloadNotification(string){
    let template = {
      name : 'downloadTemplate',
      data : {
        progressValue:this.progressValue,
        progressMaxValue:this.progressMaxValue
      }
    }
    let notificationRequest:notificationManager.NotificationRequest = {
      id:this.notificationId,
      template:template,
      wantAgent:this.wantAgentInstance,
      content:{
        contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal:{
          title:string+this.filename,
          text: string,
        }
      },
      slotType:1
    }
    notificationManager.publish(notificationRequest)
      .then(()=>{
        console.log('motherTag','通知发送成功');
      })
      .catch(err=>{
        console.log('motherTag','通知发送失败');
      })
  }
  download(){

    if (this.taskId>0){
      clearInterval(this.taskId)
    }
    //1.开启定时器，模拟下载
    this.taskId = setInterval(()=>{

      //先判断任务进度是否达到了100
      if (this.progressValue >= 100) {
        this.progressValue = 100
        //任务完成，取消定时任务
        clearInterval(this.taskId)
        //并且标记任务状态为已完成
        this.state = DownloadState.FINISHED
        //发送通知
        this.publishUndownloadNotification('下载完成')
        //结束程序
        return
      }
      //模拟任务进程变更
      this.progressValue += 2
      if (this.isSupport) {
        this.publishDownloadNotification('正在下载')
      }
    },100)
    //鸿蒙底层遇到定时器会创建新的线程去执行后面的代码
    //标记任务状态：下载中
    this.state = DownloadState.DOWNLOADING

  }

  cancel(){
    if (this.taskId>0) {
      clearInterval(this.taskId)
      this.taskId = -1
    }
    this.progressValue = 0
    this.state = DownloadState.NOT_BEGIN
    //取消任务通知
    notificationManager.cancel(this.notificationId)
  }

  pause(){
    if (this.taskId>0) {
      clearInterval(this.taskId)
    }
    this.state = DownloadState.PAUSE
    this.publishDownloadNotification('暂停下载')

    //任务暂停通知
  }

  open(){
    let want:Want={
      deviceId:'',
      bundleName:'com.example.testapplication',
      moduleName:'entry',
      abilityName:'EntryAbility',
      parameters:{
        toUrl: "pages/4-10/PopUp"
      }
    }
    this.context.startAbility(want)
  }

}

//按键特有属性
@Extend(Button) function downloadButton(){
  .width(75).height(30).fontSize(14)
}