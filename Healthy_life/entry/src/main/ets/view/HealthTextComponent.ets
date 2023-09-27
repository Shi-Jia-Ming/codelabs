/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { CommonConstants as Const } from '../common/constants/CommonConstants'

@Component
export default struct HealthText {
  @Prop title: string = '';
  titleResource: Resource = $r('app.string.empty');
  fontSize: number | string | Resource = $r('app.float.default_16');
  fontWeight: number | FontWeight | string = Const.FONT_WEIGHT_500;
  fontColor: ResourceColor = $r('app.color.titleColor');
  fontFamily: string | Resource = $r('app.string.HarmonyHeiTi_Medium');

  build() {
    Text(this.title || this.titleResource)
      .fontSize(this.fontSize)
      .fontWeight(this.fontWeight)
      .fontColor(this.fontColor)
      .fontFamily(this.fontFamily)
  }
}