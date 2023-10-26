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

import { TopBarItem } from './TopBarItem';
import { TOP_BAR_DATA } from '../common/constants/TopBarConstants';

/**
 * Init topBar data.
 */
export function initializeOnStartup(): Array<TopBarItem> {
  let tabDataArray: Array<TopBarItem> = []
  TOP_BAR_DATA.forEach((item: TopBarItem) => {
    tabDataArray.push(new TopBarItem(item.id, item.name));
  })
  return tabDataArray;
}