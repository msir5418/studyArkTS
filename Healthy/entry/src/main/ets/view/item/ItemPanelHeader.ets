/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/22 14:15
 */
import { CommonConstants } from '../../common/constants/CommonConstants'
import DateUtil from '../../common/utils/DateUtil'
import DatePickDialog from '../record/DatePickDialog'
@Component
export default struct ItemPanelHeader {
  @StorageProp('selectedDate') selectedDate:number = DateUtil.beginTimeOfDay(new Date)
  controller:CustomDialogController = new CustomDialogController({
    builder:DatePickDialog({selectedDate:new Date(this.selectedDate)})
  })
  build() {
    Row() {
        Text(`${DateUtil.formatDate(this.selectedDate)}早餐`)
          .fontSize(18)
          .fontWeight(CommonConstants.FONT_WEIGHT_600)
        Image($r('app.media.ic_public_spinner'))
          .width(20)
          .fillColor(Color.Black)
    }
    .onClick(()=>{
      this.controller.open()
    })
  }
}