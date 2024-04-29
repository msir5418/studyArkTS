/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/25 19:13
 */
@Extend(Progress) function  grayProgress(){
    .width(150)
    .color(Color.Gray)
}
@Entry
@Component
struct TestProgress {
  build() {
    Column({space:10}) {
      Progress({value:3,total:20,type:ProgressType.Linear})
        .grayProgress()
      Progress({value:2,total:10,type:ProgressType.Ring})
        .grayProgress()
      Progress({value:1,total:10,type:ProgressType.Eclipse})
        .grayProgress()
      Progress({value:2,total:10,type:ProgressType.ScaleRing})
        .grayProgress()
      Progress({value:5,total:10,type:ProgressType.Capsule})
        .grayProgress()
        .width(40)
        .height(300)
    }
    .margin(20)
  }
}