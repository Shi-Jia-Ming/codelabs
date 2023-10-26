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
import { ShopCartConstants } from '../constants/ShopCartConstants';
import {
  LocalDataManager,
  Logger,
  CounterProduct,
  CommodityList,
  EmptyComponent,
  Commodity,
  Product,
  StyleConstants,
  BreakpointConstants,
  Order
} from '@ohos/common';
import { SelectProducts, UpdateShopProps } from '@ohos/common/src/main/ets/viewmodel/ProductModel';

@Component
export struct ShopCart {
  private onNeedUpdate?: () => void;
  @StorageProp('currentBreakpoint') currentBreakpoint: string = 'sm';
  @Link @Watch('onListChange') products: Array<Product>;
  @State sumPrice: number = 0;
  @State isSelectAll: boolean = false;
  @State commodityList: Commodity[] = [];
  @State @Watch('selectProductChange') selectProducts: SelectProducts[] = [];
  private localDataManager: LocalDataManager = LocalDataManager.instance();

  aboutToAppear() {
    const sortRes = this.localDataManager.queryCommodityList();
    sortRes.sort(() => (Math.random() - StyleConstants.HALF_ONE) > 0 ? 1 : StyleConstants.MINUS_ONE);
    this.commodityList = sortRes;
    this.onListChange();
  }

  needUpdateShopCart() {
    if (this.onNeedUpdate !== undefined) {
      this.onNeedUpdate();
    }
    this.countSumPrice();
  }

  private countSumPrice() {
    this.sumPrice = 0;

    this.isSelectAll = this.selectProducts.every((item: SelectProducts) => item.selected);
    let tempPrice: number = 0;
    this.selectProducts.forEach((item: SelectProducts) => {
      if (item.selected) {
        let data = this.products.find((value: Product) => value.id === item.key);
        const ins = (data !== undefined ? data.price * data.count : 0);
        tempPrice += ins;
      }
    })
    this.sumPrice = tempPrice;
  }

  settleAccounts() {
    const orderList = this.products
      .filter((item: Product, index: number) =>
        item.id === this.selectProducts[index].key && this.selectProducts[index].selected === true)
      .map((item: Product) => {
        let returnParams: Order = {
          orderId: item.id,
          commodityId: Number.parseInt(item.commodityId),
          price: item.price,
          count: item.count,
          specifications: item.specifications,
          image: item.img[0],
          description: item.description,
          title: item.name
        }
        return returnParams;
      });
    Logger.info('settleAccounts orderList length: ' + orderList.length);
    router.pushUrl({
      url: ShopCartConstants.CONFIRM_ORDER_PAGE_URL,
      params: { orderList: orderList }
    }).catch((err: Error) => {
      Logger.error(JSON.stringify(err));
    });
  }

  onListChange() {
    this.selectProducts = [];
    this.products.forEach((item: Product) => {
      let payload: SelectProducts = { selected: false, key: '' };
      payload.selected = !!item.selected;
      payload.key = item.id;
      this.selectProducts.push(payload);
    })
    this.countSumPrice();
  }

  selectProductChange(index: number): boolean {
    if (this.selectProducts[index] !== undefined) {
      return this.selectProducts[index].selected;
    }
    return false;
  }

  onChangeCount = (count: number, info: Product): void => {
    let updateShopCartParams: UpdateShopProps = {
      id: info.id,
      count: count
    };
    this.localDataManager.updateShopCart(updateShopCartParams);
    this.needUpdateShopCart();
  }

  @Builder
  ItemDelete(item: Product) {
    Flex({
      direction: FlexDirection.Column,
      justifyContent: FlexAlign.Center,
      alignItems: ItemAlign.End
    }) {
      Column() {
        Image($r('app.media.ic_trash'))
          .width($r('app.float.vp_twenty_four'))
          .height($r('app.float.vp_twenty_four'))
          .margin({ bottom: $r('app.float.vp_ten') })
        Text($r('app.string.delete'))
          .fontSize($r('app.float.small_font_size'))
          .fontColor(Color.White)
      }
      .padding({ right: $r('app.float.vp_fourteen') })
    }
    .onClick(() => {
      this.products = this.localDataManager.deleteShopCart([item.id]);
    })
    .height($r('app.float.item_delete_height'))
    .width($r('app.float.item_delete_width'))
    .backgroundColor($r('app.color.focus_color'))
    .borderRadius($r('app.float.vp_sixteen'))
    .margin({ left: $r('app.float.item_delete_margin_left') })
  }

