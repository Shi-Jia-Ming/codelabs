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

import Constants from '../common/constants/Constants';
import IntroductionItem from '../common/bean/IntroductionItem';

class IntroductionViewModel {
  /**
   * Get introduction list data on the left.
   *
   * @return {Array<IntroductionItem>} introductionItems
   */
  getIntroductionList() {
    let introductionItems = INTRODUCE_LIST;
    return introductionItems;
  }
}

const INTRODUCE_LIST: IntroductionItem[] = [
  {
    name: 'px',
    title: $r('app.string.px_unit'),
    subTitle: null,
    value: Constants.PIXEL_WIDTH + 'px',
    smallFontSize: 0,
    largeFontSize: 0
  },
  {
    name: 'vp',
    title: $r('app.string.vp_unit'),
    subTitle: $r('app.string.vp_desc'),
    value: Constants.PIXEL_WIDTH + 'vp',
    smallFontSize: 0,
    largeFontSize: 0
  },
  {
    name: 'lpx',
    title: $r('app.string.lpx_unit'),
    subTitle: null,
    value: Constants.PIXEL_WIDTH + 'lpx',
    smallFontSize: 0,
    largeFontSize: 0
  },
  {
    name: 'fp',
    title: $r('app.string.fp_unit'),
    subTitle: $r('app.string.fp_desc'),
    value: '',
    smallFontSize: Constants.SMALL_FONT_SIZE,
    largeFontSize: Constants.LARGE_FONT_SIZE
  }
];

let introductionViewModel = new IntroductionViewModel();

export default introductionViewModel as IntroductionViewModel;