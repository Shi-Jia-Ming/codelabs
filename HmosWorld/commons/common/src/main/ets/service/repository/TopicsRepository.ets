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

import { FuncNetwork } from '../datasource/network/agc/FuncNetwork';
import { Topic } from '../../entity/Topic';

export class TopicsRepository {
  private topicService: FuncNetwork = new FuncNetwork();

  /**
   * Get Topic List by the userid.
   *
   * @param userId
   * @returns
   */
  getTopics(userId: string): Promise<Topic[]> {
    return this.topicService.getTopics(userId);
  }
  /**
   * Edited Followed Topics.
   *
   * @param userId
   * @param followTopics
   * @returns
   */
  editTopicsFollowed(userId: string, followTopics: string,): Promise<void> {
    return this.topicService.editTopicsFollowed(userId, followTopics);
  }
}