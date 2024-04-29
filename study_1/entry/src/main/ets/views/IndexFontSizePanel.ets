/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/11 16:17
 */
import preferenceUtil from '../uitil/PreferencesUtil'
@Component
export default struct IndexFontSizePanel {
  @Consume fontSize: number
  fontSizeLabel:object={
    14: '小',
    16: '标准',
    18: '大',
    20: '特大'
  }
  build() {
    Column() {
      Text(this.fontSizeLabel[this.fontSize])
        .fontSize(30)
      Row({space:5}){
        Text('A')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
        Slider({
          min:14,
          max:20,
          value:this.fontSize,
          step:2
        })
          .showSteps(true)
          .trackThickness(6)
          .layoutWeight(1)
          .width('80%')
          .onChange((val)=>{
            this.fontSize = val
            preferenceUtil.putPreferenceValue('myPreference','IndexFontSize',val)
          })
        Text('A')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

      }
      .width('90%')

    }
    .width('100%')
    .backgroundColor('#F0F0F0')
    .borderRadius(20)
  }
}