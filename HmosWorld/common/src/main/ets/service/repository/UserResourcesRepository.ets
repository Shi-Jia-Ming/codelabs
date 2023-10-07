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

import { Achieve } from '../../entity/Achieve';
import { LearningResource } from '../../entity/LearningResource';
import { FuncNetwork } from '../datasource/network/agc/FuncNetwork';

export class UserResourcesRepository {
  private service: FuncNetwork = new FuncNetwork();

  /**
   * Access the network to obtain the data collected by the user
   * @returns LearningResource[]
   */

  getCollectedResources(): Promise<LearningResource[]> {
    return this.service.getCollectResources();
  }

  /**
   * Access the network to obtain user browsing data
   * @returns LearningResource[]
   */

  getViewedResources(): Promise<LearningResource[]> {
    return this.service.getViewedResource();
  }

  /**
   * Visit the web to get user-acquired achievements
   * @returns Achieve[]
   */

  getAchievements(): Promise<Achieve[]> {
    return this.service.getUserAchievements();
  }
}