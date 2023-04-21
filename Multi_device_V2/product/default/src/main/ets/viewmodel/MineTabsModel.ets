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

import { MineTabsItem } from '@ohos/common';

export const MineTabsList: Array<MineTabsItem> = [
  {
    icon: $r('app.media.ic_history'),
    title: $r('app.string.mine_history'),
    more: $r('app.media.ic_more')
  },
  {
    icon: $r('app.media.ic_collection'),
    title: $r('app.string.mine_collection'),
    more: $r('app.media.ic_more')
  },
  {
    icon: $r('app.media.ic_settings'),
    title: $r('app.string.mine_settings'),
    more: $r('app.media.ic_more')
  },
  {
    icon: $r('app.media.ic_help'),
    title: $r('app.string.mine_help'),
    more: $r('app.media.ic_more')
  },
  {
    icon: $r('app.media.ic_about'),
    title: $r('app.string.mine_about'),
    more: $r('app.media.ic_more')
  }
]