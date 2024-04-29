/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/25 18:40
 */
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
@Entry
@Component
struct ImplicitWant {
  async implicitStartAbility() {
    try {
      let want:Want = {
        // uncomment line below if wish to implicitly query only in the specific bundle.
        // bundleName: "com.example.myapplication",
        "action": "action.main.home",
        // entities can be omitted.
        "entities": [ "entity.system.home" ],
        "uri": "",
        "type": ""
      }
      let context = getContext(this) as common.UIAbilityContext;
      await context.startAbility(want)
      console.info(`explicit start ability succeed`)
    } catch (error) {
      console.info(`explicit start ability failed with ${error.code}`)
    }
  }
  build() {
    Column() {
      Text('implicitStartAbility')
        .fontWeight(800)
        .fontSize(30)
      Button('open the want')
        .onClick(()=>this.implicitStartAbility())
    }
  }
}