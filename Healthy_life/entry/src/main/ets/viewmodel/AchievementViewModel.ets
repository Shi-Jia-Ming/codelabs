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
import CardInfo from './CardInfo';

import { ACHIEVEMENT_LEVEL_LIST, AchievementMap } from '../model/TaskInitList';

export function getBadgeCardItems(successiveDays: number): Array<CardInfo> {
  let badgeMileStones = ACHIEVEMENT_LEVEL_LIST;
  let cardItems: Array<CardInfo> = [];
  for (let i = 0; i < badgeMileStones.length; i++) {
    let onOrOff = successiveDays >= badgeMileStones[i] ? 'on' : 'off';
    let titleContent = String(badgeMileStones[i]);
    let cardInfo: CardInfo = new CardInfo();
    cardInfo.titleContent = titleContent;
    cardInfo.achievement = getAchievement(`${ onOrOff }_${ badgeMileStones[i] }`);
    cardItems.push(cardInfo);
  }
  return cardItems;
}

function getAchievement(key: string) {
  let result = $r('app.string.empty');
  switch (key) {
    case 'off_3':
      result = AchievementMap.off_3;
      break;
    case 'on_3':
      result = AchievementMap.on_3;
      break;
    case 'off_7':
      result = AchievementMap.off_7;
      break;
    case 'on_7':
      result = AchievementMap.on_7;
      break;
    case 'off_30':
      result = AchievementMap.off_30;
      break;
    case 'on_30':
      result = AchievementMap.on_30;
      break;
    case 'off_50':
      result = AchievementMap.off_50;
      break;
    case 'on_50':
      result = AchievementMap.on_50;
      break;
    case 'off_73':
      result = AchievementMap.off_73;
      break;
    case 'on_73':
      result = AchievementMap.on_73;
      break;
    case 'off_99':
      result = AchievementMap.off_99;
      break;
    case 'on_99':
      result = AchievementMap.on_99;
      break;
    default:
      break;
  }
  return result;
}