/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/18 21:38
 */
import { CommonConstants } from '../../common/constants/CommonConstants'
@CustomDialog
export default struct DatePickDialog {
  controller:CustomDialogController
  private selectedDate: Date = new Date('2021-08-08')
  build() {
    Column() {
      DatePicker({
        start: new Date('2000-01-01'),
        end: new Date(),
        selected: this.selectedDate
      })
        .onChange((value: DatePickerResult) => {
          this.selectedDate.setFullYear(value.year, value.month, value.day)
        })
      Row({space:12}){
        Button('取消')
          .width(120)
          .backgroundColor($r('app.color.light_gray'))
          .onClick(()=>{
            this.controller.close()
          })
        Button('确定')
          .width(120)
          .backgroundColor($r('app.color.primary_color'))
          .onClick(()=>{
            //保存到全局存储
            AppStorage.SetOrCreate('selectedDate',this.selectedDate.getTime())
            this.controller.close()
          })

      }
    }.width('100%')
    .padding(CommonConstants.THOUSANDTH_12)
  }
}