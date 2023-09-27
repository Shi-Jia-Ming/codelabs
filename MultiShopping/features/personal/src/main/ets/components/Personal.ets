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
import { Logger, OrderType, StyleConstants, BreakpointConstants } from '@ohos/common';
import { orderButton, memberButton, activityButton, liveData } from '../viewmodel/PersonalData';
import { IconButton } from '../components/IconButton';
import { LiveList } from '../components/LiveList';
import { PersonalConstants } from '../constants/PersonalConstants';
import { IconButtonModel, OrderCount } from '../bean/IconButtonModel';

@Component
export struct Personal {
  @StorageProp('currentBreakpoint') currentBreakpoint: string = 'md';
  @Link @Watch('onOrderCountChange') orderCount: OrderCount;
  @State orderIconButton: IconButtonModel[] = orderButton;

  aboutToAppear() {
    this.onOrderCountChange();
  }

  onOrderCountChange() {
    this.orderIconButton.forEach((item: IconButtonModel) => {
      if (item.key !== undefined) {
        switch (item.key) {
          case OrderType.PAYMENT:
            item.count = this.orderCount.payment;
            break;
          case OrderType.SHIP:
            item.count = this.orderCount.ship;
            break;
          case OrderType.RECEIPT:
            item.count = this.orderCount.receipt;
            break;
          case OrderType.EVALUATION:
            item.count = this.orderCount.evaluation;
            break;
          case OrderType.SALE:
            item.count = this.orderCount.sale;
            break;
          default:
            break;
        }
      }
    })
  }

  onOrderButtonClick(key: OrderType) {
    let tabIndex: number = 0;
    switch (key) {
      case OrderType.PAYMENT:
        tabIndex = PersonalConstants.PENDING_PAYMENT_INDEX;
        break;
      case OrderType.SHIP:
        tabIndex = PersonalConstants.WAITING_SHIPMENT_INDEX;
        break;
      case OrderType.RECEIPT:
        tabIndex = PersonalConstants.WAITING_RECEIVED_INDEX;
        break;
      case OrderType.EVALUATION:
        tabIndex = PersonalConstants.WAITING_EVALUATE_INDEX;
        break;
      default:
        break;
    }
    router.pushUrl({
      url: PersonalConstants.ORDER_LIST_PAGE_URL,
      params: { tabIndex: tabIndex }
    }).catch((err: Error) => {
      Logger.error(JSON.stringify(err));
    });
  }

  @Styles
  cardStyle(){
    .width(StyleConstants.FULL_WIDTH)
    .backgroundColor(Color.White)
    .borderRadius($r('app.float.vp_sixteen'))
    .margin({ bottom: $r('app.float.vp_twelve') })
  }

  @Builder
  Avatar() {
    Column() {
      Row() {
        Image($r('app.media.ic_person'))
          .width($r('app.float.icon_person_size'))
          .height($r('app.float.icon_person_size'))
          .borderRadius($r('app.float.vp_twenty_four'))
        Column() {
          Text($r('app.string.account_name'))
            .fontSize($r('app.float.vp_sixteen'))
            .fontColor(Color.White)
            .margin({ bottom: $r('app.float.vp_four') })
          Row() {
            Text($r('app.string.member_type'))
              .fontSize($r('app.float.micro_font_size'))
              .fontColor($r('app.color.eighty_alpha_white'))
              .padding({
                left: $r('app.float.vp_four'),
                right: $r('app.float.vp_four'),
                top: $r('app.float.vp_one'),
                bottom: $r('app.float.vp_one')
              })
              .backgroundColor($r("app.color.ten_alpha_black"))
              .margin({ right: $r('app.float.vp_four') })
              .borderRadius($r('app.float.vp_eight'))
            Text($r('app.string.ship_address'))
              .fontSize($r('app.float.micro_font_size'))
              .fontColor($r("app.color.eighty_alpha_white"))
              .padding({
                left: $r('app.float.vp_four'),
                right: $r('app.float.vp_four'),
                top: $r('app.float.vp_one'),
                bottom: $r('app.float.vp_one')
              })
              .backgroundColor($r("app.color.ten_alpha_black"))
              .borderRadius($r('app.float.vp_eight'))
          }
        }
        .justifyContent(FlexAlign.Center)
        .margin({ left: $r('app.float.vp_twelve') })
      }
      .height($r('app.float.icon_person_size'))
      .width(StyleConstants.FULL_WIDTH)

      Row() {
        this.AccountPoints($r('app.string.account_point'), $r('app.string.account_bonus'))
        Divider()
          .vertical(true)
          .color($r("app.color.sixty_alpha_white"))
          .height($r('app.float.vp_sixteen'))
        this.AccountPoints($r('app.string.account_point'), $r('app.string.account_coupons'))
        Divider()
          .vertical(true)
          .color($r("app.color.sixty_alpha_white"))
          .height($r('app.float.vp_sixteen'))
        this.AccountPoints($r('app.string.account_point'), $r('app.string.account_vouchers'))
      }
      .justifyContent(FlexAlign.SpaceAround)
      .width(StyleConstants.FULL_WIDTH)
      .height($r('app.float.account_points_height'))
      .margin({
        top: $r('app.float.vp_eight'),
        bottom: $r('app.float.vp_eight')
      })
    }
    .height($r('app.float.avatar_height'))
    .width(StyleConstants.FULL_WIDTH)
  }

