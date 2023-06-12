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

/**
 * Common constants for all features.
 */
export default class CommonConstants {
  /**
   * New home page routing.
   */
  static ROUTER_HOME_PAGE = 'pages/homePage/homePage';

  /**
   * All orders page routing.
   */
  static ROUTER_ALL_ORDERS = 'pages/allOrders/allOrders';

  /**
   * Sure order page routing.
   */
  static ROUTER_SURE_ORDER = 'pages/sureOrder/sureOrder';

  /**
   * Product details page routing.
   */
  static ROUTER_PRODUCT_DETAILS = 'pages/productDetails/productDetails';

  /**
   * Pending payment page routing.
   */
  static ROUTER_PENDING_PAYMENT = 'pages/pendingPayment/pendingPayment';

  /**
   * Main page index.
   */
  static  HOME_PAGE_INDEX = 1;

  /**
   * New product page index.
   */
  static NEW_PRODUCT_INDEX = 2;

  /**
   * Shopping cart page index.
   */
  static SHOPPING_CART_INDEX = 3;

  /**
   * My page index.
   */
  static MY_INFO_INDEX = 4;

  /**
   * Start page countdown seconds.
   */
  static COUNTDOWN = 2;

  /**
   * All statuses of the order.
   */
  static tabBarList = [
    'strings.all',
    'strings.await_payment',
    'strings.pending_shipment',
    'strings.to_be_received',
    'strings.To_be_evaluated'
  ];

  /**
   * Data in the tab bar on the home page.
   */
  static HOME_TAB_DATA = [
    'strings.home_page',
    'strings.mobile_phone',
    'strings.food',
    'strings.menswear',
    'strings.fresh',
    'strings.furniture_kitchenware'
  ];

  /**
   * Home page swiper data.
   */
  static HOME_SWIPER_DATA = [
    '/common/images/home/ic_banner01.png',
    '/common/images/home/ic_banner02.png',
    '/common/images/home/ic_banner03.png',
    '/common/images/home/ic_banner04.png',
    '/common/images/home/ic_banner05.png'
  ];

  /**
   * Default search on the home page.
   */
  static HOME_SEARCH_HINT = '儿童餐椅';

  /**
   * Button text of the search bar on the home page.
   */
  static SEARCH_BUTTON_TEXT = '搜索';

  /**
   * Subtitles recommended on the home page.
   */
  static CONTENT_TITLE_DATA = [
    {
      title: 'strings.all',
      subtitle: 'strings.to_recommend_you'
    },
    {
      title: 'strings.featured',
      subtitle: 'strings.find_good_stuff'
    },
    {
      title: 'strings.new_product',
      subtitle: 'strings.new_product_launch'
    },
    {
      title: 'strings.substantial',
      subtitle: 'strings.cheap_good'
    }
  ];

  /**
   * Subtitles recommended on the home page.
   */
  static CONTENT_LIST_DATA = [
    {
      title: 'strings.new_product_offers',
      subtitle: 'strings.limited_time',
      newPrice: '¥199',
      oldPrice: '¥299',
      tag: 'strings.new_product',
      image: '/common/images/home/ic_product1.png'
    },
    {
      title: 'strings.quick_purchase',
      subtitle: 'strings.limited_time',
      newPrice: '¥199',
      tag: 'strings.limit_time',
      image: '/common/images/home/ic_product2.png'
    },
    {
      title: 'strings.new_product_offers',
      subtitle: 'strings.limited_time',
      newPrice: '¥199',
      oldPrice: '¥299',
      tag: 'strings.new_product',
      image: '/common/images/home/ic_product3.png'
    },
    {
      title: 'strings.quick_purchase',
      subtitle: 'strings.limited_time',
      newPrice: '¥199',
      tag: 'strings.limit_time',
      image: '/common/images/home/ic_product4.png'
    }
  ];

