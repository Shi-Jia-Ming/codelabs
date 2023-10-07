/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import common from '@ohos.app.ability.common';
import { CommonConstants, Logger } from '@ohos/common';
import { AchievementDialog } from './AchievementDialog'
import { LearningConstants } from '../constants/LearningConstants';
import { LearningPath } from '../entity/LearningPath';
import { LearningModel } from '../model/LearningModel';

const TAG = '[LearningView]';

@Component
export struct LearningView {
  private eventHub: common.EventHub = (getContext(this) as common.UIAbilityContext).eventHub;
  private changedIndex: boolean = true;
  @Prop @Watch('handlePathLearned') learnedId: string = '';
  @State learningModel: LearningModel = LearningModel.getInstance();
  @State aheadIndex: number = 3;
  @State marginBottom: number = 0;
  @State learningItem: LearningPath | null = null;
  achievementDialog: CustomDialogController = new CustomDialogController({
    builder: AchievementDialog({ learningItem: $learningItem }),
    alignment: DialogAlignment.Center,
    autoCancel: false,
    maskColor: $r('app.color.achieve_dialog_mask_color'),
    customStyle: true
  });

  aboutToAppear() {
    this.learningModel.init();
  }

  handlePathLearned(): void {
    Logger.info(TAG, 'handlePathLearned');
    Logger.info(TAG, `learnedId:${this.learnedId}`);
    if (this.learnedId) {
      this.learningModel.updateLearnedPath(this.learnedId).then(() => {
        Logger.info(TAG, 'show Dialog');
        this.eventHub.emit(CommonConstants.LEARNING_EVENT, this.learnedId);
        this.learningItem = this.learningModel.getLearningMap().get(this.learnedId) as LearningPath;
        this.achievementDialog.open();
      });
    }
  }

  getImgCoefficients(index?: number): number {
    if (index !== undefined) {
      let coefficient = this.aheadIndex - index;
      let tempCoefficient = Math.abs(coefficient);
      if (tempCoefficient <= LearningConstants.HALF_COUNT) {
        return coefficient;
      }
      let dataLength = this.learningModel.list.length;
      let tempOffset = dataLength - tempCoefficient;
      if (tempOffset <= LearningConstants.HALF_COUNT) {
        if (coefficient > 0) {
          return -tempOffset;
        }
        return tempOffset;
      }
    }
    return 0;
  }

  getOffSetY(index?: number): number {
    let offsetIndex = this.getImgCoefficients(index);
    let tempOffset = Math.abs(offsetIndex);
    let offsetY = this.marginBottom / (tempOffset + 1);
    if (tempOffset === 1) {
      offsetY -= offsetIndex * LearningConstants.MAX_OFFSET_Y;
    } else if (tempOffset === LearningConstants.HALF_COUNT) {
      offsetY -= offsetIndex * (LearningConstants.MAX_OFFSET_Y - LearningConstants.OFFSET_COEFFICIENTS);
    }
    return offsetY;
  }

  startAnimation(isUp: boolean): void {
    animateTo({
      duration: LearningConstants.SWIPER_DURATION,
      curve: Curve.EaseInOut
    }, () => {
      let dataLength = this.learningModel.list.length;
      let tempIndex = isUp ? this.aheadIndex + 1 : dataLength + this.aheadIndex - 1;
      this.aheadIndex = tempIndex % dataLength;
      this.marginBottom = 0;
    });
  }

  handlePanGesture(offsetY?: number): void {
    if (!offsetY) {
      return;
    }
    if (Math.abs(offsetY) < LearningConstants.MAX_MOVE_OFFSET) {
      this.marginBottom = offsetY;
      Logger.info(TAG, 'this.marginBottom: ' + this.marginBottom);
    } else {
      if (this.changedIndex) {
        return;
      }
      this.changedIndex = true;
      this.startAnimation(offsetY < 0);
    }
  }

  getGuideImage(item: LearningPath): ResourceStr {
    let learningItem: LearningPath = this.learningModel.getLearningMap().get(item.id) as LearningPath;
    return learningItem.thumbnail || this.learningModel.list[0].thumbnail;
  }

  @Builder
  NaviBar() {
    Row() {
      Text($r('app.string.learning_title'))
        .fontSize($r('app.float.navigation_title_size'))
        .fontWeight(FontWeight.Bold)
        .margin({ left: $r('app.float.navigation_margin') })
    }
    .height($r('app.float.navigation_height'))
    .width(LearningConstants.FULL_PERCENT)
    .justifyContent(FlexAlign.Start)
  }

  build() {
    Column() {
      this.NaviBar();
      Stack() {
        ForEach(this.learningModel.list, (item: LearningPath, index?: number) => {
          Row() {
            Image(this.getGuideImage(item))
              .syncLoad(true)
              .objectFit(ImageFit.Cover)
              .borderRadius($r('app.float.common_border_radius'))
              .shadow({
                radius: LearningConstants.SHADOW_RADIUS,
                color: LearningConstants.SHADOW_COLOR,
                offsetY: LearningConstants.SHADOW_RADIUS / LearningConstants.DOUBLE_NUM
              })
              .opacity(1 - Math.min(LearningConstants.HALF_COUNT, Math.abs((this.getImgCoefficients(index) -
                this.marginBottom / LearningConstants.MAX_MOVE_OFFSET))) * LearningConstants.OPACITY_COEFFICIENTS)
              .blur(LearningConstants.IMAGE_BLUR_REDUCE * Math.abs(this.getImgCoefficients(index) -
                this.marginBottom / LearningConstants.MAX_MOVE_OFFSET))
          }
          .width(index != this.aheadIndex && this.getImgCoefficients(index) === 0 ?
          LearningConstants.SWIPER_DEFAULT_WIDTH :
            `${LearningConstants.ITEM_WIDTH - LearningConstants.OFFSET_COEFFICIENTS *
            Math.abs(this.getImgCoefficients(index) - this.marginBottom / LearningConstants.MAX_MOVE_OFFSET)}%`)
          .aspectRatio(LearningConstants.SWIPER_ASPECT_RATIO)
          .borderRadius($r('app.float.common_border_radius'))
          .offset({ x: 0, y: this.getOffSetY(index) })
          .zIndex(index != this.aheadIndex && this.getImgCoefficients(index) === 0 ? 0 :
            LearningConstants.HALF_COUNT - Math.abs(this.getImgCoefficients(index)))
        }, (item: LearningPath) => item.id)
      }
      .layoutWeight(1)
      .alignContent(Alignment.Center)
      .onClick(() => {
        let bundleName = (getContext(this) as common.UIAbilityContext).applicationInfo.name;
        router.pushUrl({
          url: `@bundle:${bundleName}/learning/ets/pages/LearningDetailPage`,
          params: { learningItem: this.learningModel.list[this.aheadIndex] }
        });
      })
      .gesture(
        PanGesture({ direction: PanDirection.Vertical, distance: 1 })
          .onActionStart((event?: GestureEvent) => {
            this.changedIndex = false;
            this.handlePanGesture(event?.offsetY);
          })
          .onActionUpdate((event?: GestureEvent) => {
            this.handlePanGesture(event?.offsetY);
          })
          .onActionEnd(() => {
            animateTo({
              duration: LearningConstants.SWIPER_DURATION,
            }, () => {
              this.marginBottom = 0;
            });
          })
      )
    }
    .width(LearningConstants.FULL_PERCENT)
    .height(LearningConstants.FULL_PERCENT)
    .padding({ top: AppStorage.get<number>('statusBarHeight') })
    .backgroundColor($r('app.color.common_background_color'))
  }
}

