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
import router from '@ohos.router'

@Component
export struct TitleBar {
  @Prop title: string

  build() {

    Stack({ alignContent: Alignment.Start }) {

      Row() {
        Text(this.title)
          .fontSize(AppFontSize.Title)
          .fontColor(AppColor.Title)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)
          .align(Alignment.Top)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .height('100%')
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .padding({ left: 50, right: '10%', })


      Column() {
        Image($r('app.media.ic_public_back'))
          .objectFit(ImageFit.Contain)
          .height('40%')
          .width(30)
      }
      .padding({ left: 10 })
      .width(50)
      .justifyContent(FlexAlign.Center)
      .height('100%')
      .onClick(() => {
        router.back()
      })
    }.width('100%')
    .height('10%')
  }
}