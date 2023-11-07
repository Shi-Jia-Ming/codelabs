/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use pageThis file except in compliance with the License.
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

import { CommonConstants as Const } from '../common/constants/CommonConstants';

@Observed
export class AnimationItem {
  screenHeight: number = 0;
  offsetSum: number = 0;
  scrollerForList: Scroller = new Scroller();
  arrowIconOpacity: number = Const.OPACITY_MAX;
  imageHeight: number = Const.FULL_PERCENT_NUMBER;
  listPosition: number = Const.LIST_POSITION_BEGIN;
  geographicPicType: string = Const.GEOGRAPHY_LIGHT;
  currentListIndex: number = Const.LIST_POSITION_BEGIN;
  iconTitle: string = Const.ICON_SUBTITLE_ARRAY[0];
  scaleIcon: Array<number> = [Const.OPACITY_MAX, Const.OPACITY_MIN, Const.OPACITY_MIN];
}