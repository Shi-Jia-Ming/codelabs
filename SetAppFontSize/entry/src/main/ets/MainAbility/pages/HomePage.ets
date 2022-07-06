/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

// @ts-nocheck
import dataStorage from '@ohos.data.storage';
import featureAbility from '@ohos.ability.featureAbility';
import Logger from '../utils/Logger'

const TAG = '[HomePage]'

@Entry
@Component
struct Home {
  private firstArr: string[] = ["账户与安全", "支付设置", "发票管理", "通用"]
  private secondArr: string[] = ["新消息通知", "应用权限说明", "隐私政策", "功能反馈", "检查与更新", "意见反馈", "关于"]
  @State changeTextSize: string = ''

  onPageShow() {
    this.getFontSize()
  }

  async getFontSize() {
    var context = featureAbility.getContext()
    var path = await context.getFilesDir()
    let storage = dataStorage.getStorageSync(path + '/mystery')
    storage.get("changeTextSize", " ")
      .then((value) => {
        this.changeTextSize = JSON.parse(value.toString());
        Logger.info(TAG,"Get the value of changeTextSize: " + this.changeTextSize)
      }).catch((err) => {
      Logger.info(TAG,"Get the value of changeTextSize failed with err: " + err)
      this.getFontSize()
  })
}
  build() {
    Column() {
      Flex({ justifyContent: FlexAlign.Center, direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
        Text('设置')
          .fontSize(18* this.changeTextSize + 'fp')
      }
      .height(60 + 'vp')

      ColumnSplit() {
        Row() {
          Image($r("app.media.head")).width(60 + 'vp').height(60 + 'vp').borderRadius(60).margin({ left: 10 })
          Column() {
            Text('ABC123456').width('100%').height(40 + 'vp').fontSize(12  * this.changeTextSize + 'fp').margin({ left: 10 })
            Text('用户名: ABC123456').width('100%').height(40 + 'vp').fontSize(12  * this.changeTextSize + 'fp').margin({ left: 10})
          }
        }.margin({ bottom: 12 }).height('70%')
        Text('地址管理').width('100%').height(30 + 'vp').fontSize(12  * this.changeTextSize + 'fp').margin({ left: 10, top: 5})
      }.width('90%').height(180 + 'vp').borderRadius(10).backgroundColor(0xFFFFFF)

      ColumnSplit() {
        // 跳转到字体大小调节页面
        Navigator({ target: 'pages/SetFontSizePage' }) {
          Text('设置字体大小').width('100%').height(30 + 'vp').fontSize(12 * this.changeTextSize + 'fp').margin({ left: 10 })
        }
        ForEach(this.firstArr, (item) => {
          Text(item).width('100%').height(30 + 'vp').fontSize(12  * this.changeTextSize + 'fp').margin({ left: 10 })
        })
      }.width('90%').height(154 + 'vp').margin({top: 10 }).borderRadius(10).backgroundColor(0xFFFFFF)

      ColumnSplit() {
        ForEach(this.secondArr, (item) => {
          Text(item).width('100%').height(30 + 'vp').fontSize(12  * this.changeTextSize + 'fp').margin({ left: 10 })
        })
      }.width('90%').height(216 + 'vp').margin({top: 10 }).borderRadius(10).backgroundColor(0xFFFFFF)

    }.width('100%').height('100%').backgroundColor(0xDCDCDC).padding({ top: 5 })
  }
}