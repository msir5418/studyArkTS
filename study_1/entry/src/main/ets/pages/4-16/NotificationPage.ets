import notificationManager from '@ohos.notificationManager';
import common from '@ohos.app.ability.common';
import { Head } from '../Header';
import image from '@ohos.multimedia.image';
import DownloadCard from '../../views/notification/DownloadCard';
let notificationRequest:notificationManager.NotificationRequest
@Entry
@Component
struct NotificationPage {
  @State src:PixelMap = undefined
  index:number =0
  private context =  getContext(this) as common.UIAbilityContext

  async getPixelMap(resource){
    const resourceMgr = this.context.resourceManager
    //数据库存这个数据,也查这个数据
    const fileData = await resourceMgr.getMediaContent(resource)
    const imageSource = image.createImageSource(fileData.buffer)
    const pixelMap = await imageSource.createPixelMap()
    return pixelMap
  }
  async aboutToAppear(){
    this.src = await this.getPixelMap($r('app.media.mateBookProX'))
  }
  private publish(request){
    notificationManager.publish(request)
      .then(()=>console.log('motherfucker','发送通知成功'))
      .catch(error=>console.log('motherfucker','发送通知失败',JSON.stringify(error)))
  }
  publishNormalTextNotification(){
    notificationRequest= {
      id: this.index++,
      content: {
        contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT, // 普通文本类型通知
        normal: {
          title: '下午好',
          text: 'slotType'+'其他类型'+'效果',
          additionalText: 'test_additionalText',
        }
      },
      showDeliveryTime:true,
      deliveryTime:new Date().getTime(),
      groupName:'泥号',
      slotType:0xffff
    }
    this.publish(notificationRequest)
  }
  publishLongTextNotification(){
     notificationRequest = {
      id: this.index++,
      content: {
        contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LONG_TEXT, // 长文本类型通知
        longText: {
          title: '早上好',
          text: '记录',
          additionalText: 'test_additionalText',
          longText: '精神障碍的临床特征是个人认知、情绪调节或行为严重紊乱。它往往由痛苦或重要功能区受损造成。精神障碍有许多不同类型。它也可被称为精神健康问题。精神健康问题范围更广，涵盖精神障碍、心理社会残疾以及（其他）与显著痛苦、功能障碍或自我伤害风险相关的（其他）精神状态。本实况报道侧重于《国际疾病分类第十一次修订本》（ICD-11）所述的精神障碍。2019年，每8人中就有1人，即全球共有9.7亿人有精神障碍，其中焦虑症和抑郁症最为常见(1)。2020年，由于COVID-19大流行疫情，焦虑症和抑郁症患者人数大幅增加。据初步估计，在短短一年内，焦虑症和重度抑郁症患者分别增加了26%和28% (2)。虽然已有行之有效的预防和治疗方案，但大多数精神障碍者未能获得有效医治和护理。许多人还遭受羞辱和歧视，人权遭到侵犯。',
          briefText: '沙井吧',
          expandedTitle: '神金记录',
        }
      }
    }
    this.publish(notificationRequest)
  }
  publishMultilineTextNotification(){
    let notificationRequest = {
      id: this.index++,
      content: {
        contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_MULTILINE, // 多行文本类型通知
        multiLine: {
          title: '标题',
          text: '内容',
          briefText: '简介',
          longTitle: '长标题',
          lines: ['第一行', '第二行', '第三行', '第四行'],
        }
      }
    }

    this.publish(notificationRequest)

  }
  publishPictureNotification(){
    notificationRequest = {
      id: this.index++,
      content: {
        contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_PICTURE,
        picture: {
          title: 'test_title',
          text: 'test_text',
          additionalText: 'test_additionalText',
          briefText: 'test_briefText',
          expandedTitle: 'test_expandedTitle',
          picture: this.src
        }
      }
    };
    this.publish(notificationRequest)
  }
  build() {
    Row() {
      Column({space:10}) {
        Head({title:'发送通知'})
        Button('发送普通通知')
          .onClick(()=>{
            this.publishNormalTextNotification()

          })
          .width('50%')
        Button('发送长文本通知')
          .onClick(()=>{
            this.publishLongTextNotification()
          }).width('50%')
        Button('发送多行文本通知')
          .onClick(()=>{
            this.publishMultilineTextNotification()
          }).width('50%')
        Button('发送图片文本通知')
          .onClick(()=>{
            this.publishPictureNotification()
          }).width('50%')
          //下载功能卡片
        DownloadCard()
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#f0f0f0')
    }
    .height('100%')
  }
}

