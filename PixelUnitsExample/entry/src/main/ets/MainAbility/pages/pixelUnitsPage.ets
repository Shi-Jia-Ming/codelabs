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

import { AppFontSize } from '../../common/AppFontConfig'
import { AppColor } from '../../common/AppColorConfig'
import { TitleBar } from '../../../ets/common/ui/TitleBar'


@Entry
@Component
struct PixelUnitsPage {
  build() {
    List() {
      ListItem() {
        //导航栏
        TitleBar({ title: "像素介绍" })
      }

      ListItem() {
        Column() {
          Column() {
            Text('px')
              .fontSize(AppFontSize.Subtitle)
              .fontColor(AppColor.ThemeColor2)
              .width("100%")
              .fontWeight(FontWeight.Bold)
          }
          .justifyContent(FlexAlign.Center)
          .margin({ bottom: 15 })

          Text('屏幕物理像素单位。')
            .width('100%')
            .fontColor(AppColor.Title)
            .fontSize(AppFontSize.Text1)
            .textAlign(TextAlign.Start)
            .borderRadius(10)
            .margin({ bottom: 15 })

          Column() {
            Text("200px")
              .width(200 + 'px')
              .height(25)
              .backgroundColor(AppColor.ThemeColor2)
              .fontSize(AppFontSize.Text2)
              .textAlign(TextAlign.Start)
              .fontColor(Color.White)
              .borderRadius(4)
              .padding({ left: 5 })
          }
          .align(Alignment.Start)
          .width('100%')
          .alignItems(HorizontalAlign.Start)

        }.align(Alignment.Start)

      }
      .editable(true)
      .padding({ top: 15, bottom: 15, left: 20, right: 20 })
      .backgroundColor(AppColor.Background1)
      .borderRadius(10)
      .margin({ left: 15, right: 15, bottom: 20 })

      ListItem() {
        Column() {
          Column() {
            Text('vp')
              .fontSize(AppFontSize.Subtitle)
              .fontColor(AppColor.ThemeColor2)
              .align(Alignment.Start)
              .width("100%")
              .fontWeight(FontWeight.Bold)
          }
          .justifyContent(FlexAlign.Center)

          Text('屏幕密度相关像素，根据屏幕像素密度转换为屏幕物理像素。')
            .width('100%')
            .lineHeight(35)
            .fontColor(AppColor.Title)
            .fontSize(AppFontSize.Text1)
            .textAlign(TextAlign.Start)
            .borderRadius(10)

          Text('像素密度为160dpi的设备上1vp=1px,1vp对应的物理屏幕像素=（屏幕像素密度/160）px')
            .width('100%')
            .lineHeight(35)
            .fontSize(AppFontSize.Text2)
            .textAlign(TextAlign.Start)
            .borderRadius(10)
            .fontColor("#5f5f5f")

          Column() {
            Text("200vp")
              .width(200 + 'vp')
              .height(25)
              .backgroundColor(AppColor.ThemeColor2)
              .fontSize(AppFontSize.Text2)
              .textAlign(TextAlign.Start)
              .fontColor(Color.White)
              .borderRadius(4)
              .padding({ left: 5 })
          }
          .align(Alignment.Start)
          .width('100%')
          .alignItems(HorizontalAlign.Start)
          .margin({ top: 20 })

        }.align(Alignment.Start)

      }
      .editable(true)
      .padding({ top: 15, bottom: 15, left: 20, right: 20 })
      .backgroundColor(AppColor.Background1)
      .borderRadius(10)
      .margin({ left: 15, right: 15, bottom: 20 })

      ListItem() {
        Column() {

          Column() {
            Text('fp')
              .fontSize(AppFontSize.Subtitle)
              .fontColor(AppColor.ThemeColor2)
              .align(Alignment.Start)
              .width("100%")
              .fontWeight(FontWeight.Bold)
          }.padding({ top: 5 })
          .justifyContent(FlexAlign.Center)

          Text('字体像素，与vp类似，随系统字体大小设置变化。')
            .width('100%')
            .lineHeight(35)
            .fontSize(AppFontSize.Text1)
            .textAlign(TextAlign.Start)
            .fontColor(AppColor.Title)
            .borderRadius(10)
          Text('默认情况下与vp相同，即1vp=1fp,如果用户手动调整了系统字体，scale为缩放比例，设置后的字体大小（单位fp） = 设置前的字体大小 * scale')
            .width('100%')
            .lineHeight(35)
            .fontSize(AppFontSize.Text2)
            .textAlign(TextAlign.Start)
            .borderRadius(10)
            .fontColor("#5f5f5f")
          Column() {
            Text("这是一段为14fp的文字")
              .height(25)
              .backgroundColor(AppColor.ThemeColor2)
              .fontSize(14 + 'fp')
              .textAlign(TextAlign.Start)
              .fontColor(Color.White)
              .borderRadius(4)
              .padding({ left: 5 })
              .borderRadius(4)
              .padding({ left: 5, right: 10 })
          }
          .align(Alignment.Start)
          .width('100%')
          .alignItems(HorizontalAlign.Start)
          .margin({ top: 20 })

          Column() {
            Text("这是一段为24fp的文字")
              .fontSize(24 + 'fp')
              .backgroundColor(AppColor.ThemeColor2)
              .textAlign(TextAlign.Start)
              .fontColor(Color.White)
              .borderRadius(4)
              .padding({ left: 5, right: 10, top: 5, bottom: 5 })
          }
          .align(Alignment.Start)
          .width('100%')
          .alignItems(HorizontalAlign.Start)
          .margin({ top: 20 })

        }.align(Alignment.Start)

      }
      .editable(true)
      .padding({ top: 15, bottom: 15, left: 20, right: 20 })
      .backgroundColor(AppColor.Background1)
      .borderRadius(10)
      .margin({ left: 15, right: 15, bottom: 20 })

      ListItem() {
        Column() {

          Column() {
            Text('lpx')
              .fontSize(AppFontSize.Subtitle)
              .fontColor(AppColor.ThemeColor2)
              .align(Alignment.Start)
              .width("100%")
              .fontWeight(FontWeight.Bold)
          }
          .justifyContent(FlexAlign.Center)

          Text('视窗逻辑像素单位，lpx单位为实际屏幕宽度与逻辑宽度（通过designWidth配置）的比值。')
            .width('100%')
            .lineHeight(35)
            .fontSize(AppFontSize.Text1)
            .textAlign(TextAlign.Start)
            .fontColor(AppColor.Title)
            .borderRadius(10)
            .margin({ bottom: 15 })

          Column() {
            Text("200lpx")
              .width(200 + 'lpx')
              .height(25)
              .backgroundColor(AppColor.ThemeColor2)
              .fontSize(AppFontSize.Text2)
              .textAlign(TextAlign.Start)
              .fontColor(Color.White)
              .borderRadius(4)
              .padding({ left: 5 })
          }
          .align(Alignment.Start)
          .width('100%')
          .alignItems(HorizontalAlign.Start)
        }.align(Alignment.Start)

      }
      .editable(true)
      .padding({ top: 15, bottom: 15, left: 20, right: 20 })
      .backgroundColor(AppColor.Background1)
      .borderRadius(10)
      .margin({ left: 15, right: 15, })
    }
    .height('100%')
    .backgroundColor(AppColor.Background)
  }
}