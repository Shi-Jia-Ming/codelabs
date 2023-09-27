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

import promptAction from '@ohos.promptAction';
import router from '@ohos.router';
import { AddressInfo } from './AddressInfo';
import { HeaderBar } from '../components/HeaderBar';
import { OrderDetailConstants } from '../constants/OrderDetailConstants';
import { CommodityOrderList } from './CommodityOrderList';
import { LocalDataManager, Order, OrderOperationStatus, GridConstants, StyleConstants } from '@ohos/common';
import { InsertOrderProps } from '@ohos/common/src/main/ets/bean/OrderModel';

@Component
export struct ConfirmOrder {
  @Consume('orderList') orderList: Order[];
  @Consume('amount') amount: number;
  private orderIds: string[] = [];
  private localDataManager: LocalDataManager = LocalDataManager.instance();

  /**
   * Confirm order to request server.
   */
  confirmOrder(status: number) {
    this.orderList.map((item: Order) => {
      let orderStatus: InsertOrderProps = {
        order: item,
        status: status
      };
      let orderId: string | undefined = this.localDataManager.insertOrder(orderStatus);
      if (orderId !== undefined) {
        this.localDataManager.deleteShopCart([orderId]);
        this.orderIds.push(orderId);
      }
    })
  }

  handleConfirmOrder() {
    try {
      this.confirmOrder(OrderOperationStatus.UN_PAY);
      promptAction.showToast({ message: $r('app.string.order_commit_success') });
      router.replaceUrl({
        url: OrderDetailConstants.PAY_ORDER_PAGE_URL,
        params: { orderIds: this.orderIds }
      });
    } catch (err) {
      promptAction.showToast({ message: $r('app.string.order_commit_fail', err) });
    }
  }

  build() {
    Flex({ direction: FlexDirection.Column }) {
      HeaderBar({
        title: $r('app.string.header_bar_title'),
        onBack: () => router.back()
      })
      Column() {
        Scroll() {
          GridRow({
            columns: {
              sm: GridConstants.COLUMN_FOUR,
              md: GridConstants.COLUMN_EIGHT,
              lg: GridConstants.COLUMN_TWELVE
            }
          }) {
            GridCol({
              span: {
                sm: GridConstants.SPAN_FOUR,
                md: GridConstants.SPAN_EIGHT,
                lg: GridConstants.SPAN_EIGHT
              },
              offset: { lg: GridConstants.OFFSET_TWO }
            }) {
              Column() {
                AddressInfo()
                CommodityOrderList()
              }
            }
          }
        }
        .scrollBar(BarState.Off)
      }
      .flexGrow(StyleConstants.FLEX_GROW)
      .padding({ left: $r('app.float.vp_twelve'), right: $r('app.float.vp_twelve') })

      GridRow({
        columns: {
          sm: GridConstants.COLUMN_FOUR,
          md: GridConstants.COLUMN_EIGHT,
          lg: GridConstants.COLUMN_TWELVE
        },
        gutter: GridConstants.GUTTER_TWELVE
      }) {
        GridCol({
          span: {
            sm: GridConstants.SPAN_TWO,
            md: GridConstants.SPAN_TWO,
            lg: GridConstants.SPAN_TWO
          },
          offset: { lg: GridConstants.OFFSET_TWO }
        }) {
          Text($r('app.string.bottom_bar_amount', this.amount))
            .fontSize($r('app.float.huge_font_size'))
            .margin({ right: $r('app.float.vp_twelve') })
            .fontColor($r('app.color.focus_color'))
            .textAlign(TextAlign.Start)
            .width(StyleConstants.FULL_WIDTH)
            .height($r('app.float.vp_fifty_six'))
        }

        GridCol({
          span: {
            sm: GridConstants.SPAN_TWO,
            md: GridConstants.SPAN_THREE,
            lg: GridConstants.SPAN_THREE
          },
          offset: {
            md: GridConstants.OFFSET_THREE,
            lg: GridConstants.OFFSET_THREE
          }
        }) {
          Button($r('app.string.bottom_bar_button'))
            .backgroundColor($r('app.color.focus_color'))
            .height($r('app.float.confirm_button_height'))
            .width(StyleConstants.FULL_WIDTH)
            .margin({ top: $r('app.float.vp_eight') })
            .onClick((): void => this.handleConfirmOrder())
        }
      }
      .padding({
        left: $r('app.float.vp_twelve'),
        right: $r('app.float.vp_twelve')
      })
      .border({
        color: $r("app.color.five_alpha_black"),
        width: { top: $r('app.float.vp_one') }
      })
    }
    .backgroundColor($r('app.color.page_background'))
    .height(StyleConstants.FULL_HEIGHT)
    .width(StyleConstants.FULL_WIDTH)
  }
}