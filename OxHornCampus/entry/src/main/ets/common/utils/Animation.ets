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
import router from '@ohos.router';
import { CommonConstants } from '../constants/CommonConstants';

export class Animation {
  /**
   * Get the title icon accord to the offset sum.
   *
   * @param this
   */
  public static changeTitleIcon(this) {
    let imageHeightVP = (this.screenHeight * this.imageHeight) / CommonConstants.FULL_PERCENT_NUMBER;
    let firstStarLine = imageHeightVP + CommonConstants.SECOND_LIST_ITEM_HEIGHT +
      CommonConstants.FIXED_ITEM_HEIGHT - CommonConstants.STAR_ICON_MARGIN;
    let secondStarLine = firstStarLine + CommonConstants.FIXED_ITEM_HEIGHT;
    let thirdStarLine = secondStarLine + CommonConstants.FIXED_ITEM_HEIGHT;
    this.offsetSum = this.scrollerForList.currentOffset().yOffset;

    // Set the listPosition.
    if (this.offsetSum > CommonConstants.OFFSET_SUM_THRESHOLD) {
      this.listPosition = CommonConstants.LIST_POSITION_MIDDLE;
    }

    if (this.offsetSum > firstStarLine + CommonConstants.FIXED_ITEM_HEIGHT / 2) {
      this.geographicPicType = CommonConstants.GEOGRAPHY_LIGHT;
    }

    if (this.offsetSum <= firstStarLine + CommonConstants.FIXED_ITEM_HEIGHT / 2) {
      this.geographicPicType = CommonConstants.GEOGRAPHY_DARK;
    }
    // Change icons opacity by the sum of offset.
    if (this.currentListIndex === 2 && this.offsetSum <= firstStarLine) {
      this.iconTitle = CommonConstants.ICON_SUBTITLE_ARRAY[0];
      this.scaleIcon = [CommonConstants.OPACITY_MAX, CommonConstants.OPACITY_MIN, CommonConstants.OPACITY_MIN];
    }
    if (this.currentListIndex === 2 && this.offsetSum > firstStarLine && this.offsetSum < secondStarLine) {
      this.iconTitle = CommonConstants.ICON_SUBTITLE_ARRAY[1];
      this.scaleIcon = [CommonConstants.OPACITY_MIN, CommonConstants.OPACITY_MAX, CommonConstants.OPACITY_MIN];
    }
    if (this.currentListIndex === 2 && this.offsetSum >= secondStarLine && this.offsetSum < thirdStarLine) {
      this.iconTitle = CommonConstants.ICON_SUBTITLE_ARRAY[2];
      this.scaleIcon = [CommonConstants.OPACITY_MIN, CommonConstants.OPACITY_MIN, CommonConstants.OPACITY_MAX];
    }
  }

  /**
   * Control the image scale.
   *
   * @param this
   * @param offset
   * @param state
   * @returns real list offset.
   */
  public static controlImageScale(this, offset: number, state: ScrollState): number {
    if (offset > 0 && this.imageHeight > CommonConstants.MIN_IMAGE_HEIGHT) {
      // Scale down the image by offset.
      let offsetHeight = (Math.abs(offset) * CommonConstants.FULL_PERCENT_NUMBER) / Number(this.screenHeight);
      let heightOffset = this.imageHeight - CommonConstants.MIN_IMAGE_HEIGHT > offsetHeight ?
        offsetHeight : this.imageHeight - CommonConstants.MIN_IMAGE_HEIGHT;
      this.imageHeight = this.imageHeight - heightOffset;
      this.arrowIconOpacity = this.arrowIconOpacity -
        heightOffset / (CommonConstants.FULL_PERCENT_NUMBER - CommonConstants.MIN_IMAGE_HEIGHT);
      return 0;
    }
    if (this.listPosition == CommonConstants.LIST_POSITION_BEGIN && offset < 0
      && this.imageHeight < CommonConstants.FULL_PERCENT_NUMBER) {
      // // Scale up the image by offset.
      let offsetHeight = (Math.abs(offset) * CommonConstants.FULL_PERCENT_NUMBER) / Number(this.screenHeight);
      let heightOffset = CommonConstants.FULL_PERCENT_NUMBER - this.imageHeight > offsetHeight ?
        offsetHeight : CommonConstants.FULL_PERCENT_NUMBER - this.imageHeight;
      this.imageHeight = this.imageHeight + heightOffset;
      this.arrowIconOpacity = this.arrowIconOpacity +
        heightOffset / (CommonConstants.FULL_PERCENT_NUMBER - CommonConstants.MIN_IMAGE_HEIGHT);
      return 0;
    }
    if (state === ScrollState.Scroll && offset < CommonConstants.LIST_SCROLL_DOWN_THRESHOLD
      && this.imageHeight === CommonConstants.FULL_PERCENT_NUMBER) {
      return 0;
    }
    return offset;
  }
}