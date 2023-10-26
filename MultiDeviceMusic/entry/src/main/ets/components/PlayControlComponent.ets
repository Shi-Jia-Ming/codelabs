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


import { MediaService } from '../common/utils/MediaService';
import { Logger } from '../common/utils/Logger';
import { BreakpointType } from '../common/utils/BreakpointSystem';
import { MusicPlayMode } from '../viewmodel/MusicData';
import { PlayControlModel } from '../viewmodel/PlayControlModel';
import { ControlConstants } from '../common/constants/ControlConstants';
import { PlayConstants } from '../common/constants/PlayConstants';

@Component
export struct PlayControlComponent {
  @StorageProp('currentBreakpoint') currentBreakpoint: string = 'sm';
  @ObjectLink playControl: PlayControlModel;
  @State index: number = 0;

  build() {
    Image(this.playControl.icon)
      .width(this.index === PlayConstants.PLAY_INDEX ? new BreakpointType({
        sm: $r('app.float.play_image_size'),
        md: $r('app.float.play_image_size'),
        lg: $r('app.float.play_image_size_lg')
      }).getValue(this.currentBreakpoint) : new BreakpointType({
        sm: $r('app.float.twenty_four'),
        md: $r('app.float.twenty_four'),
        lg: $r('app.float.play_control_image_size')
      }).getValue(this.currentBreakpoint))
      .aspectRatio(1)
      .objectFit(ImageFit.Contain)
      .onClick(() => this.playControlClick(this.playControl.key))
  }

  playControlClick(key: string) {
    switch (key) {
      case ControlConstants.PLAY_MODE:
        this.changePlayMode();
        break;
      case ControlConstants.PREVIOUS:
        MediaService.getInstance().playPrevious();
        break;
      case ControlConstants.PLAY:
        if (MediaService.getInstance().getFirst()) {
          MediaService.getInstance().loadAssent(0);
        } else {
          MediaService.getInstance().play();
        }
        this.playControl.icon = $r('app.media.ic_play_big');
        this.playControl.key = ControlConstants.PAUSE;
        break;
      case ControlConstants.PAUSE:
        MediaService.getInstance().pause();
        this.playControl.icon = $r('app.media.ic_pause_big');
        this.playControl.key = ControlConstants.PLAY;
        break;
      case ControlConstants.NEXT:
        MediaService.getInstance().playNextAuto(true);
        break;
      case ControlConstants.PLAY_LIST:
        break;
      default:
        break;
    }
  }

  private changePlayMode(): void {
    const mode = [MusicPlayMode.SINGLE_CYCLE, MusicPlayMode.ORDER, MusicPlayMode.RANDOM];
    const resource = [$r('app.media.ic_single_cycle'), $r('app.media.ic_list_cycle'), $r('app.media.ic_list_random')];
    let index = MediaService.getInstance().getPlayMode() + 1;
    if (index > mode.length - 1) {
      index = 0;
    }
    Logger.info('change play mode setPlayModel index:' + index);
    this.playControl.icon = resource[index];
    MediaService.getInstance().setPlayModel(mode[index]);
  }
}