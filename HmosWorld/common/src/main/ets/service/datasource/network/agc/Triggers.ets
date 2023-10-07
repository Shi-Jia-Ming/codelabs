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

export enum Triggers {
  // Login
  LOGIN = 'login-$latest',
  // Discovery Modules - Get All Topics
  TOPICS = 'topics-$latest',
  // Discovery Module - Get Followed Topics
  TOPIC_FOLLOWED = 'topics-followed-$latest',
  // Discovery Module - Modify Focused Topics
  TOPIC_MODIFY = 'topic-modify-$latest',
  // Discovery Module - Get Common Resources
  RESOURCE = 'resource-$latest',
  // Discovery Module - Get Popular Resources
  HOT_RESOURCE = 'hot-$latest',
  // Discovery Module - Get Child Theme Resources
  TOPIC_RESOURCE = 'topic-resource-$latest',
  // Discovery Module - Get Details Page
  DETAIL = 'detail-$latest',
  // Discovery Module - Like
  LIKE = 'like-$latest',
  // Discovery Module - Favorites
  COLLECT_MODIFY = 'collect-modify-$latest',
  // Mine Modules - Get List of Favorites
  COLLECT = 'collect-$latest',
  // Mine Module - Get Browsing History List
  HISTORY = 'history-$latest',
  // Mine Modules - Achievements
  ACHIEVE = 'achieve-$latest',
  // Mine module - Get user data
  USER_DATA = 'user-data-$latest',
  // Discovery Module - Home Data
  HOME_DATA = 'home-resource-$latest',
  // Discovery module paging interface
  RESOURCE_PAGE = 'resource-list-$latest'
}