  /**
   * Generic Number of My Pages.
   */
  static COMMON_QUANTITY = [
    {
      num: 0,
      title: 'strings.bonus_point'
    },
    {
      num: 0,
      title: 'strings.coupon'
    },
    {
      num: 0,
      title: 'strings.cash_coupon'
    }
  ];

  /**
   * Order status array on my page.
   */
  static ORDER_STATUS_LIST = [
    {
      image: '/common/images/my/ic_credit_card.png',
      title: 'strings.await_payment'
    },
    {
      image: '/common/images/my/ic_ship.png',
      title: 'strings.to_be_shipped'
    },
    {
      image: '/common/images/my/ic_flat.png',
      title: 'strings.to_be_received'
    },
    {
      image: '/common/images/my/ic_evaluation.png',
      title: 'strings.To_be_evaluated'
    },
    {
      image: '/common/images/my/ic_sale.png',
      title: 'strings.refund'
    }
  ];

  /**
   * My page member array.
   */
  static MEMBER_LIST = [
    {
      image: '/common/images/my/ic_member.png',
      title: 'strings.member_channel'
    },
    {
      image: '/common/images/my/ic_score.png',
      title: 'strings.bonus_point_mall'
    },
    {
      image: '/common/images/my/ic_interact.png',
      title: 'strings.interactive_courtesy'
    },
    {
      image: '/common/images/my/ic_card.png',
      title: 'strings.card_coupon'
    }
  ];

  /**
   * My page customer array.
   */
  static CUSTOMER_LIST = [
    {
      image: '/common/images/my/ic_official.png',
      title: 'strings.official_customer_service'
    },
    {
      image: '/common/images/my/ic_cash.png',
      title: 'strings.cash_red_envelope'
    },
    {
      image: '/common/images/my/ic_trade.png',
      title: 'strings.trade_in'
    },
    {
      image: '/common/images/my/ic_my_evaluation.png',
      title: 'strings.my_rating'
    }
  ];

  /**
   * My page my order box.
   */
  static MY_ORDER = ['strings.my_order', 'strings.all_orders'];

  /**
   * My page my frequent watch live box.
   */
  static SEE_OFTEN = ['strings.watch_live_broadcast', 'strings.see_more'];

  /**
   * My page live card.
   */
  static LIVE_PICTURES_CARD = [
    {
      name: 'strings.chief_foodie',
      image: '/common/images/my/ic_live_pictures1.png',
      liveBroadcastStatus: 'strings.live_broadcast',
      viewersNumber: 'strings.Number_viewers_first'
    },
    {
      name: 'strings.big_tourist_home',
      image: '/common/images/my/ic_live_pictures2.png',
      liveBroadcastStatus: 'strings.live_broadcast',
      viewersNumber: 'strings.Number_viewers_first'
    },
    {
      name: 'strings.big_tourist_home',
      image: '/common/images/my/ic_live_pictures2.png',
      liveBroadcastStatus: 'strings.live_broadcast',
      viewersNumber: 'strings.Number_viewers_second'
    },
    {
      name: 'strings.chief_foodie',
      image: '/common/images/my/ic_live_pictures1.png',
      liveBroadcastStatus: 'strings.live_broadcast',
      viewersNumber: 'strings.Number_viewers_second'
    }
  ];

  /**
   * Tab bar array on the new product page.
   */
  static PRODUCT_TAB_DATA = [
    'strings.featured',
    'strings.mobile_phone',
    'strings.dress',
    'strings.wear_and_tie',
    'strings.home_appliance'
  ];

  /**
   * New product page swiper data.
   */
  static PRODUCT_SWIPER_DATA = [
    '/common/images/home/ic_banner05.png',
    '/common/images/home/ic_banner04.png',
    '/common/images/home/ic_banner03.png',
    '/common/images/home/ic_banner02.png',
    '/common/images/home/ic_banner01.png'
  ];

