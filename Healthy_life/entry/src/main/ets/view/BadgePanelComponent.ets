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

import { BadgeCard } from './BadgeCardComponent'
import { getAchievementLevel} from '../model/AchieveModel'
import { getBadgeCardItems } from '../viewmodel/AchievementViewModel'
import Logger from '../common/utils/Logger'
import { ACHIEVEMENT_LEVEL_KEY } from '../model/AchieveModel'
import { CommonConstants as Const } from '../common/constants/CommonConstants';
import CardInfo from '../viewmodel/CardInfo'

@Component
export struct BadgePanel {
  @StorageProp(ACHIEVEMENT_LEVEL_KEY) successiveDays: number = 0;

  aboutToAppear() {
    Logger.debug('BadgePanel','aboutToAppear');
    getAchievementLevel();
  }

  build() {
    Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap }) {
      ForEach(getBadgeCardItems(this.successiveDays), (item: CardInfo) => {
        BadgeCard({ content: item.titleContent, imgSrc: item.achievement})
      })
    }
    .width(Const.FULL_WIDTH)
  }
}
