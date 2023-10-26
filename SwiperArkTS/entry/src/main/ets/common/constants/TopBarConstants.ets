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

import { TopBarItem } from '../../viewmodel/TopBarItem';

/**
 * Data of top bar.
 */
export const TOP_BAR_DATA: TopBarItem[] = [
  new TopBarItem(0, '全部'),
  new TopBarItem(1, '电影'),
  new TopBarItem(2, '电视剧'),
  new TopBarItem(3, '综艺'),
  new TopBarItem(4, '直播'),
  new TopBarItem(5, '游戏')
]