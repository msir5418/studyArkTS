import router from '@ohos.router'
@Entry
@Component
struct LoginPage {
  username:string
  pwd:string
  @State isLogin:boolean = true
  build() {
    Row() {
      Column({space:20}) {
        TextInput({placeholder:'请输入用户名'})
          .onChange((val)=>{
            this.username = val
          })
        TextInput({placeholder:'请输入密码'})
          .type(InputType.Password)
          .onChange((val)=>{
            this.pwd = val
          })
        if (!this.isLogin){
          Text('登录失败').fontSize(15).fontColor('#ff0000')
        }
        Button('登录')
          .onClick(()=>{
            router.pushUrl({
              url:'pages/SecondPage/ShopList',
              params:{
                username:this.username,
                pwd:this.pwd
              }
            })
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}