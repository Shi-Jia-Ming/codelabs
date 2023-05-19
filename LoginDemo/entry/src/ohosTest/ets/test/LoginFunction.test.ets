import { describe, expect, it } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import inputMethod from '@ohos.inputMethod';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { loginCheck } from '../testability/pages/Index';
import Logger from '../../../main/ets/common/utils/Logger';

const delegator = abilityDelegatorRegistry.getAbilityDelegator();
const waitUiReadyMs = 1000;

export default function LoginFunctionTest() {

  describe('loginFunctionTest', function () {
    it('emptyPasswordTest', 0, function () {
      expect(loginCheck("123", "")).assertEqual(true);
    })

    it('emptyAccountTest', 0, function () {
      expect(loginCheck("", "123456")).assertEqual(false);
    })

    it('notEmptyTest', 0, function () {
      expect(loginCheck("123", "123456")).assertEqual(false);
    })
  });

  describe('verifyLoginTest', function () {
    it('loginTest', 0, async function () {
      await startAbility('com.huawei.logindemo', 'EntryAbility');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let input = await driver.findComponents(ON.type('TextInput'));
      await input[0].inputText('123');
      await driver.delayMs(waitUiReadyMs);
      await input[1].inputText('123456');
      await driver.delayMs(waitUiReadyMs);
      inputMethod.getController().stopInput();
      let btn = await driver.findComponent(ON.id('loginButtonId'));
      await btn.click();
      await driver.delayMs(waitUiReadyMs);
    });
  });
}

async function startAbility(bundleName: string, abilityName: string) {
  await delegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`).then(result => {
    Logger.info(`UiTestCase, start abilityFinished: ${JSON.stringify(result)}`);
  }).catch(err => {
    Logger.error(`UiTestCase, start abilityFailed: ${JSON.stringify(err)}`);
  })
}
