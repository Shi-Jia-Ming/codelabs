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

import { ratio2percent } from '../common/utils/Utils'
import { CommonConstants as Const } from '../common/constants/CommonConstants';

@Component
export struct BadgeCard {
  @Prop content: string = '';
  imgSrc: Resource = $r('app.string.empty');

  build() {
    Column({space: Const.DEFAULT_18}) {
      Image(this.imgSrc)
        .width(Const.FULL_WIDTH)
        .height(Const.ACHIEVE_CARD_IMG_HEIGHT)
        .objectFit(ImageFit.Contain)
      Text($r('app.string.task_achievement_level', Number(this.content)))
        .lineHeight($r('app.float.default_16'))
        .fontSize($r('app.float.default_12'))
        .fontColor($r('app.color.white'))
    }
    .width(ratio2percent(Const.ACHIEVE_SPLIT_RATIO))
    .padding({top: Const.ACHIEVE_CARD_TOP, bottom: Const.ACHIEVE_CARD_BOTTOM})
  }
}
