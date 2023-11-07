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

import { DetailConstant } from '../../common/constants/DetailConstant';
import { CommonConstants } from '../../common/constants/CommonConstants';
import DimensionUtil from '../../common/utils/DimensionUtil';
import DayDataItem from '../../viewmodel/DayDataItem';

@Component
export default struct DatePickArea {
  build() {
    Stack({ alignContent: Alignment.Center }) {
      Row() {
        ForEach(DetailConstant.DAY_DATA, (item: DayDataItem) => {
          TextPicker({ range: item.data, selected: item.delSelect })
            .layoutWeight(CommonConstants.DEFAULT_LAYOUT_WEIGHT)
            .backgroundColor($r('app.color.grey_light'))
            .onChange((value: string, index: number) => {
              item.delSelect = index;
            })
        }, (item: DayDataItem) => JSON.stringify(item))
      }
    }
    .height(DimensionUtil.getVp($r('app.float.date_picker_height')))
    .padding({
      left: DimensionUtil.getVp($r('app.float.date_picker_padding_horizon')),
      right: DimensionUtil.getVp($r('app.float.date_picker_padding_horizon'))
    })
  }
}