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
import router from '@system.router';
import dataStorage from '@ohos.data.storage';
import featureAbility from '@ohos.ability.featureAbility';
import {saveChangeSize} from '../utils/DataUtils';
import Logger from '../utils/Logger'

const TAG = '[SetFontSizePage]'

@Entry
@Component
struct SetFont {
  @State changeTextSize: string = ''
  @State inSetValue: number = ''
  @State text: string = ''
  scroller: Scroller = new Scroller()
  onPageShow() {
    this.getFontSize()
  }
  async getFontSize() {
    var context = featureAbility.getContext()
    var path = await context.getFilesDir()
    let storage = dataStorage.getStorageSync(path + '/mystery')
    storage.get("changeTextSize", " ")
      .then((value) => {
        var size = value.toString()
        this.changeTextSize = JSON.parse(size)
        this.inSetValue = this.changeTextSize * 10
        this.getText(this.inSetValue)
        Logger.info(TAG,"Get the value of changeTextSize: " + this.changeTextSize)
      }).catch((err) => {
      Logger.info(TAG,"Get the value of changeTextSize failed with err: " + err)
    })
  }
  build() {
    Flex({ justifyContent: FlexAlign.Start, direction: FlexDirection.Column }) {
      Flex({ justifyContent: FlexAlign.Start, direction: FlexDirection.Row, alignItems: ItemAlign.Start }) {
        Image($r("app.media.ic_public_back"))
          .width(45)
          .height(30)
          .margin({ left: 16, top:10 })
          .objectFit(ImageFit.Contain)
          .onClick(() => {
            // 返回主页面
            router.back()
          })
        Text('字体大小设置')
          .fontSize(14 * this.changeTextSize + 'fp').height(30).margin({ left: 60, top:10 })
      }
      .height('6%')

      Row() {
        Text('收件人:')
          .fontSize(12 * this.changeTextSize + 'fp')
          .fontColor(Color.Gray)
          .margin({ left: 26 })
        Text('user@xxxxx.com')
          .fontSize(12 * this.changeTextSize + 'fp')
          .fontColor(Color.Blue)
          .margin({ left: 16 })
      }
      .height('5%')
      .width('100%')
      .margin({ top:10 })
      Row() {
        Text('主题:')
          .fontSize(12 * this.changeTextSize + 'fp')
          .fontColor(Color.Black)
          .margin({ left: 26 })
        Text('水果之王')
          .fontSize(12 * this.changeTextSize + 'fp')
          .fontColor(Color.Black)
          .margin({ left: 16 })
      }
      .height('5%')
      .width('100%')

      Row() {
        Text(new Date().toLocaleTimeString())
          .fontSize(12 * this.changeTextSize + 'fp')
          .fontColor(Color.Gray)
          .margin({ left: 26 })
      }
      .height('5%')
      .width('100%')

        Column() {
          Image($r("app.media.img")).width(100 * this.changeTextSize).height(100 * this.changeTextSize)
            .margin({ left: 26, right: 20, top:10 })
          Text("圣女果又名樱桃小番茄，香港称车厘茄，一种小型番茄，因此又被称为小番茄。生吃味道可口，也可风干做成蜜饯。")
            .fontSize(12 * this.changeTextSize + 'fp')
            .margin({left: 26, top: 20, bottom: 20 })

          Text("优惠价格:xxx")
            .fontSize(12 * this.changeTextSize + 'fp')
            .fontColor(Color.Red)
            .margin({left: 26 })

        }.alignItems(HorizontalAlign.Start).width('100%').height('60%')

      Row() {
        Column() {
          Row() {
            Text('字体大小').fontSize(14 * this.changeTextSize + 'fp').margin({ left:8 })
            Text(this.text).fontSize(14 * this.changeTextSize + 'fp').margin({ left:60 })
          }.width('80%')
          Slider({
            value: this.inSetValue,
            min: 8,
            max: 20,
            step: 4,
            style: SliderStyle.InSet
          })
            .width('80%')
            .margin({ top:20 })
            .blockColor(0xCCCCCC)
            .trackColor(Color.Gray)
            .selectedColor(Color.Blue)
            .showSteps(true)
            .showTips(false)
            .onChange((value: number, mode: SliderChangeMode) => {
              this.inSetValue = value
              this.getText(this.inSetValue)
              this.changeTextSize = value * 0.1
              saveChangeSize(this.changeTextSize)
              Logger.info(TAG,'value:' + value + 'mode:' + mode.toString())
            })
        }.width('100%').alignItems(HorizontalAlign.Center)
      }.height('20%')
    }
    .width('100%')
    .height('100%')
  }

  getText(inSetValue) {
    switch(inSetValue)
    {
      case 8:
        this.text = '小'
        break;
      case 12:
        this.text = '标准'
        break;
      case 16:
        this.text = '大'
        break;
      case 20:
        this.text = '超大'
        break;
      default:
        this.text = '标准'
    }
  }
}