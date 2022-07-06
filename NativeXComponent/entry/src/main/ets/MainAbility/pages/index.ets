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
import nativerender from "libnativerender.so";
import { ContextType } from "../common/Constants"

const nativePageLifecycle = nativerender.getContext(ContextType.JSPAGE_LIFECYCLE);

@Entry
@Component
struct Index {
  private context = null;
  private aboutToAppear(): void  {
    console.log('[LIFECYCLE-Index] aboutToAppear');
    nativePageLifecycle.aboutToAppear();
  }
  private aboutToDisappear(): void {
    console.log('[LIFECYCLE-Index] aboutToDisappear');
    nativePageLifecycle.aboutToDisappear();
  }

  private onPageShow(): void  {
    console.log('[LIFECYCLE-Page] onPageShow');
    nativePageLifecycle.onPageShow();
  }

  private onPageHide(): void  {
    console.log('[LIFECYCLE-Page] onPageHide');
    nativePageLifecycle.onPageHide();
  }
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('XComponent示例')
        .fontSize(36)
        .margin({bottom: 10})
      Button('绘制矩形')
        .margin({ bottom: 10 })
        .onClick(() => {
          if (this.context) {
            this.context.drawTriangle();
          }
        })
      Column() {
        XComponent({ id: 'xcomponentId', type: 'texture', libraryname: 'nativerender'})
          .onLoad((context) => {
            this.context = context;
          })
          .onDestroy(() => {
          })
      }
      .width('80%')
      .aspectRatio(1)

    }
    .width('100%')
    .height('100%')
  }
}



