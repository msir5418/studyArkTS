import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';

import common from '@ohos.app.ability.common';
import preferenceUtil from '../uitil/PreferencesUtil';
import taskModel from '../model/TaskModel';
import imageModel from '../model/ImageModel';

export default class EntryAbility extends UIAbility {
  url:string = "pages/Index"
  async onCreate(want, launchParam) {
    if (want.parameters.toUrl) {
      this.url = want.parameters.toUrl
    }
    hilog.info(0x0000, 'motherFucker', '%{public}s', 'Ability onCreate');
    await preferenceUtil.loadPreference(this.context,'myPreference')
    taskModel.initTaskDB(this.context)
    imageModel.initImageDB(this.context)
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    windowStage.loadContent(this.url, (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
