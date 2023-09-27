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
import { CommodityOrderList } from './CommodityOrderList';
import { AddressInfo } from './AddressInfo';
import { HeaderBar } from './HeaderBar';
import { OrderDetailConstants } from '../constants/OrderDetailConstants';
import {
  LocalDataManager,
  formatDate,
  Order,
  OrderOperationStatus,
  StyleConstants,
  GridConstants
} from '@ohos/common';
import { updateOrderProps } from '@ohos/common/src/main/ets/bean/OrderModel';

@Component
export struct PayOrder {
  @StorageProp('currentBreakpoint') currentBreakpoint: string = 'sm';
  @Consume('orderList') data: Order[];
  @Link totalPrice: number;
  private localDataManager: LocalDataManager = LocalDataManager.instance();

  @Builder OrderStatus() {
    Row() {
      Column() {
        Text(OrderDetailConstants.STATUS_ENUM[this.data[0].status !== undefined?this.data[0].status:0])
          .fontSize($r('app.float.big_font_size'))
          .margin({ bottom: $r('app.float.vp_two') })
          .fontColor(Color.White)
        Text(OrderDetailConstants.STATUS_DESC_ENUM[this.data[0]?.status !== undefined?this.data[0]?.status:0])
          .fontSize($r('app.float.smaller_font_size'))
          .opacity(StyleConstants.SIXTY_OPACITY)
          .margin({ bottom: $r('app.float.vp_two') })
          .fontColor(Color.White)
        Text(this.data[0].createTime !== undefined ?
          formatDate(new Date(this.data[0].createTime).valueOf(), OrderDetailConstants.DATE_FORMAT) : '')
          .fontSize($r('app.float.smaller_font_size'))
          .opacity(StyleConstants.SIXTY_OPACITY)
          .fontColor(Color.White)
      }
      .alignItems(HorizontalAlign.Start)

      Blank()
      Image($r("app.media.ic_pay_bag"))
        .width($r('app.float.pay_image_width'))
        .height($r('app.float.pay_image_height'))
        .margin({ right: $r('app.float.vp_twenty') })
      Image($r('app.media.ic_arrow_right'))
        .width($r('app.float.vp_twelve'))
        .height($r('app.float.vp_twenty_four'))
    }
    .padding($r('app.float.vp_twelve'))
    .width(StyleConstants.FULL_WIDTH)
  }

  @Builder CostInfo() {
    Column() {
      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        Text($r('app.string.product_price'))
          .fontSize($r('app.float.small_font_size'))
        Text($r('app.string.commodity_piece', this.totalPrice))
          .textAlign(TextAlign.End)
          .fontSize($r('app.float.small_font_size'))
      }
      .margin({ bottom: $r('app.float.vp_eight') })

      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        Text($r('app.string.fee_price'))
          .fontSize($r('app.float.small_font_size'))
        Text($r('app.string.money', OrderDetailConstants.FEE_PRICE))
          .textAlign(TextAlign.End)
          .fontSize($r('app.float.small_font_size'))
      }
      .margin({ bottom: $r('app.float.vp_eight') })

      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        Text($r('app.string.order_money'))
          .fontSize($r('app.float.small_font_size'))
        Text($r('app.string.commodity_piece', this.totalPrice))
          .textAlign(TextAlign.End)
          .fontSize($r('app.float.small_font_size'))
      }
    }
    .backgroundColor(Color.White)
    .borderRadius($r('app.float.vp_sixteen'))
    .margin({ bottom: $r('app.float.vp_twelve') })
    .padding($r('app.float.vp_sixteen'))
  }

  @Builder BottomBar() {
    Flex({
      alignItems: ItemAlign.Center
    }) {
      if (this.data[0].status === OrderOperationStatus.UN_PAY) {
        Button($r('app.string.btn_pay'))
          .backgroundColor($r('app.color.focus_color'))
          .height($r('app.float.button_height'))
          .width(StyleConstants.FULL_WIDTH)
          .onClick(() => {
            this.data.forEach((item: Order) => {
              if (item.orderId !== undefined) {
                let UpdateOrderParameter: updateOrderProps = {
                  orderId: item.orderId,
                  status: OrderOperationStatus.DELIVERED
                }
                this.localDataManager.updateOrder(UpdateOrderParameter);
              }
            })
            promptAction.showToast({
              message: $r('app.string.info_success', OrderDetailConstants.PAYMENT_ENUM[OrderOperationStatus.UN_PAY])
            });
            router.back();
          })
      } else if (this.data[0].status === OrderOperationStatus.DELIVERED) {
        Button($r('app.string.confirm_harvest'))
          .height($r('app.float.button_height'))
          .width(StyleConstants.FULL_WIDTH)
          .backgroundColor($r('app.color.focus_color'))
          .onClick(() => {
            if (this.data[0].orderId !== undefined) {
              let UpdateOrderParameter: updateOrderProps = {
                orderId: this.data[0].orderId,
                status: OrderOperationStatus.RECEIPT
              }
              this.localDataManager.updateOrder(UpdateOrderParameter);
              promptAction.showToast({
                message: $r('app.string.info_success', OrderDetailConstants.PAYMENT_ENUM[OrderOperationStatus.DELIVERED])
              });
              router.back();
            }
          })
      } else {
        Row()
      }
    }
    .height($r('app.float.vp_fifty_six'))
  }

  build() {
    Flex({ direction: FlexDirection.Column }) {
      HeaderBar({
        title: $r('app.string.my_order'),
        onBack: () => router.back()
      })
      Stack({ alignContent: Alignment.TopStart }) {
        Image($r("app.media.ic_order_bg"))
          .width(StyleConstants.FULL_WIDTH)
          .height($r('app.float.background_image_height'))
          .objectFit(ImageFit.Auto)
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
                  this.OrderStatus()
                  AddressInfo()
                  CommodityOrderList()
                  this.CostInfo()
                }
              }
            }
          }
          .scrollBar(BarState.Off)
        }
        .padding({ left: $r('app.float.vp_twelve'), right: $r('app.float.vp_twelve') })
      }
      .flexGrow(StyleConstants.FLEX_GROW)

      GridRow({
        columns: {
          sm: GridConstants.COLUMN_FOUR,
          md: GridConstants.COLUMN_EIGHT,
          lg: GridConstants.COLUMN_TWELVE
        }
      }) {
        GridCol({
          span: {
            sm: GridConstants.SPAN_TWO,
            md: GridConstants.SPAN_TWO,
            lg: GridConstants.SPAN_TWO
          },
          offset: {
            sm: GridConstants.OFFSET_TWO,
            md: GridConstants.OFFSET_SIX,
            lg: GridConstants.OFFSET_EIGHT
          }
        }) {
          this.BottomBar()
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
    .height(StyleConstants.FULL_HEIGHT)
    .backgroundColor($r('app.color.page_background'))
  }
}