  /**
   * New Product Page Product List.
   */
  static PRODUCT_LIST = [
    {
      image: '/common/images/newProduct/ic_new_product1.png',
      userIcon: '/common/images/productDetails/ic_profile_picture1.png',
      title: 'strings.water_heater_new',
      tag: '',
      userName: 'strings.from_ser'
    },
    {
      image: '/common/images/newProduct/ic_new_product2.png',
      userIcon: '/common/images/productDetails/ic_profile_picture2.png',
      title: 'strings.coffee_new_products',
      tag: 'strings.quick_experience',
      userName: 'strings.from_user_second'
    },
    {
      image: '/common/images/newProduct/ic_new_product3.png',
      userIcon: '/common/images/productDetails/ic_profile_picture1.png',
      title: 'strings.other_new_products',
      tag: 'strings.quick_experience',
      userName: 'strings.from_ser'
    },
    {
      image: '/common/images/newProduct/ic_new_product1.png',
      userIcon: '/common/images/productDetails/ic_profile_picture2.png',
      title: 'strings.other_new_products',
      tag: '',
      userName: 'strings.from_user_second'
    },
    {
      image: '/common/images/newProduct/ic_new_product1.png',
      userIcon: '/common/images/productDetails/ic_profile_picture1.png',
      title: 'strings.water_heater_new',
      tag: '',
      userName: 'strings.from_ser'
    },
    {
      image: '/common/images/newProduct/ic_new_product2.png',
      userIcon: '/common/images/productDetails/ic_profile_picture2.png',
      title: 'strings.coffee_new_products',
      tag: 'strings.quick_experience',
      userName: 'strings.from_user_second'
    },
    {
      image: '/common/images/newProduct/ic_new_product3.png',
      userIcon: '/common/images/productDetails/ic_profile_picture1.png',
      title: 'strings.other_new_products',
      tag: 'strings.quick_experience',
      userName: 'strings.from_ser'
    },
    {
      image: '/common/images/newProduct/ic_new_product1.png',
      userIcon: '/common/images/productDetails/ic_profile_picture2.png',
      title: 'strings.other_new_products',
      tag: '',
      userName: 'strings.from_user_second'
    }
  ];

  /**
   * Price information on the to-be-paid page.
   */
  static PRICE_INFO = [
    {
      title: 'strings.total_commodity_price',
      price: '¥2399'
    },
    {
      title: 'strings.freight',
      price: '¥0.00'
    },
    {
      title: 'strings.actual_payment',
      price: '¥2399'
    }
  ];

  /**
   * Swiper list on the product details page.
   */
  static DETAILS_SWIPER_DATA = [
    '/common/images/productDetails/ic_product1.png',
    '/common/images/productDetails/ic_product2.png',
    '/common/images/productDetails/ic_product1.png',
    '/common/images/productDetails/ic_product2.png'
  ];


  /**
   * Information on the product details page.
   */
  static PRODUCT_DETAILS_INFO = {
    num: 1,
    price: '¥ 2399',
    phonePicture: '/common/images/productDetails/ic_product1.png',
    decreaseDisableIcon: '/common/images/productDetails/ic_decrease_disable.png',
    decreaseIcon: '/common/images/productDetails/ic_decrease.png',
    increaseIcon: '/common/images/productDetails/ic_increase.png'
  };


  /**
   * Optional product parameters on the product details page.
   */
  static PRODUCT_INFO_LIST = [
    {
      title: 'strings.colour',
      content: ['strings.shell_white', 'strings.ice_crystal_blue', 'strings.illusion_black']
    },
    {
      title: 'strings.version',
      content: ['8GB+128GB', '8GB+128GB', '8GB+256GB']
    },
    {
      title: 'strings.network_standard',
      content: ['strings.full_frequency']
    },
    {
      title: 'strings.type',
      content: ['strings.official_standard']
    },
    {
      title: 'strings.quantity',
      content: []
    }
  ];


