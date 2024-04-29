/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/18 16:06
 */
import { CommonConstants } from '../../common/constants/CommonConstants'
@Component
export default struct SearchHeader {
  @State count:number = 1
  build() {
    Row({space:CommonConstants.SPACE_6}) {
      Search({placeholder:'搜索饮食或运动信息'})
        .textFont({size:18})
        .layoutWeight(1)
      Badge({count:this.count,position:BadgePosition.RightTop,style:{fontSize:12}}){
        Image($r('app.media.ic_public_email'))
          .width(24)
      }
      .onClick(()=>{
        this.count = 0
      })

    }
    .width(CommonConstants.THOUSANDTH_940)
  }
}