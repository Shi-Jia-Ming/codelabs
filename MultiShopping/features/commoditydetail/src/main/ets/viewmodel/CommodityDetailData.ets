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

class BarData {
  icon?: Resource;
  text?: Resource;
}

class Evaluate {
  userId?: string;
  userIcon?: string;
  userNumber?: string;
  rating?: number;
  desc?: string;
}

class UserEvaluate {
  title?: string;
  favorable?: string;
  evaluate?: Evaluate[];
}

const barData: BarData[] = [
  {
    icon: $r('app.media.ic_bar_share'),
    text: $r('app.string.share')
  },
  {
    icon: $r('app.media.ic_collect'),
    text: $r('app.string.collection')
  },
  {
    icon: $r('app.media.ic_price'),
    text: $r('app.string.reduction')
  }
]

const userEvaluate: UserEvaluate = {
  title: '用户评价（2万+）',
  favorable: '98%',
  evaluate: [
    {
      userId: '1',
      userIcon: 'common/ic_person.png',
      userNumber: '185****1937',
      rating: 5,
      desc: '和描述相符合，很喜欢，做工精致，颜色好看，原装正品。'
    },
    {
      userId: '2',
      userIcon: 'common/ic_person.png',
      userNumber: '185****1937',
      rating: 4,
      desc: '和描述相符合，很喜欢，做工精致，颜色好看，原装正品。'
    }
  ]
}

const moreEvaluate: Evaluate[] = [
  {
    userId: '3',
    userIcon: 'common/ic_person.png',
    userNumber: '185****1937',
    rating: 5,
    desc: '和描述相符合，很喜欢，做工精致，颜色好看，原装正品。'
  },
  {
    userId: '4',
    userIcon: 'common/ic_person.png',
    userNumber: '185****1937',
    rating: 5,
    desc: '和描述相符合，很喜欢，做工精致，颜色好看，原装正品。'
  },
  {
    userId: '5',
    userIcon: 'common/ic_person.png',
    userNumber: '185****1937',
    rating: 5,
    desc: '和描述相符合，很喜欢，做工精致，颜色好看，原装正品。'
  },
  {
    userId: '5',
    userIcon: 'common/ic_person.png',
    userNumber: '185****1937',
    rating: 4,
    desc: '和描述相符合，很喜欢，做工精致，颜色好看，原装正品。'
  },
  {
    userId: '6',
    userIcon: 'common/ic_person.png',
    userNumber: '185****1937',
    rating: 5,
    desc: '和描述相符合，很喜欢，做工精致，颜色好看，原装正品。'
  }
]

const serviceList = ['免运费（请以提交订单时为准）', '店铺发货&售后', '7天无理由退货']

export { userEvaluate, moreEvaluate, Evaluate, barData, BarData, serviceList }