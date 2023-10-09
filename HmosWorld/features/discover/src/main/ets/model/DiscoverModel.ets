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

import Intl from '@ohos.intl';
import common from '@ohos.app.ability.common';
import promptAction from '@ohos.promptAction';
import {
  ActionEventData,
  CommonConstants,
  LearningResource,
  LoadingStatus,
  Logger,
  ObservedArray,
  ResourceDetail,
  ResourcesRepository,
  ResourcesType
} from '@ohos/common';
import { NetworkNewsResources } from '@ohos/common/src/main/ets/entity/NetworkNewsResources';
import { ResourcesData } from '@ohos/common/src/main/ets/entity/ResourcesData';

const TAG = '[DiscoverModel]';
const locale = new Intl.Locale();
const DISCOVER_MODEL = 'discoverModel';

@Observed
export class DiscoverModel {
  // Home page data loaded for the first time
  loadingStatus: LoadingStatus = LoadingStatus.OFF;
  swiperData: LearningResource[] = [];
  hotFeedList: ObservedArray<LearningResource> = new ObservedArray<LearningResource>();
  techArticleList: ObservedArray<LearningResource> = new ObservedArray<LearningResource>();
  // Load more articles
  loadingArticleStatus: LoadingStatus = LoadingStatus.OFF;
  hasNextArticle: boolean = true;
  curArticlePage: number = 0;
  // Load more feeds
  loadingFeedStatus: LoadingStatus = LoadingStatus.OFF;
  hasNextFeed: boolean = true;
  curFeedPage: number = 0;
  // Load detail
  detailLoadingStatus: LoadingStatus = LoadingStatus.OFF;
  detailData: ResourceDetail = new ResourceDetail();
  private resourcesRepository: ResourcesRepository = new ResourcesRepository();
  private eventHub: common.EventHub = (getContext(this) as common.UIAbilityContext).eventHub;

  constructor() {
    Logger.info(TAG, 'DiscoverModel constructor');
    // Subscribing to public events
    this.eventHub.on(CommonConstants.COLLECTED_EVENT,
      (eventData: ActionEventData): void => this.setCollectionCount(eventData));
    this.eventHub.on(CommonConstants.LIKED_EVENT, (eventData: ActionEventData): void => this.setLikesCount(eventData));
  }

  /**
   * Get discover model instance.
   *
   * @returns discover model instance.
   */
  public static getInstance(): DiscoverModel {
    if (!AppStorage.get<DiscoverModel>(DISCOVER_MODEL)) {
      AppStorage.setOrCreate(DISCOVER_MODEL, new DiscoverModel());
    }
    return AppStorage.get<DiscoverModel>(DISCOVER_MODEL) as DiscoverModel;
  }

  /**
   * Data loaded on the home page converts network data into page rendering data
   */
  getHomeResources(): Promise<void> {
    this.loadingStatus = LoadingStatus.LOADING;
    return new Promise(resolve => {
      this.resourcesRepository.getHomeResources().then((data: NetworkNewsResources) => {
        this.swiperData.length = 0;
        this.hotFeedList.length = 0;
        this.techArticleList.length = 0;
        this.swiperData = data.bannerList;
        data.feedData.resourceList.forEach((res: LearningResource) => {
          this.hotFeedList.push(new LearningResource(res));
        });
        data.articleData.resourceList.forEach((res: LearningResource) => {
          this.techArticleList.push(new LearningResource(res));
        });
        // load more info
        this.curArticlePage = data.articleData.currentPage;
        this.hasNextArticle = data.articleData.hasNext;
        this.curFeedPage = data.feedData.currentPage;
        this.hasNextFeed = data.feedData.hasNext;
        // loading status
        this.loadingStatus = LoadingStatus.SUCCESS;
        Logger.info(TAG, JSON.stringify(this.swiperData));
        resolve();
      }).catch((err: Error) => {
        this.loadingStatus = LoadingStatus.FAILED;
        Logger.error(TAG, `Init failed! Error message is ${err}`);
      });
    });
  }

