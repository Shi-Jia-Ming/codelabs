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

import router from '@ohos.router';
import { CommonConstants } from '../../common/constants/CommonConstants';
import AlarmItem from '../../viewmodel/AlarmItem';
import AlarmListItem from '../Main/AlarmListItem';
import DimensionUtil from '../../common/utils/DimensionUtil';

@Component
export default struct AlarmList {
  @Link alarmItems: Array<AlarmItem>;

  build() {
    List({ space: DimensionUtil.getVp($r('app.float.alarm_list_space')) }) {
      ForEach(this.alarmItems, (item: AlarmItem) => {
        ListItem() {
          AlarmListItem({ alarmItem: item })
        }.onClick(() => {
          router.pushUrl({ url: 'pages/DetailIndex', params: { alarmItem: item } });
        })
      }, (item: AlarmItem) => JSON.stringify(item))
    }
    .padding({
      left: DimensionUtil.getVp($r('app.float.alarm_list_content_distance')),
      right: DimensionUtil.getVp($r('app.float.alarm_list_content_distance'))
    })
    .listDirection(Axis.Vertical)
    .layoutWeight(CommonConstants.DEFAULT_LAYOUT_WEIGHT)
    .margin({ top: DimensionUtil.getVp($r('app.float.alarm_list_content_distance')) })
  }
}