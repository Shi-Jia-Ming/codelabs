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

import { RankData } from './RankData';
import { rankData1, rankData2 } from '../model/DataModel';

export class RankViewModel {
  // Load data from the rankData1 of the Mock file.
  loadRankDataSource1(): RankData[] {
    return rankData1;
  }

  // Load data from the rankData2 of the Mock file,but rankData2 is different from rankData1.
  loadRankDataSource2(): RankData[] {
    return rankData2;
  }
}