  @Builder
  AccountPoints(pointValue: Resource, pointName: Resource) {
    Column() {
      Text(pointValue)
        .fontSize($r('app.float.small_font_size'))
        .fontColor($r('app.color.eighty_alpha_white'))
      Row() {
        Text(pointName)
          .fontSize($r('app.float.smaller_font_size'))
          .fontColor($r('app.color.eighty_alpha_white'))
        Image($r('app.media.ic_white_arrow'))
          .objectFit(ImageFit.Contain)
          .height($r('app.float.vp_eight'))
          .width($r('app.float.vp_four'))
      }
      .justifyContent(FlexAlign.SpaceAround)
    }
  }

  @Builder
  Order() {
    Flex({ direction: FlexDirection.Column }) {
      Flex({
        justifyContent: FlexAlign.SpaceBetween,
        alignItems: ItemAlign.Center
      }) {
        Text($r('app.string.order_mine'))
          .fontSize($r('app.float.middle_font_size'))
        Row() {
          Text($r('app.string.order_total'))
            .fontSize($r('app.float.small_font_size'))
            .fontColor($r('app.color.sixty_alpha_black'))
          Image($r('app.media.ic_right_arrow'))
            .objectFit(ImageFit.Contain)
            .height($r('app.float.vp_twenty_four'))
            .width($r('app.float.vp_twelve'))
        }
        .onClick(() => {
          router.pushUrl({
            url: PersonalConstants.ORDER_LIST_PAGE_URL,
            params: { tabIndex: 0 }
          }).catch((err: Error) => {
            Logger.error(JSON.stringify(err));
          });
        })
      }
      .margin({ bottom: $r('app.float.vp_fourteen') })

      Flex({
        justifyContent: FlexAlign.SpaceAround,
        alignItems: ItemAlign.Center
      }) {
        ForEach(this.orderIconButton, (iconButton: IconButtonModel) => {
          IconButton({
            props: iconButton,
            click: this.onOrderButtonClick
          })
        }, (iconButton: IconButtonModel) => JSON.stringify(iconButton))
      }
      .width(StyleConstants.FULL_WIDTH)
    }
    .height($r('app.float.order_height'))
    .padding($r('app.float.vp_twelve'))
    .cardStyle()
  }

  @Builder
  IconDock(buttons: IconButtonModel[]) {
    Flex({
      justifyContent: FlexAlign.SpaceAround,
      alignItems: ItemAlign.Center
    }) {
      ForEach(buttons, (iconButton: IconButtonModel) => {
        IconButton({
          props: iconButton
        })
      }, (iconButton: IconButtonModel[]) => JSON.stringify(iconButton))
    }
    .height($r('app.float.icon_dock_height'))
    .padding($r('app.float.vp_twelve'))
    .cardStyle()
  }

  @Builder
  LiveTitle() {
    Row() {
      Text($r('app.string.live_watch'))
        .fontSize($r('app.float.middle_font_size'))
        .fontWeight(StyleConstants.FONT_WEIGHT_FIVE)
        .fontColor(Color.Black)
      Blank()
      Text($r('app.string.live_more'))
        .fontSize($r('app.float.small_font_size'))
        .fontColor($r("app.color.sixty_alpha_black"))
      Image($r('app.media.ic_right_arrow'))
        .objectFit(ImageFit.Contain)
        .height($r('app.float.vp_twenty_four'))
        .width($r('app.float.vp_twelve'))
    }
    .margin($r('app.float.vp_twelve'))
    .width(StyleConstants.FULL_WIDTH)
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Image($r('app.media.ic_app_background'))
        .width(StyleConstants.FULL_WIDTH)
        .height($r('app.float.personal_background_image_height'))
        .objectFit(ImageFit.Auto)
      Flex({ direction: FlexDirection.Column }) {
        Row() {
          Image($r('app.media.ic_setting'))
            .width($r('app.float.vp_twenty_four'))
            .height($r('app.float.vp_twenty_four'))

          Image($r('app.media.ic_scan'))
            .width($r('app.float.vp_twenty_four'))
            .height($r('app.float.vp_twenty_four'))
            .margin({ left: $r('app.float.vp_twenty_four') })
        }
        .justifyContent(FlexAlign.End)
        .width(StyleConstants.FULL_WIDTH)
        .height($r('app.float.icon_row_height'))

        Scroll() {
          Column() {
            this.Avatar()
            this.Order()
            this.IconDock(memberButton)
            this.IconDock(activityButton)
            this.LiveTitle()
            LiveList({
              count: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ? StyleConstants.DISPLAY_FOUR :
                (this.currentBreakpoint === BreakpointConstants.BREAKPOINT_MD ?
                StyleConstants.DISPLAY_THREE : StyleConstants.DISPLAY_TWO),
              liveList: liveData
            })
          }
        }
        .scrollBar(BarState.Off)
      }
      .padding({
        left: $r('app.float.vp_twelve'),
        right: $r('app.float.vp_twelve')
      })
    }
  }
}