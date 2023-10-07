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

import { BusinessError } from '@ohos.base';
import { Topic } from '../../../../entity/Topic';
import { Triggers } from './Triggers';
import Request from './Request';
import { UserAccount } from '../../../../entity/UserAccount';
import { LearningResource } from '../../../../entity/LearningResource';
import { ResourceDetail } from '../../../../entity/ResourceDetail';
import Logger from '../../../../logger/Logger';
import { Achieve } from '../../../../entity/Achieve';
import { UserData } from '../../../../entity/UserData';
import { NetworkNewsResources } from '../../../../entity/NetworkNewsResources';
import { ResourcesData } from '../../../../entity/ResourcesData';
import { ResourcesType } from '../../../../constants/EnumConstants';
import {
  EditTopicsParams,
  GetMoreResourcesParams,
  GetResourceDetailParams,
  LoginParams,
  ToggleActionParams,
  UserIdParams
} from './QueryParams';

const TAG = 'FuncNetwork';
const RESOURCE_PAGE_SIZE = 10;

/**
 * Use funcNetwork to get data
 */
export class FuncNetwork {
  /**************************************** TOPIC ******************************************/
  /**
   * Get Topic List by the userid.
   * @param userId
   * @returns
   */
  public getTopics(userId: string): Promise<Topic[]> {
    let params: UserIdParams = { userId };
    return new Promise((resolve: (value: Topic[] | PromiseLike<Topic[]>) => void,
                        reject: (reason?: Object) => void) => {
      Request.call(Triggers.TOPICS, params).then((result: Object) => {
        Logger.info(TAG, 'getTopics success--------' + JSON.stringify(result));
        resolve(result as Topic[]);
      }).catch((error: BusinessError) => {
        Logger.error(TAG, 'getTopics error--------' + JSON.stringify(error));
        reject(error);
      });
    });
  }

  /**
   * Edited Followed Topics.
   *
   * @param userId
   * @param followTopics
   * @returns
   */
  public editTopicsFollowed(userId: string, followTopics: string,): Promise<void> {
    let params: EditTopicsParams = { userId, followTopics };
    return new Promise((resolve: (value: void | PromiseLike<void>) => void,
                        reject: (reason?: Object) => void) => {
      Request.call(Triggers.TOPIC_MODIFY, params).then(() => {
        Logger.info(TAG, 'editTopicsFollowed success--------');
        resolve();
      }).catch((error: BusinessError) => {
        Logger.error(TAG, 'editTopicsFollowed error--------' + JSON.stringify(error));
        reject(error);
      });
    });
  }

  /**************************************** LOGIN ******************************************/
  /**
   *
   * @param username
   * @param password
   * @returns UserAccount
   */
  public login(username: string, password: string): Promise<UserAccount> {
    let params: LoginParams = { username, password };
    return new Promise((resolve: (value: UserAccount | PromiseLike<UserAccount>) => void,
                        reject: (reason?: Object) => void) => {
      Logger.info(TAG, 'login----------------------');
      Request.call(Triggers.LOGIN, params).then((result: Object) => {
        Logger.info(TAG, 'login success--------' + JSON.stringify(result));
        resolve(result as UserAccount);
      }).catch((error: BusinessError) => {
        Logger.error(TAG, 'login error--------' + JSON.stringify(error));
        reject(error);
      });
    });
  }

  /**************************************** DISCOVER ******************************************/
  /**
   *
   * @param resourceId
   * @param userId
   * @returns ResourceDetail
   */
  public getResourceDetail(resourceId: string): Promise<ResourceDetail> {
    const params: GetResourceDetailParams = {
      resourceId,
      userId: (AppStorage.get<UserAccount>('user') as UserAccount)?.id
    };
    return new Promise((resolve: (value: ResourceDetail | PromiseLike<ResourceDetail>) => void,
                        reject: (reason?: Object) => void) => {
      Request.call(Triggers.DETAIL, params).then((resourceDetail: Object) => {
        Logger.info(TAG, 'getResourceDetail success--------', JSON.stringify(resourceDetail));
        resolve(resourceDetail as ResourceDetail);
      }).catch((error: BusinessError) => {
        Logger.error(TAG, 'getResourceDetail error--------' + JSON.stringify(error));
        reject(error);
      });
    });
  }

  /**
   *
   * @param resourceId
   * @param operation
   * @param userId
   * @returns
   */

  public toggleLiked(resourceId: string, operation: number): Promise<void> {
    return new Promise((resolve: (value: void | PromiseLike<void>) => void,
                        reject: (reason?: Object) => void) => {
      const params: ToggleActionParams = {
        resourceId,
        operation,
        userId: (AppStorage.get<UserAccount>('user') as UserAccount)?.id
      };
      Request.call(Triggers.LIKE, params).then((result: Object) => {
        Logger.info(TAG, 'toggleLiked success--------' + JSON.stringify(result));
        resolve();
      }).catch((error: BusinessError) => {
        Logger.error(TAG, 'toggleLiked error--------' + JSON.stringify(error));
        reject(error);
      });
    });
  }

