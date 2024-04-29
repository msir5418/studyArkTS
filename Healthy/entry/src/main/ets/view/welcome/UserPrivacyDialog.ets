/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/18 15:02
 */
import { CommonConstants } from '../../common/constants/CommonConstants'
@CustomDialog
export default struct UserPrivacyDialog {
  controller: CustomDialogController
  confirm:()=>void
  cancel:()=>void
  build() {
    Column({space:10}) {
        Text($r('app.string.user_privacy_title'))
          .fontSize(20)
          .fontWeight(CommonConstants.FONT_WEIGHT_700)
        Text($r('app.string.user_privacy_content'))
        Button('同意')
          .width(150)
          .backgroundColor($r('app.color.primary_color'))
          .onClick(()=>{
            this.confirm()
            this.controller.close()
          })
      Button($r('app.string.refuse_label'))
        .width(150)
        .backgroundColor($r('app.color.light_primary_color'))
        .fontColor($r('app.color.light_gray'))
        .onClick(()=>{
          this.cancel()
          this.controller.close()
        })
    }
    .width('100%')
    .padding(10)
  }
}