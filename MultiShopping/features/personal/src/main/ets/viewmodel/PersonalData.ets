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

import { OrderType } from '@ohos/common';
import { IconButtonModel } from '../bean/IconButtonModel';

const orderButton: IconButtonModel[] = [
  new IconButtonModel(
    $r('app.media.ic_credit_card'),
    $r('app.string.pending_payment'),
    OrderType.PAYMENT,
    0
  ),
  new IconButtonModel(
    $r('app.media.ic_ship'),
    $r('app.string.pending_shipment'),
    OrderType.SHIP,
    0
  ),
  new IconButtonModel(
    $r('app.media.ic_flat'),
    $r('app.string.pending_receive'),
    OrderType.RECEIPT,
    0
  ),
  new IconButtonModel(
    $r('app.media.ic_evaluation'),
    $r('app.string.pending_evaluated'),
    OrderType.EVALUATION,
    0
  ),
  new IconButtonModel(
    $r('app.media.ic_sale'),
    $r('app.string.pending_after_sales'),
    OrderType.SALE,
    0
  )
]

const memberButton: IconButtonModel[] = [
  {
    icon: $r('app.media.ic_member'),
    text: $r('app.string.member_type')
  },
  {
    icon: $r('app.media.ic_score'),
    text: $r('app.string.bonus_store')
  },
  {
    icon: $r('app.media.ic_interact'),
    text: $r('app.string.interactive')
  },
  {
    icon: $r('app.media.ic_card'),
    text: $r('app.string.card_coupon')
  }
]

const activityButton: IconButtonModel[] = [
  {
    icon: $r('app.media.ic_official'),
    text: $r('app.string.official_service')
  },
  {
    icon: $r('app.media.ic_cash'),
    text: $r('app.string.cash')
  },
  {
    icon: $r('app.media.ic_trade'),
    text: $r('app.string.trade_in')
  },
  {
    icon: $r('app.media.ic_my_evaluation'),
    text: $r('app.string.my_evaluation')
  }
]

type LiveDataModel = {
  liveId: string,
  living: boolean,
  watchDesc: string,
  previewIcon: string,
  liverIcon: string,
  liverName: string,
  liverDesc: string
}

const liveData: LiveDataModel[] = [
  {
    'liveId': '1',
    'living': true,
    'watchDesc': '2.9万人观看',
    'previewIcon': 'common/food.png',
    'liverIcon': 'common/ic_person.png',
    'liverName': '首席美食家',
    'liverDesc': '带您品尝各地美食'
  },
  {
    'liveId': '2',
    'living': true,
    'watchDesc': '2.9万人观看',
    'previewIcon': 'common/scenery.png',
    'liverIcon': 'common/ic_person.png',
    'liverName': '大旅游家',
    'liverDesc': '带您走遍天下奇景'
  },
  {
    'liveId': '3',
    'living': false,
    'watchDesc': '0人观看',
    'previewIcon': 'common/food.png',
    'liverIcon': 'common/ic_person.png',
    'liverName': '首席美食家',
    'liverDesc': '带您品尝各地美食'
  },
  {
    'liveId': '4',
    'living': true,
    'watchDesc': '2.9万人观看',
    'previewIcon': 'common/scenery.png',
    'liverIcon': 'common/ic_person.png',
    'liverName': '大旅游家',
    'liverDesc': '带您走遍天下奇景'
  },
  {
    'liveId': '5',
    'living': true,
    'watchDesc': '2.9万人观看',
    'previewIcon': 'common/food.png',
    'liverIcon': 'common/ic_person.png',
    'liverName': '首席美食家',
    'liverDesc': '带您品尝各地美食'
  },
  {
    'liveId': '6',
    'living': true,
    'watchDesc': '2.9万人观看',
    'previewIcon': 'common/scenery.png',
    'liverIcon': 'common/ic_person.png',
    'liverName': '大旅游家',
    'liverDesc': '带您走遍天下奇景'
  },
  {
    'liveId': '7',
    'living': true,
    'watchDesc': '2.9万人观看',
    'previewIcon': 'common/food.png',
    'liverIcon': 'common/ic_person.png',
    'liverName': '首席美食家',
    'liverDesc': '带您品尝各地美食'
  },
  {
    'liveId': '8',
    'living': true,
    'watchDesc': '2.9万人观看',
    'previewIcon': 'common/scenery.png',
    'liverIcon': 'common/ic_person.png',
    'liverName': '大旅游家',
    'liverDesc': '带您走遍天下奇景'
  }
]

export { orderButton, memberButton, activityButton, liveData, LiveDataModel };