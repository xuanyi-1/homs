import { Log } from '@abner/log';
import { DialogHelper } from '@pura/harmony-dialog'
import { IBestInit } from "@ibestservices/ibest-ui"
import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';


export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');

    DialogHelper.setDefaultConfig((config) => {
      config.uiAbilityContext = this.context;
    })

  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    PersistentStorage.persistProp('token', '');

    Log.init({
      tag: 'HarmonyOSLog', // 打印的标签
      domain: 0x0000, // 业务领域
      close: false, // 是否关闭打印
      isHilog: true, // 打印类型
      showLogLocation: true, // 是否展示点击的位置
      logSize: 800 // 日志每次输出大小
    })

    windowStage.loadContent('pages/Index', (err, data) => {
      // 在此处初始化组件库!!!
      // 在此处初始化组件库!!!
      // 在此处初始化组件库!!!
      IBestInit(windowStage, this.context)
    })

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
