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

import BannerData from '../viewmodel/BannerData';
import MenuData from '../viewmodel/MenuData';
import GoodsData from '../viewmodel/GoodsData';
import ToolBarData from '../viewmodel/ToolBarData';
import GoodsServiceData from '../viewmodel/GoodsServiceData';

/*
 * The DataModel file instead of network data.
 */
export default class DataModel {
  public static readonly TAB_VIEW_MENU: Resource[] = [
    $r('app.string.home_tab_index'),
    $r('app.string.home_tab_food'),
    $r('app.string.home_tab_men_clothing'),
    $r('app.string.home_tab_fresh_food'),
    $r('app.string.home_tab_furniture'),
    $r('app.string.home_tab_mom_and_infant'),
    $r('app.string.home_tab_kitchen_things'),
  ];
  public static readonly BANNER: BannerData[] = [
    {
      imgSrc: $rawfile('index/banner1.png')
    },
    {
      imgSrc: $rawfile('index/banner2.png')
    },
    {
      imgSrc: $rawfile('index/banner3.png')
    }
  ];
  public static readonly HOME_MENU: MenuData[] = [
    {
      menuName: $r('app.string.home_menu_all'),
      menuContent: $r('app.string.home_menu_all_content'),
      fontWeight: '500',
      fontColor: '#FFE92F4F'
    },
    {
      menuName: $r('app.string.home_menu_select'),
      menuContent: $r('app.string.home_menu_select_content'),
      fontWeight: '400',
      fontColor: '#FF000000'
    },
    {
      menuName: $r('app.string.home_menu_new'),
      menuContent: $r('app.string.home_menu_new_content'),
      fontWeight: '400',
      fontColor: '#FF000000',
    },
    {
      menuName: $r('app.string.home_menu_discounts'),
      menuContent: $r('app.string.home_menu_discounts_content'),
      fontWeight: '400',
      fontColor: '#FF000000'
    }
  ];
  public static readonly GOOD_LIST: GoodsData[] = [
    {
      goodsName: $r('app.string.goods_list_item_1'),
      price: '1999',
      originalPrice: '2999',
      discounts: $r('app.string.goods_list_item_1_save'),
      label: $r('app.string.goods_list_activity_new'),
      goodsImg: $rawfile('index/good1.png'),
      goodsDescription: $r('app.string.goods_list_item_1_desc')
    },
    {
      goodsName: $r('app.string.goods_list_item_2'),
      price: '1999',
      originalPrice: '',
      discounts: $r('app.string.goods_list_item_2_save'),
      label: $r('app.string.goods_list_activity_time'),
      goodsImg: $rawfile('index/good2.png'),
      goodsDescription: $r('app.string.goods_list_item_2_desc')
    }
  ];
  public static readonly TOOL_BAR: ToolBarData[] = [
    {
      num: 0,
      text: $r('app.string.nav_index'),
      icon: $rawfile('index/home.png'),
      icon_after: $rawfile('index/home_selected.png'),
    },
    {
      num: 1,
      text: $r('app.string.nav_new'),
      icon: $rawfile('index/news.png'),
      icon_after: $rawfile('index/news_selected.png'),
    },
    {
      num: 2,
      text: $r('app.string.nav_shopping_cart'),
      icon: $rawfile('index/shopping_cart.png'),
      icon_after: $rawfile('index/shopping_cart_selected.png'),
    },
    {
      num: 3,
      text: $r('app.string.nav_mine'),
      icon: $rawfile('index/mine.png'),
      icon_after: $rawfile('index/mine_selected.png'),
    }
  ];
  public static readonly GOOD_SERVICE: GoodsServiceData[] = [
    {
      id: 1,
      name: $r('app.string.goods_service_1_name'),
      description: $r('app.string.goods_service_1_desc')
    },
    {
      id: 2,
      name: null,
      description: $r('app.string.goods_service_2_desc')
    },
    {
      id: 3,
      name: null,
      description: $r('app.string.goods_service_3_desc')
    }
  ];
}

