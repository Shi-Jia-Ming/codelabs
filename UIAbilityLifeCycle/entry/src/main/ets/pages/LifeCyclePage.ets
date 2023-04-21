/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import CommonConstants from '../common/CommonConstants';

@Entry
@Component
struct LifeCyclePage {
  @State textColor: Color = Color.Black;
  private tag: string = 'LifeCyclePage';

  aboutToAppear() {
    this.textColor = Color.Blue;
    hilog.info(CommonConstants.DOMAIN, this.tag, '%{public}s', 'LifeCyclePage aboutToAppear');
  }

  onPageShow() {
    this.textColor = Color.Brown;
    hilog.info(CommonConstants.DOMAIN, this.tag, '%{public}s', 'LifeCyclePage onPageShow');
  }

  onPageHide() {
    hilog.info(CommonConstants.DOMAIN, this.tag, '%{public}s', 'LifeCyclePage onPageHide');
  }

  onBackPress() {
    this.textColor = Color.Red;
    hilog.info(CommonConstants.DOMAIN, this.tag, '%{public}s', 'LifeCyclePage onBackPress');
    return false;
  }

  aboutToDisappear() {
    hilog.info(CommonConstants.DOMAIN, this.tag, '%{public}s', 'LifeCyclePage aboutToDisappear');
  }

  build() {
    Column() {
      Text($r('app.string.hello_message'))
        .fontSize(CommonConstants.DEFAULT_FONT_SIZE)
        .fontColor(this.textColor)
        .margin(CommonConstants.DEFAULT_MARGIN)
        .fontWeight(FontWeight.Bold)
    }
    .width(CommonConstants.FULL_WIDTH)
  }
}