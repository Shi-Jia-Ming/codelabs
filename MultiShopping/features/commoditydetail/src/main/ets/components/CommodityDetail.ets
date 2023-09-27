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
import { Order, ProductSpecification } from '@ohos/common';
import { FinishType } from '../bean/TypeModel';
import { SpecificationDialog } from './SpecificationDialog';
import { barData, userEvaluate, moreEvaluate, serviceList, Evaluate, BarData } from '../viewmodel/CommodityDetailData';
import { CapsuleGroupButton } from '../components/CapsuleGroupButton';
import { CommodityConstants } from '../constants/CommodityConstants';
import {
  LocalDataManager,
  Logger,
  Commodity,
  StyleConstants,
  GridConstants,
  CommonDataSource,
  getID,
  Specification
} from '@ohos/common';
import { ShopProps } from '@ohos/common/src/main/ets/bean/ProductModel';

@Extend(Button) function titleButton() {
  .backgroundColor($r('app.color.zero_alpha_black'))
  .width($r('app.float.title_button_size'))
  .height($r('app.float.title_button_size'))
  .borderRadius($r('app.float.vp_four'))
}


@Component
export struct CommodityDetail {
  @Prop commodityId: string = '';
  @State info?: Commodity = undefined;
  @State @Watch('onSelectKeysChange') selectKeys?: ProductSpecification[] = [];
  @State count: number = 1;
  @State swiperIndex: number = 0;
  @State productOptions: string = '';
  private localDataManager: LocalDataManager = LocalDataManager.instance();
  private data: CommonDataSource<Evaluate> = new CommonDataSource<Evaluate>(userEvaluate.evaluate !== undefined ?
  userEvaluate.evaluate : []);
  dialogController: CustomDialogController = new CustomDialogController({
    builder: SpecificationDialog({
      onFinish: (type: FinishType, count: number, selectKeys: ProductSpecification[]): void =>
        this.onSpecificationFinish(type, count, selectKeys),
      data: $info,
      count: $count,
      selectTags: $selectKeys,
      productOptions:$productOptions
    }),
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    customStyle: true
  })

  onSelectKeysChange() {
    this.productOptions = '';
    if (this.selectKeys !== undefined) {
      this.selectKeys.forEach((item) => {
        this.productOptions += item.value + ' ';
      })
    }
  }

  onSpecificationFinish(type: FinishType, count: number, selectKeys: ProductSpecification[]) {
    this.count = count;
    this.selectKeys = selectKeys;
    const params: ShopProps = {
      id: getID(),
      commodityId: this.info !== undefined ? this.info.id : '',
      count,
      specifications: this.selectKeys
    }
    switch (type) {
      case FinishType.JOIN_SHOPPING_CART:
        this.localDataManager.insertShopCart(params);
        promptAction.showToast({
          message: $r('app.string.insert_cart_success')
        });
        break;
      case FinishType.BUY_NOW:
        if (this.info !== undefined) {
          let orderList: Order = {
            orderId: params.id,
            image: this.info.images[0],
            title: this.info.title,
            description: this.info.description,
            price: this.info.price,
            count: params.count,
            commodityId: Number.parseInt(params.commodityId),
            specifications: this.selectKeys
          }
          router.pushUrl({
            url: CommodityConstants.CONFIRM_ORDER_PAGE_URL,
            params: { orderList: [orderList] }
          }).catch((err: Error) => {
            Logger.error(JSON.stringify(err));
          });
          break;
        }
    }
  }

  bottomBtnClick(type: FinishType) {
    if (this.selectKeys !== undefined) {
      this.onSpecificationFinish(type, this.count, this.selectKeys);
    }
  }

  aboutToAppear() {
    this.info = this.localDataManager.queryCommodityListById(this.commodityId);
    if (this.info.specifications !== undefined) {
      this.info.specifications.forEach((item: Specification) => {
        if (this.selectKeys !== undefined) {
          let SpecificationData:ProductSpecification = new ProductSpecification()
          SpecificationData.name = item.title;
          SpecificationData.value = item.data[0].key;
          this.selectKeys.push(SpecificationData)
        }
      });
    }
  }

  @Styles backgroundStyle(){
    .backgroundColor(Color.White)
    .borderRadius($r('app.float.vp_sixteen'))
    .padding({
      left: $r('app.float.vp_twelve'),
      right: $r('app.float.vp_twelve'),
      top: $r('app.float.vp_sixteen'),
      bottom: $r('app.float.vp_sixteen')
    })
    .margin({
      top: $r('app.float.vp_twelve'),
      right: $r('app.float.vp_twelve'),
      left: $r('app.float.vp_twelve')
    })
  }

