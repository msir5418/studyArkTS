import picker from '@ohos.file.picker'
import imageModel from '../../model/ImageModel';
@Entry
@Component
struct StoreImagePage {
  @State src: string = undefined
  async aboutToAppear(){
    await imageModel.getImage()
      .then(img=>{
        console.log('motherfucker', '初始化图片: ',img)
        this.src = img
      })
  }
  async selectImage(){
    let options = new picker.PhotoSelectOptions()
    options.MIMEType = picker.PhotoViewMIMETypes.IMAGE_TYPE;
    options.maxSelectNumber = 1
    let pick = new picker.PhotoViewPicker()
    await pick.select(options).then(photoResult=>{
      console.info('PhotoSelectResult photoResult: ' + JSON.stringify(photoResult));
      let uri = photoResult.photoUris[0]
      console.info('PhotoSelectResult uri: '+uri)
      imageModel.addImage(uri)
        .then(id=>{
          console.log('motherfucker', '图片添加到数据库: ',id)
        })
      this.src = uri
    })
  }
  build() {
      Column() {
        Button('打开图库')
          .onClick(()=>{
            this.selectImage()
          })
        Image(this.src)
      }
      .width('100%')
      .height('100%')

  }
}