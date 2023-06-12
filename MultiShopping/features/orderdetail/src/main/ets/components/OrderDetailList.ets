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
import { HeaderBar } from './HeaderBar';
import { OrderListContent } from './OrderListContent';
import { OrderDetailConstants } from '../constants/OrderDetailConstants'
import { EmptyComponent, OrderOperationStatus, StyleConstants, BreakpointConstants } from '@ohos/common';

@Component
export struct OrderDetailList {
  @StorageProp('currentBreakpoint') currentBreakpoint: string = 'sm';
  @Consume currentTabIndex: number;

  @Builder OrderTabs() {
    Column() {
      Tabs({
        barPosition: BarPosition.Start,
        index: this.currentTabIndex
      }) {
        TabContent() {
          OrderListContent({
            status: OrderOperationStatus.ALLStatus,
          })
        }
        .tabBar(this.tabBar($r('app.string.all_orders'), OrderDetailConstants.ALL_INDEX))

        TabContent() {
          OrderListContent({
            status: OrderOperationStatus.UN_PAY,
          })
        }
        .tabBar(this.tabBar($r('app.string.pending_payment'), OrderDetailConstants.PENDING_PAYMENT_INDEX))

        TabContent() {
          Column() {
            EmptyComponent()
          }
          .width(StyleConstants.FULL_WIDTH)
          .height(StyleConstants.FULL_HEIGHT)
        }
        .tabBar(this.tabBar($r('app.string.waiting_shipment'), OrderDetailConstants.WAITING_SHIPMENT_INDEX))

        TabContent() {
          OrderListContent({
            status: OrderOperationStatus.DELIVERED,
          })
        }
        .tabBar(this.tabBar($r('app.string.to_be_received'), OrderDetailConstants.WAITING_RECEIVED_INDEX))

        TabContent() {
          OrderListContent({
            status: OrderOperationStatus.RECEIPT,
          })
        }
        .tabBar(this.tabBar($r('app.string.to_be_evaluated'), OrderDetailConstants.WAITING_EVALUATE_INDEX))
      }
      .barHeight($r('app.float.order_tab_bar_height'))
      .barWidth(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ?
        StyleConstants.SIXTY_WIDTH : StyleConstants.FULL_WIDTH)
      .barMode(BarMode.Fixed)
      .margin({
        top: $r('app.float.vp_eight'), bottom: $r('app.float.vp_eight')
      })
      .onChange((index: number) => {
        this.currentTabIndex = index;
      })
    }
    .height(StyleConstants.FULL_HEIGHT)
    .width(StyleConstants.FULL_WIDTH)
  }

  @Builder tabBar(text: string | Resource, index: number) {
    Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Text(text)
        .fontSize($r('app.float.middle_font_size'))
        .textAlign(TextAlign.Center)
        .fontColor(this.currentTabIndex === index ? $r('app.color.focus_color') : $r("app.color.sixty_alpha_black"))
        .fontWeight(this.currentTabIndex === index ? StyleConstants.FONT_WEIGHT_FIVE : StyleConstants.FONT_WEIGHT_FOUR)
        .border({
          color: $r('app.color.focus_color'),
          width: { bottom: this.currentTabIndex === index ? $r('app.float.vp_two') : $r('app.float.border_width') }
        })
        .height($r('app.float.order_tab_height'))
    }
    .width(StyleConstants.FULL_WIDTH)
  }

  build() {
    Flex({ direction: FlexDirection.Column }) {
      HeaderBar({ title: $r('app.string.my_order'), onBack: () => {
        router.back();
      } })
      this.OrderTabs()
    }
    .backgroundColor($r('app.color.page_background'))
  }
}