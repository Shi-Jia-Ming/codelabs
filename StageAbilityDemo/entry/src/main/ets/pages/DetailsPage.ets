/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import AppContext from '@ohos.application.context';
import { DetailsPageStyle, PERCENTAGE_100 } from '../common/constants/Constants';
import AddressComponent from '../view/details/AddressComponent';
import PickerComponent from '../view/details/PickerComponent';
import PriceComponent from '../view/details/PriceComponent';
import GoodsTitleComponent from '../view/details/GoodsTitleComponent';
import PanelComponent from '../view/details/PanelComponent';
import CommentsComponent from '../view/details/CommentsComponent';
import CommentsHeaderComponent from '../view/details/CommentsHeaderComponent';
import BottomBarComponent from '../view/details/BottomBarComponent';
import ServicesComponent from '../view/details/ServicesComponent';
import BalanceComponent from '../view/BalanceComponent';
import CardComponent from '../view/CardComponent';
import PreviewerComponent from '../view/details/PreviewerComponent';
import GoodsData from '../common/bean/GoodsData';
import DetailsViewModel from '../viewmodel/DetailsViewModel';

let viewModel: DetailsViewModel = new DetailsViewModel();
const KEY: string = 'GoodsPosition';
let position = AppStorage.Get<number>(KEY);

@Extend(Image) function setTopImageStyle () {
  .width(DetailsPageStyle.TOP_IMAGE_SIZE)
  .height(DetailsPageStyle.TOP_IMAGE_SIZE)
}

@Entry
@Component
struct DetailsPage {
  private goodsDetails: GoodsData;

  aboutToAppear() {
    this.goodsDetails = viewModel.loadDetails(position);
  }

  build() {
    Column() {
      Scroll() {
        Column() {
          Stack({ alignContent: Alignment.Top }) {
            // GoodsPreviewer displays images about goods.
            PreviewerComponent({ goodsImg: this.goodsDetails.goodsImg })
            this.TopBarLayout()
          }
          .height(DetailsPageStyle.TOP_LAYOUT_HEIGHT)
          .width(PERCENTAGE_100)
          .backgroundColor($r('app.color.background1'))
          // the card layout style about goods information.
          this.CardsLayout()
        }
        .width(PERCENTAGE_100)
      }
      .height(DetailsPageStyle.SCROLL_LAYOUT_WEIGHT)
      .backgroundColor($r('app.color.background'))
      // tool bar in the bottom.
      BottomBarComponent()
        .height(DetailsPageStyle.TOOLBAR_WEIGHT)
    }
    .height(PERCENTAGE_100)
    .width(PERCENTAGE_100)
  }

  @Builder BackLayout() {
    Image($rawfile('detail/detail_back.png'))
      .setTopImageStyle()
      .onClick(() => {
        let handler = getContext(this) as AppContext.AbilityContext;
        handler.terminateSelf();
      })
  }

  @Builder ShareLayout() {
    Image($rawfile('detail/detail_share.png')).setTopImageStyle()
  }

  @Builder TopBarLayout() {
    BalanceComponent({ left: this.BackLayout(), right: this.ShareLayout() })
      .width(PERCENTAGE_100)
      .padding(DetailsPageStyle.MARGIN_TOP_LAYOUT)
  }

  @Builder MoreActionBuilder() {
    Image($rawfile('detail/detail_pick_up_more.png'))
      .objectFit(ImageFit.Contain)
      .height(DetailsPageStyle.IMAGE_SIZE_MORE)
      .width(DetailsPageStyle.IMAGE_SIZE_MORE)
  }

  @Builder CardsLayout() {
    CardComponent() {
      PriceComponent({ price: this.goodsDetails.price })
      GoodsTitleComponent({ title: this.goodsDetails.goodsName })
        .margin({ top: DetailsPageStyle.TITLE_MARGIN_TOP,
          bottom: DetailsPageStyle.TITLE_MARGIN_BOTTOM })
      PanelComponent()
    }

    CardComponent() {
      PickerComponent({ goodsDescription: this.goodsDetails.goodsDescription,
        actionMoreBuilder: this.MoreActionBuilder })
    }

    CardComponent() {
      AddressComponent()
      Divider()
        .height(DetailsPageStyle.DIVIDER_HEIGHT)
        .backgroundColor($r('app.color.detail_goods_address_line'))
        .margin({
          left: DetailsPageStyle.DIVIDER_MARGIN_LEFT,
          bottom: DetailsPageStyle.DIVIDER_MARGIN_BOTTOM,
          top: DetailsPageStyle.DIVIDER_MARGIN_TOP
        })
      ServicesComponent()
    }

    CardComponent() {
      CommentsHeaderComponent()
      CommentsComponent().margin({ top: DetailsPageStyle.COMMENT_LIST_MARGIN_TOP })
    }
  }
}