  /**
   * Product details page sharing box.
   */
  static WIDGETS_DATA = [
    {
      icon: '/common/images/productDetails/ic_shares.png',
      content: 'strings.share'
    },
    {
      icon: '/common/images/productDetails/ic_favorites.png',
      content: 'strings.favorites'
    },
    {
      icon: '/common/images/productDetails/ic_price_cut.png',
      content: 'strings.price_reduction_notice'
    }
  ];


  /**
   * Product details page image.
   */
  static PRODUCT_DETAILS_ICON = {
    addressIcon: '/common/images/productDetails/ic_position.png',
    moreIcon: '/common/images/productDetails/ic_more.png',
    homeIcon: '/common/images/productDetails/ic_home.png',
    shoppingCartICon: '/common/images/productDetails/ic_shopping_cart.png'
  };


  /**
   * Other box list data on the product details page.
   */
  static OTHER_LIST = [
    {
      icon: '/common/images/productDetails/ic_right.png',
      content: 'strings.free_shipping'
    },
    {
      icon: '/common/images/productDetails/ic_right.png',
      content: 'strings.store_shipment'
    },
    {
      icon: '/common/images/productDetails/ic_right.png',
      content: 'strings.return_without_reason'
    }
  ];

  /**
   * Product review list on the product details page.
   */
  static REVIEW_LIST_DATA = [
    {
      userIcon: '/common/images/productDetails/ic_profile_picture1.png',
      tel: '188****1765',
      redStarsNumber: [1, 2, 3, 4, 5],
      redStarsIcon: '/common/images/productDetails/ic_red_star.png',
      content: 'strings.user_comments_contents'
    },
    {
      userIcon: '/common/images/productDetails/ic_profile_picture2.png',
      tel: '188****1765',
      redStarsNumber: [1, 2, 3, 4, 5],
      redStarsIcon: '/common/images/productDetails/ic_red_star.png',
      content: 'strings.user_comments_contents'
    },
    {
      userIcon: '/common/images/productDetails/ic_profile_picture1.png',
      tel: '188****1765',
      redStarsNumber: [1, 2, 3],
      redStarsIcon: '/common/images/productDetails/ic_red_star.png',
      content: 'strings.user_comments_contents'
    },
    {
      userIcon: '/common/images/productDetails/ic_profile_picture2.png',
      tel: '188****1765',
      redStarsNumber: [1, 2],
      redStarsIcon: '/common/images/productDetails/ic_red_star.png',
      content: 'strings.user_comments_contents'
    }
  ];

  /**
   * Shopping information is added to the shopping cart page..
   */
  static SHOPPING_LIST_DATA = [
    {
      isSelect: false,
      image: '/common/images/shoppingCart/ic_product.png',
      title: 'strings.hw_product_title',
      subtitle: 'strings.hw_product_subtitle',
      price: '¥ 2399',
      num: 0
    },
    {
      isSelect: false,
      image: '/common/images/shoppingCart/ic_product.png',
      title: 'strings.hw_product_title',
      subtitle: 'strings.hw_product_subtitle',
      price: '¥ 2399',
      num: 1
    },
    {
      isSelect: false,
      image: '/common/images/shoppingCart/ic_product.png',
      title: 'strings.hw_product_title',
      subtitle: 'strings.hw_product_subtitle',
      price: '¥ 2399',
      num: 2
    }
  ];

  /**
   * Public image of the shopping cart page.
   */
  static SHOPPING_CART_ICON = {
    decreaseDisableIcon: '/common/images/productDetails/ic_decrease_disable.png',
    decreaseIcon: '/common/images/productDetails/ic_decrease.png',
    increaseIcon: '/common/images/productDetails/ic_increase.png'
  };

  /**
   * Confirm the order price of the selected item on the order page.
   */
  static ORDER_PRICE = '¥ 2399.00';

  /**
   * Common button subcomponent.
   */
  static BUTTON_LIST = ['strings.cancel_order', 'strings.modify_order', 'strings.to_pay'];

