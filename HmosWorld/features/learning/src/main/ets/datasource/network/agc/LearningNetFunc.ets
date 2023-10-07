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

/**
 * Using AGC Functions to Obtain Network Data.
 */
import { BusinessError } from '@ohos.base';
import { AgcRequest, Logger, UserAccount } from '@ohos/common';
import { LearningPath } from '../../../entity/LearningPath';
import { LearningParams, UserIdParams } from './LearningParams';
import { LearningTrigger } from './LearningTrigger';

const TAG = '[LearningNetFunc]';

export class LearningNetFunc {
  public getLearningPaths(): Promise<LearningPath[]> {
    const params: UserIdParams = {
      userId: (AppStorage.get<UserAccount>('user') as UserAccount)?.id
    };
    return new Promise((resolve: (list: LearningPath[]) => void, reject: (error: BusinessError) => void) => {
      AgcRequest.call(LearningTrigger.LEARNING_PATHS, params)
        .then((result: Object) => {
          Logger.info(TAG, ' getLearningPaths success--------' + JSON.stringify(result));
          let pathList: LearningPath[] = [];
          if (result) {
           pathList = (result as LearningPath[]);
          }
          resolve(pathList);
        })
        .catch((error: BusinessError) => {
          Logger.error(TAG, 'getLearningPaths error--------' + JSON.stringify(error));
          reject(error);
        });
    });
  }

  public updateLearnedPath(pathId: string): Promise<void> {
    const params: LearningParams = {
      pathId,
      userId: (AppStorage.get<UserAccount>('user') as UserAccount)?.id
    };
    return new Promise((resolve: () => void, reject: (error: BusinessError) => void) => {
      AgcRequest.call(LearningTrigger.LEARNING_MODIFY, params).then(() => {
        Logger.info(TAG, ' updateLearnedPath success--------');
        resolve();
      }).catch((error: BusinessError) => {
        Logger.error(TAG, 'updateLearnedPath error--------' + JSON.stringify(error));
        reject(error);
      });
    });
  }
}