/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { Logger, ObservedArray, LoadingStatus } from '@ohos/common';
import { LearningNetFunc } from '../datasource/network/agc/LearningNetFunc';
import { LearningPath } from '../entity/LearningPath';

const TAG = '[LearningModel]';

@Observed
export class LearningModel {
  private funNetwork: LearningNetFunc;
  isLoading: LoadingStatus = LoadingStatus.SUCCESS; // Is Loading.
  isUpdating: boolean = false; // Is updating data
  list: ObservedArray<LearningPath> = DEFAULT_PATHS; // Data source.
  learningMap?: Map<string, LearningPath>;

  constructor() {
    Logger.info(TAG, 'LearningModel constructor');
    this.funNetwork = new LearningNetFunc();
  }

  /**
   * Get learning model instance.
   *
   * @returns learning model instance.
   */
  public static getInstance(): LearningModel {
    let learningModel = AppStorage.get<LearningModel>('learningModel');
    if (!learningModel) {
      learningModel = new LearningModel();
      AppStorage.setOrCreate('learningModel', learningModel);
    }
    return learningModel;
  }

  /**
   * init list data and load learning path from servers.
   */
  init(): void {
    this.loadLearningPathData();
  }

  /**
   * Load learning path from servers.
   */
  loadLearningPathData(): void {
    this.funNetwork.getLearningPaths().then((data: LearningPath[]) => {
      Logger.info(TAG, 'loadLearningPathData data ' + JSON.stringify(data));
      let paths: ObservedArray<LearningPath> = new ObservedArray<LearningPath>();
      this.list.forEach((path: LearningPath) => {
        path.isLearned = !!((paths.find((item) => item.id === path.id))?.isLearned);
      });
      Logger.info(TAG, 'loadLearningPathData this.learningPathList: ' + JSON.stringify(this.list));
    }).catch((error: Error) => {
      Logger.error(TAG, 'loadLearningPathData error ' + JSON.stringify(error));
      this.list = DEFAULT_PATHS;
    });
  }

  /**
   * Update learning path status.
   *
   * @param pathId
   * @returns void
   */
  updateLearnedPath(pathId: string): Promise<void> {
    return new Promise((resolve: () => void, reject: () => void) => {
      this.isUpdating = true;
      this.funNetwork.updateLearnedPath(pathId).then(() => {
        this.isUpdating = false;
        Logger.info(TAG, 'updateLearnedPath data success');
        this.list.forEach((item: LearningPath) => {
          if (item.id === pathId) {
            item.isLearned = true;
          }
        });
        resolve();
      }).catch((error: Error) => {
        Logger.error(TAG, 'updateLearnedPath error ' + JSON.stringify(error));
        this.isUpdating = false;
        reject();
      });
    })
  }

  /**
   * Get learning path map.
   *
   * @returns learningMap
   */
  getLearningMap(): Map<string, LearningPath> {
    if (!this.learningMap) {
      let map = new Map<string, LearningPath>();
      DEFAULT_PATHS.forEach((item: LearningPath) => {
        map.set(item.id, item);
      });
      this.learningMap = map;
    }
    return this.learningMap;
  }
}