  @Builder CustomSwiper(payload: string[]) {
    Stack({ alignContent: Alignment.BottomEnd }) {
      Swiper() {
        ForEach(payload, (item: string) => {
          Flex({ justifyContent: FlexAlign.Center }) {
            Image($rawfile(item))
              .height(StyleConstants.FULL_HEIGHT)
              .aspectRatio(1)
              .objectFit(ImageFit.Cover)
          }
          .margin({
            left: $r('app.float.swiper_image_margin'),
            right: $r('app.float.swiper_image_margin'),
            top: $r('app.float.vp_twenty'),
            bottom: $r('app.float.vp_twenty')
          })
        }, (item: string) => JSON.stringify(item))
      }
      .onChange((index: number) => this.swiperIndex = index)
      .indicator(false)
      .width(StyleConstants.FULL_WIDTH)
      .height(StyleConstants.FULL_HEIGHT)

      Text(`${this.swiperIndex + 1}/${payload.length}`)
        .fontSize($r('app.float.smaller_font_size'))
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)
        .width($r('app.float.swiper_indicator_text_width'))
        .height($r('app.float.vp_eighteen'))
        .backgroundColor($r('app.color.forty_alpha_black'))
        .borderRadius($r('app.float.swiper_indicator_text_radius'))
        .margin({
          right: $r('app.float.vp_sixteen'),
          bottom: $r('app.float.vp_sixteen')
        })
    }
    .width(StyleConstants.FULL_WIDTH)
    .backgroundColor(Color.White)
    .height($r('app.float.swiper_height'))
  }

  @Builder TitleBar(payload: Commodity) {
    Flex({ direction: FlexDirection.Column }) {
      Text() {
        Span($r('app.string.rmb'))
          .fontSize($r('app.float.middle_font_size'))
          .fontColor($r('app.color.focus_color'))
        Span(`${payload.price}`)
          .fontSize($r('app.float.bigger_font_size'))
          .fontColor($r('app.color.focus_color'))
      }

      Row() {
        Text($r('app.string.commodity_desc', payload.title, payload.description))
          .fontColor(Color.Black)
          .fontSize($r('app.float.middle_font_size'))
          .fontWeight(StyleConstants.FONT_WEIGHT_FOUR)
      }
      .width(StyleConstants.FULL_WIDTH)
      .margin({ top: $r('app.float.vp_four') })

      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        ForEach(barData, (item: BarData) => {
          Row() {
            Image(item.icon !== undefined ? item.icon : '')
              .height($r('app.float.vp_fourteen'))
              .width($r('app.float.vp_fourteen'))
              .margin({ right: $r('app.float.vp_four') })
            Text(item.text)
              .fontSize($r('app.float.micro_font_size'))
              .fontColor($r('app.color.sixty_alpha_black'))
          }
        }, (item: BarData) => JSON.stringify(item))
      }
      .height($r('app.float.vp_fourteen'))
      .margin({ top: $r('app.float.vp_twelve') })
    }
    .backgroundStyle()
  }

  @Builder Specification() {
    Row() {
      Text($r('app.string.choice'))
        .fontColor(Color.Black)
        .fontSize($r('app.float.small_font_size'))
        .fontWeight(StyleConstants.FONT_WEIGHT_FIVE)
        .margin({ right: $r('app.float.vp_sixteen') })
      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        Text(`${this.productOptions}x${this.count}`)
          .fontSize($r('app.float.small_font_size'))
        Image($r('app.media.ic_point'))
          .height($r('app.float.vp_twelve'))
          .width($r('app.float.vp_six'))
      }
      .layoutWeight(StyleConstants.LAYOUT_WEIGHT)
      .onClick(():void => this.dialogController.open())
    }
    .backgroundStyle()
  }

  @Builder SpecialService() {
    Column() {
      Flex({
        justifyContent: FlexAlign.SpaceBetween,
        alignItems: ItemAlign.Start
      }) {
        Text($r('app.string.send'))
          .fontColor(Color.Black)
          .fontSize($r('app.float.small_font_size'))
          .fontWeight(StyleConstants.FONT_WEIGHT_FIVE)
          .margin({ right: $r('app.float.vp_sixteen') })
        Flex({
          justifyContent: FlexAlign.SpaceBetween,
          alignItems: ItemAlign.Center
        }) {
          Row() {
            Image($r('app.media.ic_send'))
              .width($r('app.float.vp_sixteen'))
              .height($r('app.float.vp_sixteen'))
            Text($r('app.string.send_hint'))
              .fontColor($r('app.color.sixty_alpha_black'))
              .fontSize($r('app.float.small_font_size'))
              .margin({ left: $r('app.float.vp_eight') })
          }

          Image($r('app.media.ic_point'))
            .height($r('app.float.vp_twelve'))
            .width($r('app.float.vp_six'))
        }
        .layoutWeight(StyleConstants.LAYOUT_WEIGHT)
        .height($r('app.float.vp_twenty'))
        .margin({ bottom: $r('app.float.vp_sixteen') })
      }

      Divider()
        .margin({
          left: $r('app.float.vp_fifty_six'),
          right: $r('app.float.vp_twelve'),
          bottom: $r('app.float.vp_twelve')
        })
        .height($r('app.float.service_divide_height'))
        .backgroundColor($r('app.color.twenty_alpha_black'))
      Flex({
        justifyContent: FlexAlign.SpaceBetween,
        alignItems: ItemAlign.Start
      }) {
        Text($r('app.string.service'))
          .fontColor(Color.Black)
          .fontSize($r('app.float.small_font_size'))
          .fontWeight(StyleConstants.FONT_WEIGHT_FIVE)
          .margin({ right: $r('app.float.vp_sixteen') })
        Flex({ direction: FlexDirection.Column }) {
          ForEach(serviceList, (item: string, index?: number) => {
            Flex({ alignItems: ItemAlign.Center }) {
              Image($r('app.media.ic_supplying'))
                .width($r('app.float.vp_sixteen'))
                .height($r('app.float.vp_sixteen'))
              Text(item)
                .fontColor(Color.Black)
                .fontSize($r('app.float.vp_fourteen'))
                .margin({ left: $r('app.float.vp_eight') })
            }
            .height($r('app.float.vp_twenty'))
            .margin({
              bottom: index === serviceList.length - 1 ? 0 : $r('app.float.vp_sixteen')
            })
          }, (item: string) => JSON.stringify(item))
        }
        .layoutWeight(StyleConstants.LAYOUT_WEIGHT)
      }
    }
    .backgroundStyle()
  }

  @Builder UserEvaluate() {
    Column({ space: StyleConstants.TWELVE_SPACE }) {
      Row() {
        Text(userEvaluate.title)
          .fontSize($r('app.float.middle_font_size'))
          .fontWeight(StyleConstants.FONT_WEIGHT_FIVE)
          .fontColor(Color.Black)
        Blank()
        Text(userEvaluate.favorable)
          .fontSize($r('app.float.small_font_size'))
          .fontColor($r('app.color.focus_color'))
        Text($r('app.string.evaluate_favorable'))
          .fontSize($r('app.float.small_font_size'))
          .fontColor($r('app.color.sixty_alpha_black'))
        Image($r('app.media.ic_right_arrow'))
          .objectFit(ImageFit.Contain)
          .height($r('app.float.vp_twenty_four'))
          .width($r('app.float.vp_twelve'))
      }
      .width(StyleConstants.FULL_WIDTH)

      LazyForEach(this.data, (item: Evaluate) => {
        this.Evaluate(item);
      }, (item: Evaluate, index?: number) => JSON.stringify(item) + index)
      Text($r('app.string.evaluate_show_more'))
        .fontSize($r('app.float.small_font_size'))
        .width($r('app.float.evaluate_text_width'))
        .height($r('app.float.evaluate_text_height'))
        .textAlign(TextAlign.Center)
        .border({
          width: $r('app.float.vp_one'),
          color: $r('app.color.twenty_alpha_black'),
          radius: $r('app.float.evaluate_text_radius')
        })
        .onClick(() => {
          if (this.data !== undefined) {
            this.data.addData(this.data.totalCount(), moreEvaluate);
          }
        })
    }
    .backgroundStyle()
  }

  @Builder Evaluate(evaluate: Evaluate) {
    Column({ space: StyleConstants.TWELVE_SPACE }) {
      Row() {
        Image(evaluate.userIcon !== undefined ? $rawfile(evaluate.userIcon) : '')
          .objectFit(ImageFit.Contain)
          .width($r('app.float.evaluate_icon_size'))
          .height($r('app.float.evaluate_icon_size'))
        Column({ space: StyleConstants.FOUR_SPACE }) {
          Text(evaluate.userNumber)
            .fontSize($r('app.float.small_font_size'))
            .fontWeight(StyleConstants.FONT_WEIGHT_FIVE)
            .fontColor(Color.Black)
          Rating({ rating: Number(evaluate.rating) })
            .hitTestBehavior(HitTestMode.None)
            .size({
              width: $r('app.float.evaluate_rating_width'),
              height: $r('app.float.vp_twelve')
            })
            .stars(CommodityConstants.RATING_STARS)
        }
        .alignItems(HorizontalAlign.Start)
        .width(StyleConstants.FULL_WIDTH)
        .margin({ left: $r('app.float.vp_twelve') })
      }
      .width(StyleConstants.FULL_WIDTH)

      Text(evaluate.desc)
        .fontSize($r('app.float.small_font_size'))
        .fontColor($r('app.color.eighty_alpha_black'))
    }
    .alignItems(HorizontalAlign.Start)
  }

  @Builder DetailList(images: string[]) {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center
    }) {
      ForEach(images, (image: string) => {
        Image($rawfile(image))
          .width(StyleConstants.FULL_WIDTH)
          .constraintSize({ maxWidth: $r('app.float.detail_image_max_width') })
          .objectFit(ImageFit.Cover)
      }, (image: string) => JSON.stringify(image))
    }
    .width(StyleConstants.FULL_WIDTH)
    .backgroundStyle()
  }

  @Builder BottomMenu() {
    Flex({ alignItems: ItemAlign.Center }) {
      Row() {
        Flex({
          direction: FlexDirection.Column,
          justifyContent: FlexAlign.Center,
          alignItems: ItemAlign.Center }) {
          Image($r('app.media.ic_home'))
            .height($r('app.float.button_image_size'))
            .width($r('app.float.button_image_size'))
          Text($r('app.string.index'))
            .fontSize($r('app.float.micro_font_size'))
            .fontColor($r('app.color.sixty_alpha_black'))
            .margin({ top: $r('app.float.vp_four') })
        }
        .onClick(() => {
          AppStorage.Set('IndexPage', CommodityConstants.INDEX_HOME);
          router.back();
        })
        .height(StyleConstants.FULL_HEIGHT)
        .width($r('app.float.button_flex_width'))

        Flex({
          direction: FlexDirection.Column,
          justifyContent: FlexAlign.Center,
          alignItems: ItemAlign.Center
        }) {
          Image($r('app.media.ic_shopping_cart'))
            .height($r('app.float.button_image_size'))
            .width($r('app.float.button_image_size'))
          Text($r('app.string.cart'))
            .fontSize($r('app.float.micro_font_size'))
            .fontColor($r('app.color.sixty_alpha_black'))
            .margin({ top: $r('app.float.vp_four') })
        }.onClick(() => {
          AppStorage.Set('IndexPage', CommodityConstants.INDEX_SHOPPING_CART);
          router.back();
        })
        .height(StyleConstants.FULL_HEIGHT)
        .width($r('app.float.button_flex_width'))
      }
      .height(StyleConstants.FULL_HEIGHT)
      .margin({ right: $r('app.float.vp_eight') })

      CapsuleGroupButton({
        configs: [{
          text: $r('app.string.insert_cart'),
          onClick: ():void => this.bottomBtnClick(FinishType.JOIN_SHOPPING_CART)
        }, {
          text: $r('app.string.buy_now'),
          onClick: ():void => this.bottomBtnClick(FinishType.BUY_NOW)
        }]
      })
    }
    .height($r('app.float.vp_fifty_six'))
    .width(StyleConstants.FULL_WIDTH)
    .padding({ right: $r('app.float.vp_sixteen') })
    .backgroundColor($r('app.color.page_background'))
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Flex({ direction: FlexDirection.Column }) {
        Scroll() {
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
                sm: GridConstants.SPAN_FOUR,
                md: GridConstants.SPAN_EIGHT,
                lg: GridConstants.SPAN_TWELVE }
            }) {
              if (this.info !== undefined) {
                this.CustomSwiper(this.info?.images)
              }
            }

            GridCol({
              span: {
                sm: GridConstants.SPAN_FOUR,
                md: GridConstants.SPAN_EIGHT,
                lg: GridConstants.SPAN_EIGHT
              },
              offset: { lg: GridConstants.OFFSET_TWO }
            }) {
              Column() {
                if (this.info) {
                  this.TitleBar(this.info)
                  this.Specification()
                  this.SpecialService()
                  this.UserEvaluate()
                  this.DetailList(this.info.images)
                }
              }
            }
          }
        }
        .flexGrow(StyleConstants.FLEX_GROW)

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
              sm: GridConstants.SPAN_FOUR,
              md: GridConstants.SPAN_EIGHT,
              lg: GridConstants.SPAN_EIGHT
            },
            offset: { lg: GridConstants.OFFSET_TWO } }) {
            this.BottomMenu()
          }
        }
      }

      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween }) {
        Button() {
          Image($r('app.media.ic_back'))
            .height(StyleConstants.FULL_HEIGHT)
            .aspectRatio(1)
        }
        .titleButton()
        .onClick(() => router.back())

        Button() {
          Image($r('app.media.ic_share'))
            .height(StyleConstants.FULL_HEIGHT)
            .aspectRatio(1)
        }
        .titleButton()
      }
      .margin({
        left: $r('app.float.vp_sixteen'),
        top: $r('app.float.vp_sixteen'),
        right: $r('app.float.vp_sixteen')
      })
    }
  }
}