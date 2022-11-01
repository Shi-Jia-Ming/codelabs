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

import { BottomTabsItem } from '../common/bean/Item';

export const BottomTabsList: Array<BottomTabsItem> = [
  {
    icon: $r('app.media.Home'),
    icon_selected: $r('app.media.Home_selected'),
    text: $r('app.string.home')
  },
  {
    icon: $r('app.media.Find'),
    icon_selected: $r('app.media.Find_selected'),
    text: $r('app.string.find')
  },
  {
    icon: $r('app.media.Drive'),
    icon_selected: $r('app.media.Drive_selected'),
    text: $r('app.string.drive')
  },
  {
    icon: $r('app.media.Mine'),
    icon_selected: $r('app.media.Mine_selected'),
    text: $r('app.string.mine')
  }
]
