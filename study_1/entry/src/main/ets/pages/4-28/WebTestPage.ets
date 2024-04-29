// xxx.ets
import web_webview from '@ohos.web.webview'

@Entry
@Component
struct WebTestPage {
  @State flag:boolean = true
  @State percent:number = 100
  onlineController: web_webview.WebviewController = new web_webview.WebviewController()
  localController: web_webview.WebviewController = new web_webview.WebviewController()
  build() {
    Column() {
      Row(){
        Button(this.flag?'打开在线网页':'打开离线网页')
          .onClick(()=>{
            this.flag = !this.flag
          })
        Button('缩小')
          .onClick(()=>{
            this.percent-=10
          })
        Button('放大')
          .onClick(()=>{
            this.percent+=10
          })
      }


      if (this.flag){
        Web({ src: $rawfile('index.html'), controller: this.localController })
          .zoomAccess(true)
          .initialScale(this.percent)
      }else{
        Web({ src: 'www.baidu.com', controller: this.localController })
          .zoomAccess(true)
          .initialScale(this.percent)
      }

    }
  }
}