
import common from '@ohos.app.ability.common'
import Want from '@ohos.app.ability.Want'
import { Head } from '../Header'
@Entry
@Component
struct StageModuleList {
  private index:number = 1
  @State docs:number[] = []

  private  context = getContext(this) as common.UIAbilityContext
  build() {
    Row() {
      Column(){
        Head({title:'文档列表'})
        Divider()
        Button('新建文档')
          .onClick(()=>{
            this.docs.push(this.index++)
            let want:Want={
              deviceId:'',
              bundleName: 'com.example.testapplication',
              moduleName: 'entry',
              abilityName: 'StageModulePage',
              parameters: {
                instanceKey: 'idId'+this.index,
              }

            }
            this.context.startAbility(want)
          })
        ForEach(this.docs,id =>{
          Row({space:10}){
            Text(`文档${id}`)
              .fontSize(18)
              .onClick(()=>{
                let want:Want= {
                  deviceId: '',
                  bundleName: 'com.example.testapplication',
                  moduleName: 'entry',
                  abilityName: 'StageModulePage',
                  parameters: {
                    instanceKey: 'idId' + id,
                  }
                }
                  this.context.startAbility(want)
                
              })
          }
        })

      }
    }
  }
}