  @Builder
  CartItem(item: Product, index: number) {
    Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
      Checkbox({
        name: `${ShopCartConstants.CHECKBOX}${index}`,
        group: ShopCartConstants.CHECKBOX_GROUP
      })
        .width($r('app.float.vp_twenty_four'))
        .height($r('app.float.vp_twenty_four'))
        .selectedColor($r('app.color.select_color'))
        .select(this.selectProductChange(index))
        .onClick(() => {
          let tempData: SelectProducts = {
            key: this.selectProducts[index].key,
            selected: !this.selectProducts[index].selected
          }
          this.selectProducts.splice(index, 1, tempData)
          let updateShopCartParams: UpdateShopProps = {
            id: item.id,
            selected: this.selectProducts[index].selected
          };
          this.localDataManager.updateShopCart(updateShopCartParams);
          this.needUpdateShopCart();
        })
      Image($rawfile(item.img[0]))
        .height($r('app.float.card_image_size'))
        .width($r('app.float.card_image_size'))
        .objectFit(ImageFit.Cover)
        .margin({ left: $r('app.float.vp_sixteen') })
      Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.SpaceAround }) {
        Text($r('app.string.commodity_piece_description', item.name, item.description))
          .fontSize($r('app.float.small_font_size'))
          .margin({ bottom: $r('app.float.vp_eight') })
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(StyleConstants.TWO_TEXT_LINE)
          .width(StyleConstants.FULL_WIDTH)
        Text(item.specifications.length === 2 ?
            item.specifications[0].value + '，' + item.specifications[1].value:
            item.specifications.length === 3 ?
            item.specifications[0].value + '，' + item.specifications[1].value + '，' + item.specifications[2].value :
            item.specifications.length === 4 ?
            item.specifications[0].value + '，' + item.specifications[1].value + '，' + item.specifications[2].value + '，' + item.specifications[3].value : ''
        )
          .fontSize($r('app.float.smaller_font_size'))
          .maxLines(1)
          .fontColor($r('app.color.sixty_alpha_black'))
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .width(StyleConstants.FULL_WIDTH)
        Flex({ justifyContent: FlexAlign.SpaceBetween }) {
          Text() {
            Span($r('app.string.rmb'))
              .fontSize($r('app.float.smaller_font_size'))
              .fontColor($r('app.color.focus_color'))
            Span(`${item.price}`)
              .fontSize($r('app.float.middle_font_size'))
              .fontColor($r('app.color.focus_color'))
          }

          CounterProduct({
            count: item.count,
            onNumberChange: (num: number) => {
              this.onChangeCount(num, item);
            }
          })
        }
      }
      .margin({
        left: $r('app.float.vp_sixteen'),
        top: $r('app.float.vp_twelve'),
        bottom: $r('app.float.vp_twelve')
      })
      .width(StyleConstants.FULL_WIDTH)
    }
    .padding({
      left: $r('app.float.vp_twelve'),
      right: $r('app.float.vp_twelve')
    })
    .borderRadius($r('app.float.vp_sixteen'))
    .backgroundColor(Color.White)
    .width(StyleConstants.FULL_WIDTH)
    .height($r('app.float.item_delete_height'))
  }

  @Builder
  Settle() {
    Flex({ justifyContent: FlexAlign.SpaceBetween }) {
      Flex({ alignItems: ItemAlign.Center }) {
        Checkbox({ name: ShopCartConstants.CHECKBOX, group: ShopCartConstants.CHECKBOX_GROUP })
          .selectedColor($r('app.color.select_color'))
          .select(this.isSelectAll)
          .onClick(() => {
            this.isSelectAll = !this.isSelectAll;
            this.products.map((item: Product): void => {
              let returnParams = this.localDataManager.updateShopCart({
                id: item.id,
                count: item.count,
                selected: !!this.isSelectAll,
                specifications: []
              });
              return returnParams;
            })
            this.needUpdateShopCart();
          })
        Text($r('app.string.select_all'))
          .fontSize($r('app.float.small_font_size'))
          .fontColor(Color.Grey)
      }
      .height(StyleConstants.FULL_HEIGHT)
      .width($r('app.float.settle_select_width'))

      Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.End }) {
        Text($r('app.string.total'))
          .fontSize($r('app.float.smaller_font_size'))
          .fontWeight(FontWeight.Bold)
        Text() {
          Span($r('app.string.rmb'))
            .fontSize($r('app.float.smaller_font_size'))
            .fontColor($r('app.color.focus_color'))
          Span(`${this.sumPrice}`)
            .fontSize($r('app.float.middle_font_size'))
            .fontColor($r('app.color.focus_color'))
        }
        .margin({
          right: $r('app.float.vp_eight'),
          left: $r('app.float.vp_eight')
        })

        Button($r('app.string.checkout'), { type: ButtonType.Capsule, stateEffect: true })
          .backgroundColor($r('app.color.focus_color'))
          .fontSize($r('app.float.smaller_font_size'))
          .height($r('app.float.settle_button_height'))
          .width($r('app.float.settle_select_width'))
          .onClick(() => {
            this.settleAccounts();
          })
      }
      .height(StyleConstants.FULL_HEIGHT)
    }
    .padding({
      right: $r('app.float.vp_twelve'),
      left: $r('app.float.vp_twelve')
    })
    .backgroundColor(Color.White)
    .width(StyleConstants.FULL_WIDTH)
    .height($r('app.float.vp_fifty_six'))
  }

  build() {
    Flex({ direction: FlexDirection.Column }) {
      Text($r('app.string.cart'))
        .fontSize($r('app.float.huge_font_size'))
        .height($r('app.float.vp_fifty_six'))
        .padding({ left: $r('app.float.vp_twenty_four') })
        .width(StyleConstants.FULL_WIDTH)
        .textAlign(TextAlign.Start)
      Scroll() {
        Column() {
          if (this.products.length > 0) {
            List({ space: StyleConstants.FIFTEEN_SPACE }) {
              ForEach(this.products, (item: Product, index?: number): void => {
                ListItem() {
                  if (index !== undefined) {
                    this.CartItem(item, index)
                  }
                }
                .swipeAction({ end: this.ItemDelete(item) })
              }, (item: Product) => item.id)
            }
          } else {
            Column() {
              EmptyComponent()
            }
            .width(StyleConstants.FULL_WIDTH)
            .height(StyleConstants.FIFTY_HEIGHT)
          }
          Text($r('app.string.guess'))
            .fontSize($r('app.float.middle_font_size'))
            .width(StyleConstants.FULL_WIDTH)
            .margin({
              top: $r('app.float.vp_twenty_four'),
              bottom: $r('app.float.vp_sixteen'),
              left: $r('app.float.vp_twelve')
            })
            .textAlign(TextAlign.Start)

          CommodityList({
            commodityList: $commodityList,
            column: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ?
              StyleConstants.DISPLAY_TWO : StyleConstants.DISPLAY_THREE,
            onClickItem: (data: Commodity) => {
              router.pushUrl({
                url: ShopCartConstants.COMMODITY_DETAIL_PAGE_URL,
                params: { id: data.id }
              }).catch((err: Error) => {
                Logger.error(JSON.stringify(err));
              });
            }
          })
        }
      }
      .scrollBar(BarState.Off)
      .margin({
        left: $r('app.float.vp_twelve'),
        right: $r('app.float.vp_twelve')
      })
      .height(StyleConstants.FULL_HEIGHT)

      if ((this.selectProducts).some(((item: SelectProducts) => item.selected === true))) {
        this.Settle()
      }
    }
    .width(StyleConstants.FULL_WIDTH)
    .backgroundColor($r('app.color.page_background'))
  }
}