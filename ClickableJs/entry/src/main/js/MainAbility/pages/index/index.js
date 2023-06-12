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

import CommonConstants from '../../common/constants/commonConstants';

export default {
  data: {
    contentTitle: '',
    hook: true,
    imageCards: [
      {
        src: '/common/images/ic_heart_rate.png',
        classType: 'img-normal',
        eventType: 'touch',
        description: ''
      },
      {
        src: '/common/images/ic_hook.png',
        eventType: 'click',
        classType: 'img-normal',
        description: ''
      },
    ],
    animationCards: [
      {
        id: 'dialAnimation',
        type: 'dial',
        frames: CommonConstants.DIAL_FRAMES,
        description: '',
        durationTime: 0
      },
      {
        id: 'toggleAnimation',
        type: 'toggle',
        frames: [],
        description: '',
        durationTime: 0,
        flag: true
      }
    ],
    durationTimeArray: [CommonConstants.DURATION_TIME, CommonConstants.DURATION_TIME],
    arrow: CommonConstants.ARROW_FRAMES,
    collapse: CommonConstants.COLLAPSE_FRAMES
  },
  onInit() {
    this.contentTitle = this.$t('strings.content_title');
    this.imageCards[0].description = this.$t('strings.normal_description');
    this.imageCards[1].description = this.$t('strings.select_description');
    this.animationCards[0].description = this.$t('strings.phone_description');
    this.animationCards[1].description = this.$t('strings.state_description');
    this.animationCards[1].frames = this.arrow;
    this.animationCards[1].durationTime = 0;
    this.animationCards[0].durationTime = 0;
  },
  changeHookState(eventType) {
    if (eventType === 'touch') {
      return;
    }
    if (this.hook) {
      this.imageCards[1].src = '/common/images/ic_fork.png';
      this.hook = false;
    } else {
      this.imageCards[1].src = '/common/images/ic_hook.png';
      this.hook = true;
    }
  },
  changeShadow(eventType, shadowFlag) {
    if (eventType === 'click') {
      return;
    }
    if (shadowFlag) {
      this.imageCards[0].classType = 'main-img-touch';
    } else {
      this.imageCards[0].classType = 'img-normal';
    }
  },
  handleStartFrame(type) {
    if (type === 'dial') {
      this.animationCards[0].durationTime = CommonConstants.DURATION_TIME;
      this.$element('dialAnimation').start();
    } else {
      if (this.animationCards[1].flag) {
        this.animationCards[1].frames = this.collapse;
        this.animationCards[1].durationTime = this.durationTimeArray[0];
        this.$element('toggleAnimation').start();
        this.animationCards[1].flag = false;
        this.$element('toggleAnimation').stop();
      } else {
        this.animationCards[1].frames = this.arrow;
        this.animationCards[1].durationTime = this.durationTimeArray[1];
        this.$element('toggleAnimation').start();
        this.animationCards[1].flag = true;
        this.$element('toggleAnimation').stop();
      }
    }
  }
}