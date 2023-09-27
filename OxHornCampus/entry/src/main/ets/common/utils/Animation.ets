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
import { CommonConstants } from '../constants/CommonConstants';

export class Animation {
  /**
   * Get the title icon accord to the offset sum.
   *
   * @param pageThis
   */
  public static changeTitleIcon(pageThis) {
    let imageHeightVP = (pageThis.screenHeight * pageThis.imageHeight) / CommonConstants.FULL_PERCENT_NUMBER;
    let firstStarLine = imageHeightVP + CommonConstants.SECOND_LIST_ITEM_HEIGHT +
    CommonConstants.FIXED_ITEM_HEIGHT - CommonConstants.STAR_ICON_MARGIN;
    let secondStarLine = firstStarLine + CommonConstants.FIXED_ITEM_HEIGHT;
    let thirdStarLine = secondStarLine + CommonConstants.FIXED_ITEM_HEIGHT;
    pageThis.offsetSum = pageThis.scrollerForList.currentOffset().yOffset;

    // Set the listPosition.
    if (pageThis.offsetSum > CommonConstants.OFFSET_SUM_THRESHOLD) {
      pageThis.listPosition = CommonConstants.LIST_POSITION_MIDDLE;
    }

    if (pageThis.offsetSum > firstStarLine + CommonConstants.FIXED_ITEM_HEIGHT / 2) {
      pageThis.geographicPicType = CommonConstants.GEOGRAPHY_LIGHT;
    }

    if (pageThis.offsetSum <= firstStarLine + CommonConstants.FIXED_ITEM_HEIGHT / 2) {
      pageThis.geographicPicType = CommonConstants.GEOGRAPHY_DARK;
    }
    // Change icons opacity by the sum of offset.
    if ((pageThis.currentListIndex === 2) && (pageThis.offsetSum <= firstStarLine)) {
      pageThis.iconTitle = CommonConstants.ICON_SUBTITLE_ARRAY[0];
      pageThis.scaleIcon = [CommonConstants.OPACITY_MAX, CommonConstants.OPACITY_MIN, CommonConstants.OPACITY_MIN];
    }
    if ((pageThis.currentListIndex === 2) && (pageThis.offsetSum > firstStarLine) && (pageThis.offsetSum < secondStarLine)) {
      pageThis.iconTitle = CommonConstants.ICON_SUBTITLE_ARRAY[1];
      pageThis.scaleIcon = [CommonConstants.OPACITY_MIN, CommonConstants.OPACITY_MAX, CommonConstants.OPACITY_MIN];
    }
    if ((pageThis.currentListIndex === 2) && (pageThis.offsetSum >= secondStarLine) && (pageThis.offsetSum < thirdStarLine)) {
      pageThis.iconTitle = CommonConstants.ICON_SUBTITLE_ARRAY[2];
      pageThis.scaleIcon = [CommonConstants.OPACITY_MIN, CommonConstants.OPACITY_MIN, CommonConstants.OPACITY_MAX];
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
  public static controlImageScale(pageThis, offset: number, state: ScrollState): number {
    if ((offset > 0) && (pageThis.imageHeight > CommonConstants.MIN_IMAGE_HEIGHT)) {
      // Scale down the image by offset.
      let offsetHeight = (Math.abs(offset) * CommonConstants.FULL_PERCENT_NUMBER) / Number(pageThis.screenHeight);
      let heightOffset = pageThis.imageHeight - CommonConstants.MIN_IMAGE_HEIGHT > offsetHeight ?
        offsetHeight : pageThis.imageHeight - CommonConstants.MIN_IMAGE_HEIGHT;
      pageThis.imageHeight = pageThis.imageHeight - heightOffset;
      pageThis.arrowIconOpacity = pageThis.arrowIconOpacity -
        heightOffset / (CommonConstants.FULL_PERCENT_NUMBER - CommonConstants.MIN_IMAGE_HEIGHT);
      return 0;
    }
    if ((pageThis.listPosition === CommonConstants.LIST_POSITION_BEGIN) && (offset < 0)
      && (pageThis.imageHeight < CommonConstants.FULL_PERCENT_NUMBER)) {
      // // Scale up the image by offset.
      let offsetHeight = (Math.abs(offset) * CommonConstants.FULL_PERCENT_NUMBER) / Number(pageThis.screenHeight);
      let heightOffset = CommonConstants.FULL_PERCENT_NUMBER - pageThis.imageHeight > offsetHeight ?
        offsetHeight : CommonConstants.FULL_PERCENT_NUMBER - pageThis.imageHeight;
      const imageHeight: number = pageThis.imageHeight;
      pageThis.imageHeight = imageHeight + heightOffset;
      const arrowIconOpacity: number = pageThis.arrowIconOpacity;
      pageThis.arrowIconOpacity = arrowIconOpacity +
        heightOffset / (CommonConstants.FULL_PERCENT_NUMBER - CommonConstants.MIN_IMAGE_HEIGHT);
      return 0;
    }
    if ((state === ScrollState.Scroll) && (offset < CommonConstants.LIST_SCROLL_DOWN_THRESHOLD)
      && (pageThis.imageHeight === CommonConstants.FULL_PERCENT_NUMBER)) {
      return 0;
    }
    return offset;
  }
}