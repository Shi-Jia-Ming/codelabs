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

import { Topic, TopicsRepository, UserAccount, TopicType, LoadingStatus } from '@ohos/common';

@Observed
export class TopicModel {
  private resourceRepo: TopicsRepository = new TopicsRepository();
  public loadingStatus: LoadingStatus = LoadingStatus.OFF;
  private topicTotal: Topic[] = [];
  public feedList: Topic[] = [];
  public topicList: Topic[] = [];
  private followedIds: string[] = [];
  public followCheck: boolean = true;

  public static getInstance(): TopicModel {
    let topicModel: TopicModel = AppStorage.get('topicModel') as TopicModel;
    if (!topicModel) {
      AppStorage.setOrCreate('topicModel', new TopicModel());
    }
    return AppStorage.get('topicModel') as TopicModel;
  }

  getTopics(): void {
    if (this.feedList.length !== 0) {
      this.checkAndUpdate();
      return;
    }
    let currentUser: UserAccount = AppStorage.get<UserAccount>('user') as UserAccount;
    this.loadingStatus = LoadingStatus.LOADING;
    this.resourceRepo.getTopics(currentUser.id).then((topics: Topic[]) => {
      this.topicTotal = topics;
      this.checkAndUpdate();
    }).catch(() => {
      this.loadingStatus = LoadingStatus.FAILED;
    });
  }

  updateLocalTopic(): void {
    this.topicTotal = this.feedList.concat(this.topicList);
  }

  checkAndUpdate(): void {
    this.updateFeedAndTopic();
    this.checkFollowedTopic();
    this.loadingStatus = LoadingStatus.SUCCESS;
  }

  updateFeedAndTopic(): void {
    this.feedList = this.topicTotal.filter((item: Topic) => item.type === TopicType.FEED);
    this.topicList = this.topicTotal.filter((item: Topic) => item.type === TopicType.TOPIC);
    this.followedIds = this.topicTotal.filter((item: Topic) => item.isFollowed === true).map((item: Topic) => item.id);
  }

  editTopicsFollowed(): Promise<void> {
    let currentUser: UserAccount = AppStorage.get<UserAccount>('user') as UserAccount;
    return this.resourceRepo.editTopicsFollowed(currentUser.id, this.followedIds.join(','));
  }

  changeFollowedTopic(topic: Topic, isFollowed: boolean): void {
    topic.isFollowed = isFollowed;
    if (!topic.isFollowed) {
      this.followedIds = this.followedIds.filter((id: string) => id !== topic.id);
    } else {
      this.followedIds.push(topic.id);
    }
    if (topic.type === TopicType.FEED) {
      this.feedList = this.feedList.map((item: Topic) => item.id === topic.id ? topic : item);
    } else {
      this.topicList = this.topicList.map((item: Topic) => item.id === topic.id ? topic : item);
    }
    this.checkFollowedTopic();
  }

  checkFollowedTopic(): void {
    let numFollowedFeed: number = this.feedList.filter((item: Topic) => item.isFollowed).length;
    let numFollowedTopic: number = this.topicList.filter((item: Topic) => item.isFollowed).length;
    this.followCheck = true;
    if (numFollowedFeed < 1 || numFollowedTopic < 1) {
      this.followCheck = false;
    }
  }
}