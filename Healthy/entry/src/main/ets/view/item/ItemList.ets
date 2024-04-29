/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/22 11:09
 */
import { CommonConstants } from '../../common/constants/CommonConstants'
import GroupInfo from '../../viewmodel/GroupInfo'
import { FoodCategoryEnum } from '../../module/ItemCategoryModel'
import itemModel from '../../module/ItemModel'
import ItemCategory from '../../viewmodel/ItemCategory'
import RecordItem from '../../viewmodel/RecordItem'
@Component
export default struct ItemList {
  foods:RecordItem[] = itemModel.list(true)
  showPanel: (item:RecordItem)=>void
  @State isRefreshing:boolean = false
  build() {
      Tabs() {
        TabContent(){
         this.TabContentBuilder(this.foods)
        }.tabBar('全部')
        ForEach(itemModel.listItemGroupByCategory(true),(group:GroupInfo<ItemCategory,RecordItem>)=>{
          TabContent(){
            this.TabContentBuilder(group.items)
          }.tabBar(group.type.name)
        })
        // TabContent(){
        //   this.TabContentBuilder(this.foods.filter(item=>item.categoryId==FoodCategoryEnum.STAPLE))
        // }.tabBar('主食')
        // TabContent(){
        //   this.TabContentBuilder(this.foods.filter(item=>item.categoryId==FoodCategoryEnum.FRUIT))
        // }.tabBar('果蔬')
        // TabContent(){
        //   this.TabContentBuilder(this.foods.filter(item=>item.categoryId==FoodCategoryEnum.MEAT))
        // }.tabBar('肉蛋奶')
        // TabContent(){
        //   this.TabContentBuilder(this.foods.filter(item=>item.categoryId==FoodCategoryEnum.NUT))
        // }.tabBar('坚果')
        // TabContent(){
        //   this.TabContentBuilder(this.foods.filter(item=>item.categoryId==FoodCategoryEnum.OTHER))
        // }.tabBar('其他')
      }
      .barMode(BarMode.Scrollable)
      .width(CommonConstants.THOUSANDTH_940)
      .height('100%')
  }
  @Builder
  TabContentBuilder(arr:RecordItem[]){
    Refresh({refreshing:$$this.isRefreshing}){
    List({space:6}){
      ForEach(arr,(item:RecordItem,index)=>{

        ListItem(){
            Row({space:6}){
              Image(item.image)
                .width(50)
              Column({space:4}){
                Text(item.name)
                  .fontWeight(CommonConstants.FONT_WEIGHT_500)
                Text(`${item.calorie}千卡/${item.unit}`)
                  .fontColor(14).fontColor($r('app.color.light_gray'))
              }
              Blank()
              Image($r('app.media.ic_public_add_norm_filled'))
                .width(18)
                .fillColor($r('app.color.primary_color'))

            }.width('100%').padding(6).onClick(()=>this.showPanel(item))

        }
      })
    }
    .height('95%')
    .width('100%')
    }
    .onStateChange(()=>{
      setTimeout(()=>{
        this.isRefreshing=false
      },2000)
    })

  }
}