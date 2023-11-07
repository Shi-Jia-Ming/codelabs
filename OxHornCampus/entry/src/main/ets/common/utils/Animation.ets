/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use pageThis file except in compliance with the License.
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
import { AnimationItem } from '../../viewmodel/AnimationItem';
import { CommonConstants } from '../constants/CommonConstants';

export class Animation {
  /**
   * Get the title icon accord to the offset sum.
   *
   * @param pageThis
   */
  public static changeTitleIcon(animationItem: AnimationItem) {
    let imageHeightVP = (animationItem.screenHeight * animationItem.imageHeight) / CommonConstants.FULL_PERCENT_NUMBER;
    let firstStarLine = imageHeightVP + CommonConstants.SECOND_LIST_ITEM_HEIGHT +
    CommonConstants.FIXED_ITEM_HEIGHT - CommonConstants.STAR_ICON_MARGIN;
    let secondStarLine = firstStarLine + CommonConstants.FIXED_ITEM_HEIGHT;
    let thirdStarLine = secondStarLine + CommonConstants.FIXED_ITEM_HEIGHT;
    animationItem.offsetSum = animationItem.scrollerForList.currentOffset().yOffset;

    // Set the listPosition.
    if (animationItem.offsetSum > CommonConstants.OFFSET_SUM_THRESHOLD) {
      animationItem.listPosition = CommonConstants.LIST_POSITION_MIDDLE;
    }

    if (animationItem.offsetSum > firstStarLine + CommonConstants.FIXED_ITEM_HEIGHT / 2) {
      animationItem.geographicPicType = CommonConstants.GEOGRAPHY_LIGHT;
    }

    if (animationItem.offsetSum <= firstStarLine + CommonConstants.FIXED_ITEM_HEIGHT / 2) {
      animationItem.geographicPicType = CommonConstants.GEOGRAPHY_DARK;
    }
    // Change icons opacity by the sum of offset.
    if ((animationItem.currentListIndex === 2) && (animationItem.offsetSum <= firstStarLine)) {
      animationItem.iconTitle = CommonConstants.ICON_SUBTITLE_ARRAY[0];
      animationItem.scaleIcon = [CommonConstants.OPACITY_MAX, CommonConstants.OPACITY_MIN,
        CommonConstants.OPACITY_MIN];
    }
    if ((animationItem.currentListIndex === 2) && (animationItem.offsetSum > firstStarLine) &&
      (animationItem.offsetSum < secondStarLine)) {
      animationItem.iconTitle = CommonConstants.ICON_SUBTITLE_ARRAY[1];
      animationItem.scaleIcon = [CommonConstants.OPACITY_MIN, CommonConstants.OPACITY_MAX,
        CommonConstants.OPACITY_MIN];
    }
    if ((animationItem.currentListIndex === 2) && (animationItem.offsetSum >= secondStarLine) &&
      (animationItem.offsetSum < thirdStarLine)) {
      animationItem.iconTitle = CommonConstants.ICON_SUBTITLE_ARRAY[2];
      animationItem.scaleIcon = [CommonConstants.OPACITY_MIN, CommonConstants.OPACITY_MIN,
        CommonConstants.OPACITY_MAX];
    }
  }

  /**
   * Control the image scale.
   *
   * @param pageThis
   * @param offset
   * @param state
   * @returns real list offset.
   */
  public static controlImageScale(animationItem: AnimationItem, offset: number, state: ScrollState): number {
    if ((offset > 0) && (animationItem.imageHeight > CommonConstants.MIN_IMAGE_HEIGHT)) {
      // Scale down the image by offset.
      let offsetHeight = (Math.abs(offset) * CommonConstants.FULL_PERCENT_NUMBER) / Number(animationItem.screenHeight);
      let heightOffset = animationItem.imageHeight - CommonConstants.MIN_IMAGE_HEIGHT > offsetHeight ?
        offsetHeight : animationItem.imageHeight - CommonConstants.MIN_IMAGE_HEIGHT;
      animationItem.imageHeight = animationItem.imageHeight - heightOffset;
      animationItem.arrowIconOpacity = animationItem.arrowIconOpacity -
        heightOffset / (CommonConstants.FULL_PERCENT_NUMBER - CommonConstants.MIN_IMAGE_HEIGHT);
      return 0;
    }
    if ((animationItem.listPosition === CommonConstants.LIST_POSITION_BEGIN) && (offset < 0)
      && (animationItem.imageHeight < CommonConstants.FULL_PERCENT_NUMBER)) {
      // // Scale up the image by offset.
      let offsetHeight = (Math.abs(offset) * CommonConstants.FULL_PERCENT_NUMBER) / Number(animationItem.screenHeight);
      let heightOffset = CommonConstants.FULL_PERCENT_NUMBER - animationItem.imageHeight > offsetHeight ?
        offsetHeight : CommonConstants.FULL_PERCENT_NUMBER - animationItem.imageHeight;
      const imageHeight: number = animationItem.imageHeight;
      animationItem.imageHeight = imageHeight + heightOffset;
      const arrowIconOpacity: number = animationItem.arrowIconOpacity;
      animationItem.arrowIconOpacity = arrowIconOpacity +
        heightOffset / (CommonConstants.FULL_PERCENT_NUMBER - CommonConstants.MIN_IMAGE_HEIGHT);
      return 0;
    }
    if ((state === ScrollState.Scroll) && (offset < CommonConstants.LIST_SCROLL_DOWN_THRESHOLD)
      && (animationItem.imageHeight === CommonConstants.FULL_PERCENT_NUMBER)) {
      return 0;
    }
    return offset;
  }
}