  /**
   * Image of the common bottom navigation bar subcomponent.
   */
  static COMMON_TOOLBAR_ICON = {
    home: '/common/images/other/ic_home.png',
    newProduct: '/common/images/other/ic_new_product.png',
    shoppingCart: '/common/images/other/ic_shopping_cart.png',
    me: '/common/images/other/ic_me.png',
    homeDisable: '/common/images/other/ic_home_disable.png',
    newProductDisable: '/common/images/other/ic_new_product_disable.png',
    shoppingCartDisable: '/common/images/other/ic_shopping_cart_disable.png',
    meDisable: '/common/images/other/ic_me_disable.png'
  };

  /**
   * Image name of the common bottom navigation bar subcomponent.
   */
  static COMMON_TOOLBAR_NAME = {
    home: 'strings.public_home_page',
    newProduct: 'strings.new_product',
    shoppingCart: 'strings.shopping_cart',
    me: 'strings.me'
  };

  /**
   * Guess you like the box card data list.
   */
  static LIKE_CARD_DATA = [
    {
      image: '/common/images/shoppingCart/ic_product1.png',
      title: 'strings.first_product_title',
      tag: 'strings.bonus_points',
      price: '¥ 199',
      reviewNum: 'strings.evaluations_number',
      positiveReviews: 'strings.percentage_positive_reviews'
    },
    {
      image: '/common/images/shoppingCart/ic_product2.png',
      title: 'strings.second_product_title',
      tag: 'strings.bonus_points',
      price: '¥ 199',
      reviewNum: 'strings.evaluations_number',
      positiveReviews: 'strings.percentage_positive_reviews'
    },
    {
      image: '/common/images/shoppingCart/ic_product3.png',
      title: 'strings.third_product_title',
      tag: 'strings.bonus_points',
      price: '¥ 1999',
      reviewNum: 'strings.evaluations_number',
      positiveReviews: 'strings.percentage_positive_reviews'
    },
    {
      image: '/common/images/shoppingCart/ic_product4.png',
      title: 'strings.third_product_title',
      tag: 'strings.bonus_points',
      price: '¥ 99',
      reviewNum: 'strings.evaluations_number',
      positiveReviews: 'strings.percentage_positive_reviews'
    }
  ];

  /**
   * Product purchase price.
   */
  static PRODUCT_PRICE = '¥2399';

  /**
   * Product purchase quantity.
   */
  static PRODUCT_QUANTITY = 'X1';


  /**
   * Sliding panel type status.
   */
  static PANEL_STATUS_MINI = 'mini';

  /**
   * ID of the slidAble panel.
   */
  static PANEL_ID = 'panelId';

  /**
   * Public icons.
   */
  static COMMON_ICON = {
    back: '/common/images/pendingPayment/ic_back.png',
    userLocal: '/common/images/pendingPayment/ic_local.png',
    more: '/common/images/pendingPayment/ic_more.png',
    market: '/common/images/pendingPayment/ic_market_icon.png',
    product: '/common/images/pendingPayment/ic_product.png',
    rightArrow: '/common/images/my/ic_right_arrow.png',
    greyRightArrow: '/common/images/productDetails/ic_right_arrow.png',
    backgroundColorBack: '/common/images/productDetails/ic_back.png',
    share: '/common/images/productDetails/ic_share.png',
    eshop: '/common/images/home/ic_eshop.png',
    scan: '/common/images/home/ic_scan.png',
    splitLine: '/common/images/home/ic_split_line.png',
    moreWhite: '/common/images/home/ic_more.png',
    setting: '/common/images/my/ic_setting.png',
    person: '/common/images/my/ic_person.png',
    rightArrowWhite: '/common/images/my/ic_arrow_right.png',
    splitLineBlack: '/common/images/newProduct/ic_line_black.png',
    moreBlack: '/common/images/newProduct/ic_more_black.png'
  };

  /**
   * Recipient's mobile number.
   */
  static USER_TEL = '18512345678';

}