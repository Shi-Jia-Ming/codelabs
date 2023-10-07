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
import { ResourceDetail } from '../../entity/ResourceDetail';
import { NetworkNewsResources } from '../../entity/NetworkNewsResources';
import { ResourcesData } from '../../entity/ResourcesData';
import { ResourcesType } from '../../constants/EnumConstants';

export class ResourcesRepository {
  private funNetwork: FuncNetwork = new FuncNetwork();

  /**
   * Get resource data on home page
   * @param pageNum
   * @returns
   */
  getHomeResources(): Promise<NetworkNewsResources> {
    return this.funNetwork.getHomeResources();
  }

  /**
   * Get next page articles
   * @param pageNum
   * @returns
   */
  getMoreArticle(pageNum: number): Promise<ResourcesData> {
    return this.funNetwork.getMoreResources(pageNum, ResourcesType.ARTICLE);
  }

  /**
   * Get next page feeds
   * @param pageNum
   * @returns
   */
  getMoreFeed(pageNum: number): Promise<ResourcesData> {
    return this.funNetwork.getMoreResources(pageNum, ResourcesType.FEED);
  }

  /**
   * Get resource(include article and feed) detail
   * @param pageNum
   * @returns
   */
  getResourceDetail(id: string): Promise<ResourceDetail> {
    return this.funNetwork.getResourceDetail(id);
  }

  /**
   * Switches whether a user likes a resource
   * @param pageNum
   * @returns
   */
  toggleLiked(resourceId: string, operation: number) {
    this.funNetwork.toggleLiked(resourceId, operation);
  }

  /**
   * Switches whether a user has collected a resource
   * @param pageNum
   * @returns
   */
  toggleCollected(resourceId: string, operation: number) {
    this.funNetwork.toggleCollected(resourceId, operation);
  }
}