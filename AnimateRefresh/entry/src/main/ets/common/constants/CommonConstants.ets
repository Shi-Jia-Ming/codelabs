/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import display from '@ohos.display';
import ClassifyModel from '../../viewmodel/AnimationModel';
import CardModel from '../../viewmodel/CardModel';
import { GlobalContext } from '../utils/GlobalContext';

let deviceDisplay: display.Display = GlobalContext.getContext().getObject('display') as display.Display;

/**
 * constant about common feature
 */
export default class CommonConstants {

  /**
   * common full length
   */
  static readonly FULL_LENGTH = '100%';

  /**
   * refresh header item width
   */
  static readonly REFRESH_HEADER_ITEM_DEFAULT_WIDTH = 30;

  /**
   * refresh header item scale width
   */
  static readonly REFRESH_HEADER_ITEM_SCALE_WIDTH = 80;

  /**
   * refresh default time out
   */
  static readonly REFRESH_DEFAULT_TIMEOUT = 6000;

  /**
   * refresh header item animation duration
   */
  static readonly REFRESH_HEADER_ITEM_ANIM_DURATION = 2000;

  /**
   * refresh header item animation temp
   */
  static readonly REFRESH_HEADER_ITEM_ANIM_TEMPO = 3.0;

  /**
   * refresh header item animation ITERATIONS
   */
  static readonly REFRESH_HEADER_ITEM_ANIM_ITERATIONS = -1;

  /**
   * refresh header item feature
   */
  static readonly REFRESH_HEADER_FEATURE: ClassifyModel[] = [
    new ClassifyModel($r('app.media.ic_loading_game'), (px2vp(deviceDisplay.width) / 2 - CommonConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2) - 100, 400),
    new ClassifyModel($r('app.media.ic_loading_heart'), (px2vp(deviceDisplay.width) / 2 - CommonConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2) - 50, 800),
    new ClassifyModel($r('app.media.ic_loading_louder'), px2vp(deviceDisplay.width) / 2 - CommonConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2, 1200),
    new ClassifyModel($r('app.media.ic_loading_bag'), (px2vp(deviceDisplay.width) / 2 - CommonConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2) + 50, 1600),
    new ClassifyModel($r('app.media.ic_loading_file'), (px2vp(deviceDisplay.width) / 2 - CommonConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2) + 100, 2000)
  ];

  /**
   * refresh header item width
   */
  static readonly FILE_MANAGER_Z_INDEX = 1;

  /**
   * index default select
   */
  static readonly INDEX_DEFAULT_SELECT = 1;

  /**
   * index tab item feature
   */
  static readonly INDEX_TAB = [
    new CardModel($r('app.media.ic_tab_main_select'),$r('app.media.ic_tab_main_default'),'首页'),
    new CardModel($r('app.media.ic_tab_file_select'),$r('app.media.ic_tab_file_default'),'文件'),
    new CardModel($r('app.media.ic_tab_cloud_select'),$r('app.media.ic_tab_cloud_default'),'云村'),
    new CardModel($r('app.media.ic_tab_copy_select'),$r('app.media.ic_tab_copy_default'),'备份'),
    new CardModel($r('app.media.ic_tab_mine_select'),$r('app.media.ic_tab_mine_default'),'我的')
  ];
}