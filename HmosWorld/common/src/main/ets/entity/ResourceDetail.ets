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

import { ResourcesType } from '../constants/EnumConstants';
import { LearningResource } from './LearningResource';

@Observed
export class ResourceDetail {
  /**
   *  Resource title
   */
  title: string = '';
  /**
   *  Resource id
   */
  resourceId: string = '';
  /**
   *  Cover Thumbnail
   */
  headerImageUrl?: string;
  /**
   *  Resource type
   */
  type: ResourcesType = ResourcesType.ARTICLE;
  /**
   *  Web URL of the resource details
   */
  webUrl: string = '';
  /**
   *  Collection count  for resource details
   */
  collectionCount: number = 0;
  /**
   *  Likes count  for resource details
   */
  likesCount: number = 0;
  /**
   *  Media URL of the resource details
   */
  mediaSrc?: string;
  /**
   *  Indicates whether the resource is added to likes list of the current user
   */
  isLiked: boolean = false;
  /**
   *  Indicates whether the resource is added to favorites of the current user
   */
  isCollected: boolean = false;
  /**
   *  Resources related to the current resource
   */
  relatedSource?: LearningResource[];
}