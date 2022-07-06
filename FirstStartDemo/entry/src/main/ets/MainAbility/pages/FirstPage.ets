/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import app from '@system.app'
import dataStorage from '@ohos.data.storage';
import featureAbility from '@ohos.ability.featureAbility'

@Entry
@Component
struct FirstPage {
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample(
      {
        //由于回调函数中无法调用this，通过bind的方式将this传入回调中
        cancel: this.onCancel.bind(this),
        confirm: this.onConfirm.bind(this)
      }),
    cancel: this.existApp,
    autoCancel: false
  })
  private isPrivacy: boolean
  private timerId: number

  onCancel() {
    // 不同意隐私协议，退出应用
    this.existApp()
  }

  onConfirm() {
    this.saveIsPrivacy()
    this.timerId = setTimeout(function () {
      router.replace({ url: 'pages/SecondPage' })
    }, 2000);

  }

  onPageHide() {
    clearTimeout(this.timerId)
  }

  existApp() {
    // 退出应用
    app.terminate();
  }

  aboutToAppear() {
    this.getIsPrivacy().then((value) => {
      let firstCome = value
      this.isPrivacy = value
      if (firstCome) {
        this.dialogController.open()
      }

      if (!firstCome) {
        setTimeout(function () {
          router.replace({ url: 'pages/SecondPage' })
        }, 2000);
      }
    })
  }

  async saveIsPrivacy() {
    var context = featureAbility.getContext()
    var path = await context.getFilesDir()
    let storage = dataStorage.getStorageSync(path + '/myStore')
    storage.putSync("isPrivacy", "false")
    storage.flushSync()
  }

  async getIsPrivacy() {
    var context = featureAbility.getContext()
    var path = await context.getFilesDir()
    let storage = dataStorage.getStorageSync(path + '/myStore')
    let result = storage.getSync("isPrivacy", "true");
    this.isPrivacy = result === 'true' ? true : false
    return result === 'true' ? true : false;
  }

  build() {
    Row() {
      Column() {
        Image($r("app.media.picture4"))
      }
      .width('100%')
    }
    .height('100%')
  }
}


@CustomDialog
struct CustomDialogExample {
  controller: CustomDialogController
  cancel: () => void
  confirm: () => void
  @State data: string = "<h1 style='text-align: center;'>h1标题</h1>" +
  "<h1 style='text-align: center;'><i>h1斜体</i></h1>" +
  "<h1 style='text-align: center;'><u>h1下划线</u></h1>" +
  "<h2 style='text-align: center;'>h2标题</h2>" +
  "<h3 style='text-align: center;'>h3标题</h3>" +
  "<p style='text-align: center;'>p常规</p><hr/>" +
  "<div style='width: 500px;height: 500px;border: 1px solid;margin: 0auto;'>" +
  "<p style='font-size: 35px;text-align: center;font-weight: bold; color: rgb(24,78,228)'>字体大小35px,行高45px</p>" +
  "<p style='background-color: #e5e5e5;line-height: 45px;font-size: 35px;text-indent: 2em;'>" +
  "<p>这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字</p>"

  build() {
    Column() {
      Text('欢迎使用我的应用').width('80%').fontSize(20).textAlign(TextAlign.Center).margin({ top: 20, bottom: 20 })
      Text('隐私协议弹框隐私协议弹框隐私协议弹框隐私协议弹框隐私协议弹框隐私协议弹框隐私协议弹框').width('80%').fontSize(16)

      Text('隐私协议弹框').width('80%').fontSize(16).fontColor(Color.Blue).onClick(() => {
        router.push({ url: 'pages/Privacy' })
      })


      Text('（以下简称为“本声明”）以便您了解我们如何搜集、使用、披露、保护、存储及传输您的个人数据。请您仔细阅读本声明。如您有任何疑问，请告知我们。')
        .width('80%')
        .fontSize(16)
        .margin({ bottom: 10 })


      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('不同意')
          .onClick(() => {
            this.controller.close()
            this.cancel()
          }).backgroundColor(0x317aff).fontColor(Color.White)
        Button('同  意')
          .onClick(() => {
            this.controller.close()
            this.confirm()
          }).backgroundColor(0x317aff).fontColor(Color.White)
      }.margin({ bottom: 10 })
    }
  }
}