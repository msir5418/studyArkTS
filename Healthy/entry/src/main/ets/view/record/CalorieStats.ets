/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/19 10:23
 */
import { CommonConstants } from '../../common/constants/CommonConstants'
@Component
export default struct CalorieStats {
  intake:number = 192
  expend:number = 150
  recommend:number = CommonConstants.RECOMMEND_CALORIE
  remainCalorie(){
    return this.recommend -this.intake+this.expend
  }
  build() {
    Row({space:6}) {
      Column({space:6}){
        this.StatsBuilder({label:'饮食摄入',value:this.intake})
      }
      Column(){
        Stack(){
          Progress({value:this.intake,type:ProgressType.Ring,total:this.recommend})
            .width(120)
            .style({strokeWidth:CommonConstants.DEFAULT_10})
            .color($r('app.color.primary_color'))
          this.StatsBuilder({label:'还可以吃',value:this.remainCalorie(),tips:`推荐${this.recommend}`})
        }
      }
      Column(){
        this.StatsBuilder({label:'运动消耗',value:this.expend})
      }
    }
    .padding({top:30,bottom:30})
    .width('100%')
    .justifyContent(FlexAlign.SpaceEvenly)
  }

  @Builder
  StatsBuilder($$:{label:string,value:number,tips?:string}){
    Column(){
      Text($$.label)
        .fontColor($r('app.color.gray'))
        .fontWeight(CommonConstants.FONT_WEIGHT_600)
      Text($$.value+"")
        .fontSize(20)
        .fontWeight(CommonConstants.FONT_WEIGHT_700)
      if ($$.tips){
        Text($$.tips)
          .fontSize(12)
          .fontColor($r('app.color.light_gray'))
      }

    }
  }
}