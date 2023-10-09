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

export class PlayerConstants {
  /**
   * Episodes.
   */
  static readonly PLAYER_EPISODE: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14',
    '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'];

  /**
   * Video detail url.
   */
  static readonly VIDEO_DETAIL_URL: string = '@bundle:com.huawei.videoapplication/videoDetail/ets/pages/Index';

  /**
   * Player text list.
   */
  static readonly PLAYER_TEXT_LIST: string[] = ['选集', '只看TA', '超清', '倍速'];

  /**
   * X component id.
   */
  static readonly X_COMPONENT_ID: string = 'videoPlayer';

  /**
   * Screen width 600.
   */
  static readonly SCREEN_WIDTH_600: number = 600;

  /**
   * Episode list lanes list.
   */
  static readonly EPISODE_LIST_LANES: number[] = [8, 4];
}