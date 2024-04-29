/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/24 21:30
 */
@Entry
@Component
struct Test {
  classes:any[]=[
    {
      title:'星期一',
      projects:['语文','数学','英语']
    },
    {
      title:'星期二',
      projects:['物理','化学','生物']
    },
    {
      title:'星期三',
      projects:['历史','地理','政治']
    },
    {
      title:'星期四',
      projects:['美术','音乐','体育']
    },
    {
      title:'星期五',
      projects:['电竞','编程','计算机']
    },
    {
      title:'星期六',
      projects:['玩','吃','喝','拉','撒']
    },
    {
      title:'星期日',
      projects:['睡']
    },
  ]
  @Builder
  GroupHeader(day:string){
    Text(day)
      .backgroundColor('#AABBCC')
      .width('100%')
      .padding(5)

  }
  @Builder
  GroupFooter(num:number){
    Text(`共${num}节课`)
      .backgroundColor('#AABBCC')
      .width('100%')
      .padding(5)
  }
  build() {
    List({space:10}){
      ForEach(this.classes,(item,index)=>{
        //用于展示列表Item分组
        ListItemGroup({header:this.GroupHeader(item.title),footer:this.GroupFooter(item.projects.length)}){
          ForEach(item.projects,item=>{
            ListItem(){
              Text(item)
                .width('100%')
                .height(100)
                .textAlign(TextAlign.Center)
            }
          })

        }
        .divider({strokeWidth:1,color:Color.Black})
        .backgroundColor('#fff')
        .height(10)
      })

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ccc')
  }
}