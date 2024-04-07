/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/1 18:21
 */
@Entry
@Component
struct Demo0402 {
  @Provide num:number = 0
  build() {
    Row() {
      Text(`grandparent${this.num}`)
        .fontColor(Color.Red)
      parent()
    }
  }
}

@Component
struct parent {
  build() {
    Row(){
      Text('parent')
        .fontColor(Color.Green)
      son()
    }
  }
}

@Component
struct son {
  @Consume num:number
  build() {
    Row(){
      Text('son')
        .fontColor(Color.Blue)
        .onClick(()=>{
          this.num++
        })

    }
  }
}