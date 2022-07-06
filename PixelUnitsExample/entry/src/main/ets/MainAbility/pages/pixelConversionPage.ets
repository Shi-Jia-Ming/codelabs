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
import { TitleBar } from '../../common/ui/TitleBar'


@Entry
@Component
struct PixelConversionPage {
  private vp_px_width: number = 60
  private fp_px_width: number = 80
  private lpx_px_width: number = 120

  build() {
    List() {
      ListItem() {
        //导航栏
        TitleBar({ title: '像素转换' })
      }

      ListItem() {
        Column() {
          //vp转换为px
          Text('vp > px:')
            .fontSize(AppFontSize.Subtitle)
            .fontColor(AppColor.ThemeColor2)
            .align(Alignment.Start)
            .width("100%")
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 15, left: 10 })
          Column() {
            Text('vp2px(' + this.vp_px_width + ')')
              .fontColor(AppColor.ThemeColor2)
              .fontSize(AppFontSize.Text1)
              .textAlign(TextAlign.Center)

          }.margin({ left: 10, bottom: 20 })


          Column() {
            Text()
              .width(vp2px(this.vp_px_width))
              .height(25)
              .backgroundColor(AppColor.ThemeColor2)
              .fontSize(AppFontSize.Text1)
              .textAlign(TextAlign.Start)
              .fontColor(Color.White)
          }.margin({ left: 10, right: 10, bottom: 20 })

          //px转换为vp
          Text('px > vp:')
            .fontSize(AppFontSize.Subtitle)
            .fontColor(AppColor.ThemeColor2)
            .align(Alignment.Start)
            .width("100%")
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 15, left: 10 })
          Column() {
            Text('px2vp(' + this.vp_px_width + ')')
              .fontColor(AppColor.ThemeColor2)
              .fontSize(AppFontSize.Text1)
              .textAlign(TextAlign.Center)
          }.margin({ left: 10, right: 10, bottom: 20 })

          Column() {
            Text()
              .width(px2vp(this.vp_px_width))
              .height(25)
              .backgroundColor(AppColor.ThemeColor2)
              .fontSize(AppFontSize.Text2)
              .textAlign(TextAlign.Start)
              .fontColor(Color.White)
          }.margin({ left: 10, right: 10, bottom: 10 })
        }.alignItems(HorizontalAlign.Start)

      }.padding({ top: 20, bottom: 20, left: 10 })
      .margin({ left: 15, right: 15 })
      .backgroundColor(AppColor.Background1)
      .borderRadius(10)

      ListItem() {
        //fp转换为px
        Column() {
          Text('fp > px:')
            .fontSize(AppFontSize.Subtitle)
            .fontColor(AppColor.ThemeColor2)
            .align(Alignment.Start)
            .width("100%")
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 15, left: 10 })
          Column() {
            Text('fp2px(' + this.fp_px_width + ')')
              .fontColor(AppColor.ThemeColor2)
              .fontSize(AppFontSize.Text1)
              .textAlign(TextAlign.Center)

          }.margin({ bottom: 20, left: 10 })

          Column() {
            Text()
              .width(fp2px(this.fp_px_width))
              .height(25)
              .backgroundColor(AppColor.Warning)
              .fontSize(AppFontSize.Text1)
              .textAlign(TextAlign.Start)
              .fontColor(AppColor.ThemeColor2)
          }.margin({ left: 10, right: 10, bottom: 20 })
          //px转换为fp
          Text('px > fp:')
            .fontSize(AppFontSize.Subtitle)
            .fontColor(AppColor.ThemeColor2)
            .align(Alignment.Start)
            .width("100%")
            .margin({ bottom: 15, left: 10 })
            .fontWeight(FontWeight.Bold)
          Column() {
            Text('px2fp(' + this.fp_px_width + ')')
              .fontColor(AppColor.ThemeColor2)
              .fontSize(AppFontSize.Text1)
              .textAlign(TextAlign.Center)
          }.margin({ bottom: 20, left: 10 })

          Column() {
            Text()
              .width(px2fp(this.fp_px_width))
              .height(25)
              .backgroundColor(AppColor.Warning)
              .fontSize(AppFontSize.Text2)
              .textAlign(TextAlign.Start)

          }.margin({ left: 10, right: 10, bottom: 10 })
        }.alignItems(HorizontalAlign.Start)

      }.padding({ top: 20, bottom: 20, left: 10 })
      .margin({ left: 15, right: 15, top: 20 })
      .backgroundColor(AppColor.Background1)
      .borderRadius(10)

      ListItem() {
        Column() {
          //lpx转换为px
          Text('lpx > px:')
            .fontSize(AppFontSize.Subtitle)
            .fontColor(AppColor.ThemeColor2)
            .align(Alignment.Start)
            .width("100%")
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 15, left: 10 })
          Column() {
            Text('lpx2px(' + this.lpx_px_width + ')')
              .fontColor(AppColor.ThemeColor2)
              .fontSize(AppFontSize.Text1)
              .textAlign(TextAlign.Center)
          }
          .margin({ bottom: 20, left: 10, right: 10 })

          Column() {
            Text()
              .width(lpx2px(this.lpx_px_width))
              .height(25)
              .backgroundColor("#254ff7")
              .fontSize(AppFontSize.Text2)
              .textAlign(TextAlign.Start)

          }.margin({ bottom: 20, left: 10, right: 10 })
          //px转换为lpx
          Text('px > lpx:')
            .fontSize(AppFontSize.Subtitle)
            .fontColor(AppColor.ThemeColor2)
            .align(Alignment.Start)
            .width("100%")
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 15, left: 10, right: 10 })
          Column() {
            Text('px2lpx(' + this.lpx_px_width + ')')
              .fontColor(AppColor.ThemeColor2)
              .fontSize(AppFontSize.Text2)
          }.margin({ bottom: 20, left: 10, right: 10 })

          Column() {
            Text()
              .width(px2lpx(this.lpx_px_width))
              .height(25)
              .backgroundColor("#254ff7")
              .fontSize(AppFontSize.Text2)
              .textAlign(TextAlign.Start)

          }.margin({ bottom: 20, left: 10, right: 10 })

          Text('lpx与px之间的转换，需要根据实际情况设置designWidth')
            .width("100%")
            .fontSize(AppFontSize.Text2)
            .textAlign(TextAlign.Start)
            .fontColor(Color.Blue)
            .margin({ bottom: 5, left: 10 })
        }.alignItems(HorizontalAlign.Start)
      }.padding({ top: 20, bottom: 20, left: 10 })
      .margin({ left: 15, right: 15, top: 20 })
      .backgroundColor(AppColor.Background1)
      .borderRadius(10)
    }
    .backgroundColor(AppColor.Background)
    .borderRadius(10)
    .height('100%')

  }
}
