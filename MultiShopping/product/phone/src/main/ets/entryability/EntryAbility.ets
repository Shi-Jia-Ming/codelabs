import hilog from '@ohos.hilog';
import UIAbility from '@ohos.app.ability.UIAbility';
import Window from '@ohos.window';
import deviceInfo from '@ohos.deviceInfo';

export default class EntryAbility extends UIAbility {

    onCreate(want, launchParam) {
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
        hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
        hilog.info(0x0000, 'testTag', '%{public}s', 'launchParam:' + JSON.stringify(launchParam) ?? '');
        if (deviceInfo.deviceType !== 'tablet') {
            Window.getLastWindow(this.context, (err, data) => {
                if (err.code) {
                    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.ERROR);
                    hilog.error(0x0000, 'testTag', 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
                    return;
                }
                let orientation = Window.Orientation.PORTRAIT;
                data.setPreferredOrientation(orientation, (err) => {
                    if (err.code) {
                        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.ERROR);
                        hilog.error(0x0000, 'testTag', 'Failed to set window orientation. Cause: ' + JSON.stringify(err));
                        return;
                    }
                    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
                    hilog.info(0x0000, 'testTag', 'Succeeded in setting window orientation.');
                });
            });
        }
    }

    onDestroy() {
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
    }

    onWindowStageCreate(windowStage: Window.WindowStage) {
        // Main window is created, set main page for this ability
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

        windowStage.loadContent('pages/SplashPage', (err, data) => {
            if (err.code) {
                hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.ERROR);
                hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
                return;
            }
            hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
            hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
        });
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
    }

    onForeground() {
        // Ability has brought to foreground
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
    }

    onBackground() {
        // Ability has back to background
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
    }
}
