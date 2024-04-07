import router from '@ohos.router'
import display from '@ohos.display'
@Entry
@Component
struct AnimationPage {
  // @State message: string = 'Harmony OS'

  //小鱼坐标
  @State fishX:number =200
  @State fishY:number =150
  @State angle:number = 0
  @State w:number =50
  @State h:number =50
  //遥杆中心区域坐标
  private centerX:number = 120
  private centerY:number = 120
  //轮盘半径
  private maxRadius:number = 100
  private Radius:number = 20
  //小鱼图片
  fish_img:Resource = $r('app.media.fish')
  //背景图片
  bg_src:Resource = $r('app.media.sea')
  //是否开始游戏
  @State isBegin:boolean = false
  //小鱼速度
  speed:number = 0
  //初始小球位置
  @State positionX:number = this.centerX
  @State positionY:number = this.centerY

  //对于坐标/宽高/透明度这种外在属性的改变无需装饰器也能触发视图刷新
  //定时器对象
  taskId:number = -1
  //角度
  sin:number = 0
  cos:number = 0
  ang:number = 0
  build() {

    Row(){
      Stack(){
        Image(this.bg_src)
          // Column() {
          //   //1.animation属性写在要监控变化的属性下面
          //   //2.不一定对所有属性都生效
          //   Text(this.message)
          //     .position({x:10,y:0})
          //     .rotate({
          //       angle:0, //旋转角度
          //       centerX:'50%',
          //       centerY:'50%' //旋转中心
          //     })
          //     .animation({
          //       duration:1000,
          //       curve:Curve.Linear
          //     })
          //     .fontSize(50)
          //     .fontWeight(FontWeight.Bold)
          // }
          // .width('100%')
          Button('返回')
            .position({
              x:0,
              y:0
            })
            .backgroundColor('#47B3BD')
            .onClick(()=>{
              animateTo({duration:1000,onFinish:()=>{
                this.isBegin = false
              }},
                ()=>{
                  this.fishX = -100
                  this.angle = -1800
                  this.w=50
                  this.h=50
                })
            })


          if (!this.isBegin){
            //开始游戏按钮
            Button('开始游戏')
              .onClick(()=>{
                //小鱼入场动画
                animateTo({duration:2000},
                  ()=>{
                    this.isBegin = true
                  })
              })
              .width(100)
              .height(50)
          }else {
            Image(this.fish_img)
              .width(this.w)
              .height(this.h)
              .position({
                x:this.fishX,
                y:this.fishY
              })
              .rotate({
                angle:this.angle, //旋转角度
                centerX:'50%',
                centerY:'50%'
              })
              .animation({
                duration:1000,
                curve:Curve.Smooth
              })
              .transition({
                type:TransitionType.All,
                translate:{x:-350},
                scale:{x:0.1,y:0.1},
                rotate:{angle:-1800},
                opacity:0
              })
          }

          // Column({space:10}){
          //   Row(){
          //     Button('↑')
          //       .backgroundColor('#61bbc3')
          //       .onClick(()=>{
          //         animateTo({duration:500},()=>{
          //           this.angle -= 45
          //           this.fishY -= 20
          //         })
          //       })
          //   }
          //   Row({space:40}){
          //     Button('←')
          //       .backgroundColor('#61bbc3')
          //       .onClick(()=>{
          //         this.fish_img = $r('app.media.fish_rev')
          //         animateTo({duration:500},()=>{
          //           this.fishX -= 20
          //         })
          //       })
          //     Button('→')
          //       .backgroundColor('#61bbc3')
          //       .onClick(()=>{
          //         this.fish_img = $r('app.media.fish')
          //         animateTo({duration:500},()=>{
          //           this.fishX += 20
          //         })
          //
          //       })
          //   }
          //   Row(){
          //     Button('↓')
          //       .backgroundColor('#61bbc3')
          //       .onClick(()=>{
          //         animateTo({duration:500},()=>{
          //           this.angle += 45
          //           this.fishY += 20
          //         })
          //       })
          //   }
          //
          // }
          // .position({
          //   x:0,y:120
          // })
          // .height(250)
          // .width(250)
          // .justifyContent(FlexAlign.Center)
          // .backgroundImagePosition(Alignment.BottomStart)
          Row(){
              Circle()
                .width(this.maxRadius*2)
                .height(this.maxRadius*2)
                .fill("#47B3BD")
                .fillOpacity(0.5)
                .position({
                  x:this.centerX-this.maxRadius,
                  y:this.centerY-this.maxRadius
                })
              Circle()
                .width(this.Radius*2)
                .height(this.Radius*2)
                .fill("#b1b1b1")
                .fillOpacity(0.8)
                .position({
                  x:this.positionX - this.Radius,
                  y:this.positionY - this.Radius
                })

          }
          .width(200).height(200)
          .position({x:0,y:120})
          .justifyContent(FlexAlign.Center)
          .onTouch(this.handleTouchEvent.bind(this))

      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
  }
  handleTouchEvent(event:TouchEvent){
    switch (event.type){
      case TouchType.Up:
        clearInterval(this.taskId)
        //小鱼速度归零
        this.speed = 0
        //小球位置还原
        animateTo({duration:500,curve:Curve.Smooth},()=>{
          this.positionX = this.centerX
          this.positionY = this.centerY
        })
        break;
      case TouchType.Down:
        this.taskId = setInterval(()=>{
          this.fishX += this.speed * this.cos
          if (this.fishX < 0) {
            this.fishX=0
          }
          if (this.fishX > 735) {
            this.fishX=735
          }
          // screen = display.getDefaultDisplaySync();

          console.log('x:'+this.fishX);
          this.fishY += this.speed * this.sin
          console.log('y:'+this.fishY);
          if (this.fishY < 0) {
            this.fishY=0
          }
          if (this.fishY > 315) {
            this.fishY=315
          }
          this.angle = this.angle
        },7)
        break;
      case TouchType.Move:
        //获取手指坐标
          this.speed = 0.5
          let x = event.touches[0].x
          let y = event.touches[0].y
        //计算手指与大球圆心的距离和坐标差
          let vx = x - this.centerX
          let vy = y - this.centerY

          // this.ang = Math.atan2(vy,vx)
        //计算手指与中心点连线和x轴的正半轴夹角,单位是弧度
        let distance = this.getDistance(vx,vy)
        this.sin = vy/distance
        this.cos = vx/distance
        if (Math.sqrt(vx*vx+vy*vy)-this.maxRadius > 0) {
          this.positionX = this.maxRadius*this.cos +this.centerX
          this.positionY = this.maxRadius*this.sin +this.centerY
        }else{
          this.positionX = x
          this.positionY = y
        }

        if (vx<0) {
          this.fish_img= $r('app.media.fish_rev')
          this.angle = -Math.asin(vy / distance)*180/Math.PI
        }else{
          this.fish_img= $r('app.media.fish')
          this.angle = Math.asin(vy / distance)*180/Math.PI
          // this.angle =Math.acos(vx / distance)*180/Math.PI
        }

        this.speed *= this.getDistance(this.positionX-this.centerX,this.positionY-this.centerY)/this.Radius
        // - (Math.sqrt(x*x+y*y)-this.Radius)*this.sin
        break;
      case TouchType.Cancel:;
        break;
    }
  }
  //求斜边
  getDistance(x:number,y:number){
    let d = Math.sqrt(x*x+y*y)
    return d
  }
}