const DEFAULT_PATHS: LearningPath[] = [
  new LearningPath(
    'p007',
    '从网络获取数据',
    'https://developer.huawei.com/consumer/cn/training/course/slightMooc/C101667364948559963?ha_linker=eyJ0cyI6MTY4OTMxNTA3MTU3NSwiaWQiOiIyNDRkNGQzNmFiODExM2IxMTI1YjBhNGNjZDM4YmE3OCJ9',
    '学习如何访问网络，来构建一个可以从网络实时获取数据的应用。',
    $r('app.media.ic_achieve_7'),
    $r('app.media.ic_learning_7'),
    false
  ),
  new LearningPath(
    'p008',
    '保存应用数据',
    'https://developer.huawei.com/consumer/cn/training/course/slightMooc/C101667367018821971?ha_linker=eyJ0cyI6MTY4OTMxNTA4MDAyMiwiaWQiOiIyNDRkNGQzNmFiODExM2IxMTI1YjBhNGNjZDM4YmE3OCJ9',
    '存储应用的一些常用配置，以便应用获得更快的数据存取速度。',
    $r('app.media.ic_achieve_8'),
    $r('app.media.ic_learning_8'),
    false
  ),
  new LearningPath(
    'p001',
    '运行Hello World',
    'https://developer.huawei.com/consumer/cn/training/course/slightMooc/C101667303102887820?ha_linker=eyJ0cyI6MTY4OTMxNDg3Njk4NiwiaWQiOiIyNDRkNGQzNmFiODExM2IxMTI1YjBhNGNjZDM4YmE3OCJ9',
    '安装DevEco Studio开发工具，运行第一个应用。',
    $r('app.media.ic_achieve_1'),
    $r('app.media.ic_learning_1'),
    false
  ),
  new LearningPath(
    'p002',
    'ArkTS开发语言介绍',
    'https://developer.huawei.com/consumer/cn/training/course/slightMooc/C101667356568959645?ha_linker=eyJ0cyI6MTY4OTMxNDkxNjE3MCwiaWQiOiIyNDRkNGQzNmFiODExM2IxMTI1YjBhNGNjZDM4YmE3OCJ9',
    '掌握基于TS扩展的ArkTS语言，以更接近自然语义快速开发应用。',
    $r('app.media.ic_achieve_2'),
    $r('app.media.ic_learning_2'),
    false
  ),
  new LearningPath(
    'p003',
    '应用程序框架',
    'https://developer.huawei.com/consumer/cn/training/course/slightMooc/C101667310940295021?ha_linker=eyJ0cyI6MTY4OTMxNTAzMjg1NSwiaWQiOiIyNDRkNGQzNmFiODExM2IxMTI1YjBhNGNjZDM4YmE3OCJ9',
    '从应用入口开始，了解用户如何与应用交互，理解应用的生命周期。',
    $r('app.media.ic_achieve_3'),
    $r('app.media.ic_learning_3'),
    false
  ),
  new LearningPath(
    'p004',
    '从简单的页面开始',
    'https://developer.huawei.com/consumer/cn/training/course/slightMooc/C101667360160710997?ha_linker=eyJ0cyI6MTY4OTMxNTA0MzQ5NiwiaWQiOiIyNDRkNGQzNmFiODExM2IxMTI1YjBhNGNjZDM4YmE3OCJ9',
    '了解基础组件、常用容器，并学习如何构建列表、页签切换等常用场景。',
    $r('app.media.ic_achieve_4'),
    $r('app.media.ic_learning_4'),
    false
  ),
  new LearningPath(
    'p005',
    '构建更加丰富的页面',
    'https://developer.huawei.com/consumer/cn/training/course/slightMooc/C101680765314766141?ha_linker=eyJ0cyI6MTY4OTMxNTA1MTk1OSwiaWQiOiIyNDRkNGQzNmFiODExM2IxMTI1YjBhNGNjZDM4YmE3OCJ9',
    '了解组件状态管理的相关知识点，并进一步的学习一些常用的组件如video和弹窗，来构建更加丰富的页面。',
    $r('app.media.ic_achieve_5'),
    $r('app.media.ic_learning_5'),
    false
  ),
  new LearningPath(
    'p006',
    'ArkUI之属性动画',
    'https://developer.huawei.com/consumer/cn/training/course/slightMooc/C101667368091091005?ha_linker=eyJ0cyI6MTY4OTMxNTA2MjY3MywiaWQiOiIyNDRkNGQzNmFiODExM2IxMTI1YjBhNGNjZDM4YmE3OCJ9',
    '声明式UI框架，它使用极简的UI信息语法、丰富的UI动效组件和API、以及实时界面预览工具，帮助提升应用界面开发的效率。',
    $r('app.media.ic_achieve_6'),
    $r('app.media.ic_learning_6'),
    false
  )
];