  /**
   * Load next page article data
   */
  loadMoreArticle(): Promise<LearningResource[]> {
    this.loadingArticleStatus = LoadingStatus.LOADING;
    return new Promise((resolve, reject) => {
      this.resourcesRepository.getMoreArticle(this.curArticlePage + 1).then((data: ResourcesData) => {
        data.resourceList.forEach((res: LearningResource) => {
          this.techArticleList.push(new LearningResource(res));
        });
        this.curArticlePage = data.currentPage;
        this.hasNextArticle = data.hasNext;
        this.loadingArticleStatus = LoadingStatus.SUCCESS;
        Logger.info(TAG, 'LoadMore articles success!');
        resolve(data.resourceList)
      }).catch((err: Error) => {
        this.loadingArticleStatus = LoadingStatus.FAILED;
        promptAction.showToast({
          message: $r('app.string.load_failed')
        });
        Logger.error(TAG, `LoadMore articles failed! Error message is ${err}.`);
      });
    })
  }

  /**
   * Load next page feed data
   */
  loadMoreFeed(): void {
    if (this.hasNextFeed) {
      this.loadingFeedStatus = LoadingStatus.LOADING;
      this.resourcesRepository.getMoreFeed(this.curFeedPage + 1).then((data: ResourcesData) => {
        data.resourceList.forEach((res: LearningResource) => {
          this.hotFeedList.push(new LearningResource(res));
        });
        this.curFeedPage = data.currentPage;
        this.hasNextFeed = data.hasNext;
        this.loadingFeedStatus = LoadingStatus.SUCCESS;
        Logger.info(TAG, 'LoadMore feed success!' + JSON.stringify(data));
      }).catch((err: Error) => {
        this.loadingFeedStatus = LoadingStatus.FAILED;
        promptAction.showToast({
          message: $r('app.string.load_failed')
        });
        Logger.error(TAG, `LoadMore feed failed! Error message is ${err}.`);
      });
    }
  }

  /**
   * Get feed detail or article detail by resourceId
   * @param resourceId
   */
  getResourceDetail(resourceId: string): Promise<void> {
    return new Promise((resolve, reject) => {
      this.detailLoadingStatus = LoadingStatus.LOADING;
      this.resourcesRepository.getResourceDetail(resourceId).then((res: ResourceDetail) => {
        this.detailData = res;
        this.setViewsCount(resourceId);
        this.eventHub.emit(CommonConstants.VIEW_EVENT, resourceId);
        this.detailLoadingStatus = LoadingStatus.SUCCESS;
        resolve();
        Logger.info(TAG, 'GetFeedDetail success!');
      }).catch((err: Error) => {
        this.detailLoadingStatus = LoadingStatus.FAILED;
        reject();
        Logger.error(TAG, `GetFeedDetail failed! Error message is ${err}.`);
      });
    })
  }

  /**
   * Set view counts of feed or article by resourceId
   * @param resourceId
   */
  setViewsCount(resourceId: string): void {
    this.hotFeedList.forEach((res: LearningResource) => {
      if (res.id === resourceId) {
        res.viewsCount += 1;
      }
    });
    this.techArticleList.forEach((res: LearningResource) => {
      if (res.id === resourceId) {
        res.viewsCount += 1;
      }
    });
  }

  /**
   * Set collection count of feed or article through public event parameters
   * @param eventData
   */
  setCollectionCount(eventData: ActionEventData): void {
    if (eventData.resourceType === ResourcesType.FEED) {
      this.hotFeedList.forEach((res: LearningResource) => {
        if (res.id === eventData.resourceId) {
          res.collectionCount += eventData.actionValue ? 1 : -1;
        }
      });
    }
    if (eventData.resourceType === ResourcesType.ARTICLE) {
      this.techArticleList.forEach((res: LearningResource) => {
        if (res.id === eventData.resourceId) {
          res.collectionCount += eventData.actionValue ? 1 : -1;
        }
      });
    }
  }

  /**
   * Set likes count of feed or article through public event parameters
   * @param eventData
   */
  setLikesCount(eventData: ActionEventData): void {
    if (eventData.resourceType === ResourcesType.FEED) {
      this.hotFeedList.forEach((res: LearningResource) => {
        if (res.id === eventData.resourceId) {
          res.likesCount += eventData.actionValue ? 1 : -1;
        }
      });
    }
    if (eventData.resourceType === ResourcesType.ARTICLE) {
      this.techArticleList.forEach((res: LearningResource) => {
        if (res.id === eventData.resourceId) {
          res.likesCount += eventData.actionValue ? 1 : -1;
        }
      });
    }
  }
}

