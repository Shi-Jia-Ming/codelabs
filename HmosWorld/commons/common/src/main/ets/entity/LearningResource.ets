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

import util from '@ohos.util';
import { ResourcesType, TagType } from '../constants/EnumConstants';

@Observed
export class LearningResource {
  /**
   *  Randomly generated unique ID
   */
  uuid: string;
  /**
   *  Resource id
   */
  id: string = '';
  /**
   *  Resource title
   */
  title: string = '';
  /**
   *  Resource brief
   */
  brief?: string = '';
  /**
   *  Resource type
   */
  type: ResourcesType = ResourcesType.FEED;
  /**
   *  Resource detail Web URL
   */
  webUrl: string = '';
  /**
   *  Resource publish date
   */
  publishDate: Date = new Date();
  /**
   *  Resource cover image used on card
   */
  headerImageUrl: string = '';
  /**
   *  Topics to which the resource belongs.
   */
  topics: string[] = [];
  /**
   *  Resource views count
   */
  viewsCount: number = 0;
  /**
   *  Resource collection count
   */
  collectionCount: number = 0;
  /**
   *  Resource likes count
   */
  likesCount: number = 0;
  /**
   *  Resource tag
   */
  tag: TagType = TagType.NORMAL;
  /**
   *  Indicates whether the resource is added to likes list of the current user.
   */
  isLiked: boolean = false;
  /**
   *  Indicates whether the resource is added to favorites of the current user
   */
  isCollected: boolean = false;
  /**
   *  Whether the resource has been browsed by the current user
   */
  isViewed: boolean = false;
  /**
   *  Resource detail media URL
   */
  mediaSrc: string = '';
  /**
   *  Resource banner image URL
   */
  bannerSrc: string = '';

  constructor(resource?: LearningResource) {
    this.uuid = util.generateRandomUUID(false);
    if (resource !== undefined) {
      this.id = resource.id;
      this.title = resource.title;
      this.type = resource.type;
      this.tag = resource.tag;
      this.brief = resource.brief;
      this.webUrl = resource.webUrl;
      this.publishDate = resource.publishDate;
      this.headerImageUrl = resource.headerImageUrl;
      this.bannerSrc = resource.bannerSrc;
      this.mediaSrc = resource.mediaSrc;
      this.topics = resource.topics;
      this.viewsCount = resource.viewsCount;
      this.collectionCount = resource.collectionCount;
      this.likesCount = resource.likesCount;
      this.isLiked = resource.isLiked;
      this.isCollected = resource.isCollected;
      this.isViewed = resource.isViewed;
    }
  }
}