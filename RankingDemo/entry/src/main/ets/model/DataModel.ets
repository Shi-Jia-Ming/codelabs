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

import { RankData } from '../viewmodel/RankData';

/*
 * the Mock file instead of network data.
 */
export { rankData1, rankData2 }

const rankData1: RankData[] = [
  new RankData('1', $r('app.string.fruit_apple'), '12080'),
  new RankData('2', $r('app.string.fruit_grapes'), '10320'),
  new RankData('3', $r('app.string.fruit_watermelon'), '9801'),
  new RankData('4', $r('app.string.fruit_banana'), '8431'),
  new RankData('5', $r('app.string.fruit_pineapple'), '7546'),
  new RankData('6', $r('app.string.fruit_durian'), '7431'),
  new RankData('7', $r('app.string.fruit_red_grape'), '7187'),
  new RankData('8', $r('app.string.fruit_pears'), '7003'),
  new RankData('9', $r('app.string.fruit_carambola'), '6794'),
  new RankData('10', $r('app.string.fruit_guava'), '6721')
];

const rankData2: RankData[] = [
  new RankData('11', $r('app.string.fruit_watermelon'), '8836'),
  new RankData('12', $r('app.string.fruit_apple'), '8521'),
  new RankData('13', $r('app.string.fruit_banana'), '8431'),
  new RankData('14', $r('app.string.fruit_grapes'), '7909'),
  new RankData('15', $r('app.string.fruit_red_grape'), '7547'),
  new RankData('16', $r('app.string.fruit_pears'), '7433'),
  new RankData('17', $r('app.string.fruit_pineapple'), '7186'),
  new RankData('18', $r('app.string.fruit_durian'), '7023'),
  new RankData('19', $r('app.string.fruit_guava'), '6794'),
  new RankData('20', $r('app.string.fruit_carambola'), '6721')
];