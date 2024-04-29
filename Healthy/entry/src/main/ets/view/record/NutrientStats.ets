/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/19 11:24
 */
import { CommonConstants } from '../../common/constants/CommonConstants'
@Component
export default struct NutrientStats {
  recommendCarbon:number = CommonConstants.RECOMMEND_CARBON
  recommendProtein:number = CommonConstants.RECOMMEND_PROTEIN
  recommendFat:number = CommonConstants.RECOMMEND_FAT
  carbon:number = 48
  protein:number = 28
  fat:number = 10

  build() {
    Row() {
      Column(){
        Stack(){
          this.StatsBuilder($r('app.color.carbon_color'),'碳水化合物',this.carbon,this.recommendCarbon)
        }
      }
      Column(){
        Stack(){
          this.StatsBuilder($r('app.color.protein_color'),'蛋白质',this.protein,this.recommendProtein)
        }
      }
      Column(){
        Stack(){
          this.StatsBuilder($r('app.color.fat_color'),'脂肪',this.fat,this.recommendFat)
        }
      }
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceEvenly)
  }
  @Builder
  StatsBuilder(color:ResourceStr, tips:string, value:number, recommend:number){
    Column(){
      Column(){
        Stack(){
          Progress({value:value,type:ProgressType.Ring,total:recommend})
            .width(100)
            .style({strokeWidth:CommonConstants.DEFAULT_6})
            .color(color)
          Column(){
            Text('摄入推荐')
              .fontSize(12)
              .fontColor($r('app.color.light_gray'))
            Text(value.toFixed(0)+'/'+recommend.toFixed(0))
              .fontSize(20)
              .fontWeight(CommonConstants.FONT_WEIGHT_700)
          }
        }
        Text(tips+'(克)')
          .fontSize(12)
          .fontColor($r('app.color.light_gray'))

      }

    }
  }
}