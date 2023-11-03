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

import ProductBean from '../viewmodel/ProductBean';
import { WaterFlowDataSource } from '../viewmodel/WaterFlowDataSource';
import { CommonConstants as Const } from '../common/constants/CommonConstants';
import { waterFlowData } from '../viewmodel/HomeViewModel';
import FlowItemComponent from '../view/FlowItemComponent';

/**
 * Water flow component.
 *
 * Usage: Directly reference WaterFlowComponent().
 */
@Component
export default struct WaterFlowComponent {
  private datasource: WaterFlowDataSource = new WaterFlowDataSource();

  aboutToAppear() {
    this.datasource.setDataArray(waterFlowData);
  }

  build() {
    WaterFlow({ footer: (): void => this.itemFoot() }) {
      LazyForEach(this.datasource, (item: ProductBean) => {
        FlowItem() {
          FlowItemComponent({ item: item })
        }
      }, (item: ProductBean) => JSON.stringify(item))
    }
    .layoutWeight(Const.WATER_FLOW_LAYOUT_WEIGHT)
    .layoutDirection(FlexDirection.Column)
    .columnsTemplate(Const.WATER_FLOW_COLUMNS_TEMPLATE)
    .columnsGap($r('app.float.water_flow_columns_gap'))
    .rowsGap($r('app.float.water_flow_row_gap'))
  }

  @Builder
  itemFoot() {
    Column() {
      Text($r('app.string.footer_text'))
        .fontColor(Color.Gray)
        .fontSize($r('app.float.footer_text_size'))
        .width(Const.FULL_WIDTH)
        .height($r('app.float.footer_text_height'))
        .textAlign(TextAlign.Center)
    }
  }
}