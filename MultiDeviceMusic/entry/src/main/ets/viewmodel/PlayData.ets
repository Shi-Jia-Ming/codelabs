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

import { PlayControlModel } from './PlayControlModel';
import { ControlConstants } from '../common/constants/ControlConstants';

const playImage: PlayControlModel[] = [
  new PlayControlModel($r('app.media.ic_download'), ''),
  new PlayControlModel($r('app.media.ic_review'), 'review'),
  new PlayControlModel($r('app.media.ic_mv'), '' ),
  new PlayControlModel($r('app.media.ic_ring'), ''),
  new PlayControlModel($r('app.media.ic_list_more'), '')
]

const playControl: PlayControlModel[] = [
  new PlayControlModel(
    $r('app.media.ic_list_cycle'),
    ControlConstants.PLAY_MODE
  ),
  new PlayControlModel(
    $r('app.media.ic_last'),
    ControlConstants.PREVIOUS
  ),
  new PlayControlModel(
    $r('app.media.ic_play_big'),
    ControlConstants.PLAY
  ),
  new PlayControlModel(
    $r('app.media.ic_next'),
    ControlConstants.NEXT
  ),
  new PlayControlModel(
    $r('app.media.ic_music_list'),
    ControlConstants.PLAY_LIST
  )
]

export { playImage, playControl }