  /**
   * @param resourceId
   * @param operation
   * @param userId
   * @returns
   */
  public toggleCollected(resourceId: string, operation: number): Promise<void> {
    return new Promise((resolve: (value: void | PromiseLike<void>) => void,
                        reject: (reason?: Object) => void) => {
      const params: ToggleActionParams = {
        resourceId,
        operation,
        userId: (AppStorage.get<UserAccount>('user') as UserAccount)?.id
      };
      Request.call(Triggers.COLLECT_MODIFY, params).then((result: Object) => {
        Logger.info(TAG, 'toggleCollected success--------' + JSON.stringify(result));
        resolve();
      }).catch((error: BusinessError) => {
        Logger.error(TAG, 'toggleCollected error--------' + JSON.stringify(error));
        reject(error);
      });
    });
  }

  /**
   * @returns NetworkNewsResources
   */
  public getHomeResources(): Promise<NetworkNewsResources> {
    const params: UserIdParams = {
      userId: (AppStorage.get<UserAccount>('user') as UserAccount)?.id
    };

    return new Promise((resolve: (value: NetworkNewsResources | PromiseLike<NetworkNewsResources>) => void,
                        reject: (reason?: Object) => void) => {
      Request.call(Triggers.HOME_DATA, params).then((result: Object) => {
        Logger.info(TAG, 'getHomeResources success--------' + JSON.stringify(result));
        resolve(result as NetworkNewsResources);
      }).catch((error: BusinessError) => {
        Logger.error(TAG, 'getHomeResources error--------' + JSON.stringify(error));
        reject(error);
      });
    });
  }

  /**
   * @param pageNum
   * @param type
   * @returns ResourcesData
   */

  public getMoreResources(pageNum: number, type: ResourcesType): Promise<ResourcesData> {
    const params: GetMoreResourcesParams = {
      userId: (AppStorage.get<UserAccount>('user') as UserAccount)?.id,
      type,
      pageNum,
      pageSize: RESOURCE_PAGE_SIZE
    };

    return new Promise((resolve: (value: ResourcesData | PromiseLike<ResourcesData>) => void,
                        reject: (reason?: Object) => void) => {
      Request.call(Triggers.RESOURCE_PAGE, params).then((resourcesData: Object) => {
        Logger.info(TAG, 'getMoreResources success--------' + JSON.stringify(resourcesData));
        resolve(resourcesData as ResourcesData);
      }).catch((error: BusinessError) => {
        Logger.error(TAG, 'getMoreResources error--------' + JSON.stringify(error));
        reject(error);
      });
    });
  }

  /**************************************** MINE ******************************************/
  /**
   * @param userId
   * @returns Achieve[]
   */
  public getUserAchievements(): Promise<Achieve[]> {
    const params: UserIdParams = {
      userId: (AppStorage.get<UserAccount>('user') as UserAccount)?.id
    };
    return new Promise(((resolve: (value: Achieve[] | PromiseLike<Achieve[]>) => void,
                         reject: (reason?: Object) => void) => {
      Request.call(Triggers.ACHIEVE, params).then((achieves: Object) => {
        Logger.info(TAG, 'getUserAchievements success------' + JSON.stringify(achieves));
        resolve(achieves as Achieve[]);
      }).catch((error: BusinessError) => {
        Logger.error(TAG, 'getUserAchievements error-----' + JSON.stringify(error));
        reject(error);
      });
    }));
  }

  /**
   * @param userId
   * @returns UserData
   */
  public getUserData(): Promise<UserData> {
    const params: UserIdParams = {
      userId: (AppStorage.get<UserAccount>('user') as UserAccount)?.id
    };

    return new Promise(((resolve: (value: UserData | PromiseLike<UserData>) => void,
                         reject: (reason?: Object) => void) => {
      Request.call(Triggers.USER_DATA, params).then((userData: Object) => {
        Logger.info(TAG, 'getUserData success--------' + JSON.stringify(userData));
        resolve(userData as UserData);
      }).catch((error: BusinessError) => {
        Logger.error(TAG, 'getUserData error--------' + JSON.stringify(error));
        reject(error);
      });
    }));
  }

  /**
   * @param userId
   * @returns LearningResource[]
   */
  public getCollectResources(): Promise<LearningResource[]> {
    const params: UserIdParams = {
      userId: (AppStorage.get<UserAccount>('user') as UserAccount)?.id
    };
    return new Promise(((resolve: (value: LearningResource[] | PromiseLike<LearningResource[]>) => void,
                         reject: (reason?: Object) => void) => {
      Request.call(Triggers.COLLECT, params).then((learnResources: Object) => {
        Logger.info(TAG, 'getCollectResource success--------' + JSON.stringify(learnResources));
        resolve(learnResources as LearningResource[]);
      }).catch((error: BusinessError) => {
        Logger.error(TAG, 'getCollectResource error--------' + JSON.stringify(error));
        reject(error);
      });
    }));
  }

  /**
   * @param userId
   * @returns LearningResource[]
   */
  public getViewedResource(): Promise<LearningResource[]> {
    const params: UserIdParams = {
      userId: (AppStorage.get<UserAccount>('user') as UserAccount).id
    };
    return new Promise(((resolve: (value: LearningResource[] | PromiseLike<LearningResource[]>) => void,
                         reject: (reason?: Object) => void) => {
      Request.call(Triggers.HISTORY, params).then((learnResources: Object) => {
        Logger.info(TAG, ' getViewedResource success--------' + JSON.stringify(learnResources));
        resolve(learnResources as LearningResource[]);
      }).catch((error: BusinessError) => {
        Logger.error(TAG, 'getViewedResource error--------' + JSON.stringify(error));
        reject(error);
      });
    }));
  }
}
