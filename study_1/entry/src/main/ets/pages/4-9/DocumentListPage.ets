/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/9 10:34
 */
import common from '@ohos.app.ability.common'
import Want from '@ohos.app.ability.Want'
import { Head } from '../Header'
@Entry
@Component
struct DocumentListPage {
  @State docs:number[] = []
  index:number = 1//作为页面文档标记展示的序号,也可以作为文档编辑Ability的key值
  private context = getContext(this) as common.UIAbilityContext
  build() {
    Row() {
      Column({space:10}){
        Head({title:'文档列表'})
        Button('新建文档')
          .onClick(()=>{
            //添加文档
            this.docs.push(this.index++)
            //跳转到文档编辑的UIAbility
            let want:Want={
              deviceId: '',
              bundleName: 'com.example.testapplication',
              moduleName: 'entry',
              abilityName: 'DocumentAbility',
              parameters:{
                instanceKey: 'abc---' + this.index
              }
            }
            this.context.startAbility(want)
          })
        ForEach(this.docs,(id,index)=>{
          Row({space:10}){
            Image($r('app.media.ic_files_doc'))
              .width(20)
            Text(`文档${id}`)
              .onClick(()=>{
                let want:Want={
                  deviceId: '',
                  bundleName: 'com.example.testapplication',
                  moduleName: 'entry',
                  abilityName: 'DocumentAbility',
                  parameters:{
                    instanceKey: 'abc---' + id
                  }
                }
                this.context.startAbility(want)
              })
          }
          .width('80%')
        },(item,index)=>index+'')
      }
    }
  }
}