@Entry
@Component
struct PopUp {
  upController: CustomDialogController = new CustomDialogController({
    builder: PopUpComment()
  })
  build() {
    Row() {
      Column() {
        Button('自定义弹窗')
          .onClick(()=>{
            this.upController.open()
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@CustomDialog
struct PopUpComment{
  controller: CustomDialogController
  build(){
    Column()
    {
      Text('一只鱼')
      Image($r('app.media.fish'))
        .width(150)
    }

  }
}
