/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

@Observed
export class LearningPath {
  id: string;
  title: string;
  brief: string;
  url: string;
  isLearned: boolean;
  achieveImg: ResourceStr;
  thumbnail: ResourceStr;

  constructor(id: string, title: string, url: string, brief: string,
              achieveImg: ResourceStr, thumbnail: ResourceStr, isLearned: boolean) {
    this.id = id;
    this.title = title;
    this.brief = brief;
    this.url = url;
    this.achieveImg = achieveImg;
    this.thumbnail = thumbnail;
    this.isLearned = isLearned;
  }
}