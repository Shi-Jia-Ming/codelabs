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

import { Commodity } from './CommodityModel';
import { Order } from './OrderModel';
import { Product } from './ProductModel';

/**
 * Application simulation data can be obtained from the server by developers.
 */
const commodityData: Commodity[] = [
  {
    detail: ["common/product001.png"],
    specifications: [
      {
        id: '颜色',
        title: '颜色',
        data: [
          { key: '深邃黑', value: '深邃黑', image: '' },
          { key: '珠光白', value: '珠光白', image: '' },
          { key: '宝石蓝', value: '宝石蓝', image: '' }
        ]
      },
      {
        id: '版本',
        title: '版本',
        data: [
          { key: '8+128G', value: '8+128G', image: '' },
          { key: '8+256G', value: '8+256G', image: '' },
          { key: '12+512G', value: '12+512G', image: '' }
        ]
      },
      {
        id: '网络制式',
        title: '网络制式',
        data: [
          { key: '4G全网通', value: '4G全网通', image: '' },
          { key: '5G全网通', value: '5G全网通', image: '' }
        ]
      },
      {
        id: '类型',
        title: '类型',
        data: [
          { key: '官方标配', value: '官方标配', image: '' },
          { key: '5G全网通', value: '5G全网通', image: '' }
        ]
      }
    ],
    category_id: "1",
    price: 6399,
    title: "XXXX40 Pro",
    images: ["common/product001.png"],
    id: "1",
    description: "XXXX Pro 5G手机",
    promotion: "新品"
  },
  {
    detail: ["common/product002.png"],
    specifications: [
      {
        id: '颜色',
        title: '颜色',
        data: [
          { key: '深邃黑', value: '深邃黑', image: '' },
          { key: '珠光白', value: '珠光白', image: '' },
          { key: '宝石蓝', value: '宝石蓝', image: '' }
        ]
      },
      {
        id: '版本',
        title: '版本',
        data: [
          { key: '8+128G', value: '8+128G', image: '' },
          { key: '8+256G', value: '8+256G', image: '' },
          { key: '12+512G', value: '12+512G', image: '' }
        ]
      },
      {
        id: '网络制式',
        title: '网络制式',
        data: [
          { key: '4G全网通', value: '4G全网通', image: '' },
          { key: '5G全网通', value: '5G全网通', image: '' }
        ]
      },
      {
        id: '类型',
        title: '类型',
        data: [
          { key: '官方标配', value: '官方标配', image: '' },
          { key: '5G全网通', value: '5G全网通', image: '' }
        ]
      }
    ],
    category_id: "1",
    price: 5199,
    title: "XXXXBook 13",
    images: ["common/product002.png"],
    id: "2",
    description: "XX笔记本电脑XXXXBook 13 11代酷睿",
    promotion: "新品"
  },
  {
    detail: ["common/product003.png"],
    specifications: [
      {
        id: '颜色',
        title: '颜色',
        data: [
          { key: '黑色', value: '黑色', image: '' },
          { key: '白色', value: '白色', image: '' }
        ]
      },
      {
        id: '版本',
        title: '版本',
        data: [
          { key: '8+128G', value: '8+128G', image: '' },
          { key: '8+256G', value: '8+256G', image: '' },
          { key: '12+512G', value: '12+512G', image: '' }
        ]
      },
      {
        id: '网络制式',
        title: '网络制式',
        data: [
          { key: '4G全网通', value: '4G全网通', image: '' },
          { key: '5G全网通', value: '5G全网通', image: '' }
        ]
      },
      {
        id: '类型',
        title: '类型',
        data: [
          { key: '官方标配', value: '官方标配', image: '' },
          { key: '5G全网通', value: '5G全网通', image: '' }
        ]
      }
    ],
    category_id: "3",
    price: 6588,
    title: "PXX40 Pro",
    images: ["common/product003.png"],
    id: "3",
    description: "PXX40 Pro 5G手机 支持XXXOS",
    promotion: "限时"
  },
  {
    detail: ["common/product004.png"],
    specifications: [
      {
        id: '颜色',
        title: '颜色',
        data: [
          { key: '深邃黑', value: '深邃黑', image: '' },
          { key: '珠光白', value: '珠光白', image: '' },
          { key: '宝石蓝', value: '宝石蓝', image: '' }
        ]
      },
      {
        id: '版本',
        title: '版本',
        data: [
          { key: '8+128G', value: '8+128G', image: '' },
          { key: '8+256G', value: '8+256G', image: '' },
          { key: '12+512G', value: '12+512G', image: '' }
        ]
      },
      {
        id: '网络制式',
        title: '网络制式',
        data: [
          { key: '4G全网通', value: '4G全网通', image: '' },
          { key: '5G全网通', value: '5G全网通', image: '' }
        ]
      },
      {
        id: '类型',
        title: '类型',
        data: [
          { key: '官方标配', value: '官方标配', image: '' },
          { key: '5G全网通', value: '5G全网通', image: '' }
        ]
      }
    ],
    category_id: '',
    price: 3999,
    title: "XXXX30 Pro",
    images: ["common/product004.png"],
    id: "4",
    description: "XXXX30 Pro 超长续航 支持XXXOS系统",
    promotion: "新品"
  },
  {
    detail: ["common/product005.png"],
    specifications: [
      {
        id: '颜色',
        title: '颜色',
        data: [
          { key: '黑色', value: '黑色', image: '' },
          { key: '白色', value: '白色', image: '' }
        ]
      },
      {
        id: '版本',
        title: '版本',
        data: [
          { key: '8+128G', value: '8+128G', image: '' },
          { key: '8+256G', value: '8+256G', image: '' },
          { key: '12+512G', value: '12+512G', image: '' }
        ]
      },
      {
        id: '网络制式',
        title: '网络制式',
        data: [
          { key: '4G全网通', value: '4G全网通', image: '' },
          { key: '5G全网通', value: '5G全网通', image: '' }
        ]
      },
      {
        id: '类型',
        title: '类型',
        data: [
          { key: '官方标配', value: '官方标配', image: '' },
          { key: '5G全网通', value: '5G全网通', image: '' }
        ]
      }
    ],
    category_id: '',
    price: 1899,
    title: "XX20e",
    images: ["common/product005.png"],
    id: "5",
    description: "XX 5000mAh大电池 6.3英寸高清大屏",
    promotion: "赠送积分"
  },
  {
    detail: ["common/product006.png"],
    specifications: [
      {
        id: '颜色',
        title: '颜色',
        data: [
          { key: '深邃黑', value: '深邃黑', image: '' },
          { key: '珠光白', value: '珠光白', image: '' },
          { key: '宝石蓝', value: '宝石蓝', image: '' }
        ]
      },
      {
        id: '版本',
        title: '版本',
        data: [
          { key: '8+128G', value: '8+128G', image: '' },
          { key: '8+256G', value: '8+256G', image: '' },
          { key: '12+512G', value: '12+512G', image: '' }
        ]
      },
      {
        id: '网络制式',
        title: '网络制式',
        data: [
          { key: '4G全网通', value: '4G全网通', image: '' },
          { key: '5G全网通', value: '5G全网通', image: '' }
        ]
      },
      {
        id: '类型',
        title: '类型',
        data: [
          { key: '官方标配', value: '官方标配', image: '' },
          { key: '5G全网通', value: '5G全网通', image: '' }
        ]
      }
    ],
    category_id: '',
    price: 2199,
    title: "XX20 Plus",
    images: ["common/product006.png"],
    id: "6",
    description: "40W超级快充 90Hz高刷新率",
    promotion: "新品"
  },
  {
    detail: ["common/product006.png"],
    specifications: [
      {
        id: '颜色',
        title: '颜色',
        data: [
          { key: '黑色', value: '黑色', image: '' },
          { key: '白色', value: '白色', image: '' }
        ]
      },
      {
        id: '版本',
        title: '版本',
        data: [
          { key: '8+128G', value: '8+128G', image: '' },
          { key: '8+256G', value: '8+256G', image: '' },
          { key: '12+512G', value: '12+512G', image: '' }
        ]
      },
      {
        id: '网络制式',
        title: '网络制式',
        data: [
          { key: '4G全网通', value: '4G全网通', image: '' },
          { key: '5G全网通', value: '5G全网通', image: '' }
        ]
      },
      {
        id: '类型',
        title: '类型',
        data: [
          { key: '官方标配', value: '官方标配', image: '' },
          { key: '5G全网通', value: '5G全网通', image: '' }
        ]
      }
    ],
    category_id: "1",
    price: 3299,
    title: "XXXX7 Pro",
    images: ["common/product006.png"],
    id: "7",
    description: "XX手机 5000W高清后置拍摄",
    promotion: "限时"
  },
  {
    detail: ["common/product006.png"],
    specifications: [
      {
        id: '颜色',
        title: '颜色',
        data: [
          { key: '深邃黑', value: '深邃黑', image: '' },
          { key: '珠光白', value: '珠光白', image: '' },
          { key: '宝石蓝', value: '宝石蓝', image: '' }
        ]
      },
      {
        id: '版本',
        title: '版本',
        data: [
          { key: '8+128G', value: '8+128G', image: '' },
          { key: '8+256G', value: '8+256G', image: '' },
          { key: '12+512G', value: '12+512G', image: '' }
        ]
      },
      {
        id: '网络制式',
        title: '网络制式',
        data: [
          { key: '4G全网通', value: '4G全网通', image: '' },
          { key: '5G全网通', value: '5G全网通', image: '' }
        ]
      },
      {
        id: '类型',
        title: '类型',
        data: [
          { key: '官方标配', value: '官方标配', image: '' },
          { key: '5G全网通', value: '5G全网通', image: '' }
        ]
      }
    ],
    category_id: "1",
    price: 12999,
    title: "XXXX xs2",
    images: ["common/product006.png"],
    id: "8",
    description: "XX曲面屏手机 内翻铰链设计",
    promotion: "赠送积分"
  },
  {
    detail: ["common/product003.png"],
    specifications: [
      {
        id: '颜色',
        title: '颜色',
        data: [
          { key: '黑色', value: '黑色', image: '' },
          { key: '白色', value: '白色', image: '' }
        ]
      },
      {
        id: '版本',
        title: '版本',
        data: [
          { key: '8+128G', value: '8+128G', image: '' },
          { key: '8+256G', value: '8+256G', image: '' },
          { key: '12+512G', value: '12+512G', image: '' }
        ]
      },
      {
        id: '网络制式',
        title: '网络制式',
        data: [
          { key: '4G全网通', value: '4G全网通', image: '' },
          { key: '5G全网通', value: '5G全网通', image: '' }
        ]
      },
      {
        id: '类型',
        title: '类型',
        data: [
          { key: '官方标配', value: '官方标配', image: '' },
          { key: '5G全网通', value: '5G全网通', image: '' }
        ]
      }
    ],
    category_id: "3",
    price: 6588,
    title: "PXX40 Pro",
    images: ["common/product003.png"],
    id: "9",
    description: "PXX40 Pro 5G手机 支持XXXOS",
    promotion: "限时"
  },
  {
    detail: ["common/product004.png"],
    specifications: [
      {
        id: '颜色',
        title: '颜色',
        data: [
          { key: '深邃黑', value: '深邃黑', image: '' },
          { key: '珠光白', value: '珠光白', image: '' },
          { key: '宝石蓝', value: '宝石蓝', image: '' }
        ]
      },
      {
        id: '版本',
        title: '版本',
        data: [
          { key: '8+128G', value: '8+128G', image: '' },
          { key: '8+256G', value: '8+256G', image: '' },
          { key: '12+512G', value: '12+512G', image: '' }
        ]
      },
      {
        id: '网络制式',
        title: '网络制式',
        data: [
          { key: '4G全网通', value: '4G全网通', image: '' },
          { key: '5G全网通', value: '5G全网通', image: '' }
        ]
      },
      {
        id: '类型',
        title: '类型',
        data: [
          { key: '官方标配', value: '官方标配', image: '' },
          { key: '5G全网通', value: '5G全网通', image: '' }
        ]
      }
    ],
    category_id: '',
    price: 3999,
    title: "XXXX30 Pro",
    images: ["common/product004.png"],
    id: "10",
    description: "XXXX30 Pro 超长续航 支持XXXOS系统",
    promotion: "新品"
  },
  {
    detail: ["common/product003.png"],
    specifications: [
      {
        id: '颜色',
        title: '颜色',
        data: [
          { key: '黑色', value: '黑色', image: '' },
          { key: '白色', value: '白色', image: '' }
        ]
      },
      {
        id: '版本',
        title: '版本',
        data: [
          { key: '8+128G', value: '8+128G', image: '' },
          { key: '8+256G', value: '8+256G', image: '' },
          { key: '12+512G', value: '12+512G', image: '' }
        ]
      },
      {
        id: '网络制式',
        title: '网络制式',
        data: [
          { key: '4G全网通', value: '4G全网通', image: '' },
          { key: '5G全网通', value: '5G全网通', image: '' }
        ]
      },
      {
        id: '类型',
        title: '类型',
        data: [
          { key: '官方标配', value: '官方标配', image: '' },
          { key: '5G全网通', value: '5G全网通', image: '' }
        ]
      }
    ],
    category_id: "3",
    price: 6588,
    title: "PXX40 Pro",
    images: ["common/product003.png"],
    id: "11",
    description: "PXX40 Pro 5G手机 支持XXXOS",
    promotion: "限时"
  },
  {
    detail: ["common/product006.png"],
    specifications: [
      {
        id: '颜色',
        title: '颜色',
        data: [
          { key: '黑色', value: '黑色', image: '' },
          { key: '白色', value: '白色', image: '' }
        ]
      },
      {
        id: '版本',
        title: '版本',
        data: [
          { key: '8+128G', value: '8+128G', image: '' },
          { key: '8+256G', value: '8+256G', image: '' },
          { key: '12+512G', value: '12+512G', image: '' }
        ]
      },
      {
        id: '网络制式',
        title: '网络制式',
        data: [
          { key: '4G全网通', value: '4G全网通', image: '' },
          { key: '5G全网通', value: '5G全网通', image: '' }
        ]
      },
      {
        id: '类型',
        title: '类型',
        data: [
          { key: '官方标配', value: '官方标配', image: '' },
          { key: '5G全网通', value: '5G全网通', image: '' }
        ]
      }
    ],
    category_id: "1",
    price: 3299,
    title: "XXXX7 Pro",
    images: ["common/product006.png"],
    id: "12",
    description: "XX手机 5000W高清后置拍摄",
    promotion: "限时"
  }
]

const shopCartData: Product[] = [
  {
    uid: "1",
    update_time: "2022-12-21T03:34:01.962Z",
    count: 1,
    create_time: "2022-11-02T02:42:31.338Z",
    price: 6399,
    name: "XXXX40 Pro",
    id: "6063101776955",
    commodityId: "1",
    img: ["common/product001.png"],
    selected: false,
    specifications: [
      { name: '颜色', value: '珠光白' },
      { name: '规格', value: '8+256G' }
    ],
    description: "XXXX40 Pro 5G手机"
  },
  {
    uid: "1",
    update_time: "2022-12-21T03:34:02.042Z",
    count: 1,
    create_time: "2022-11-03T03:14:33.407Z",
    price: 6588,
    name: "PXX40 Pro",
    id: "7726602128445",
    commodityId: "3",
    img: ["common/product003.png"],
    selected: false,
    specifications: [
      { name: '颜色', value: '深邃黑' },
      { name: '规格', value: '8+128G' }
    ],
    description: "PXX40 Pro 5G手机 支持XXXOS"
  }
]

const orderData: Order[] = [
  {
    amount: 2099,
    createTime: "2022-11-01T09:39:34.442Z",
    orderTime: "2022-11-01T09:39:34.442Z",
    payTime: "2022-11-01T09:40:07.453Z",
    uid: "1",
    updateTime: "2022-11-01T09:40:07.453Z",
    price: 6588,
    count: 2,
    title: "PXX40 Pro",
    commodityId: 3,
    image: "common/product003.png",
    orderId: "2675124576927",
    status: 2,
    specifications: [
      { name: '颜色', value: '宝石蓝' },
      { name: '规格', value: '12+512G' }
    ],
    description: "XXX40 Pro 5G手机 支持HarmonyOS"
  },
  {
    amount: 6399,
    createTime: "2022-11-02T11:33:03.414Z",
    orderTime: "2022-11-02T11:33:03.414Z",
    payTime: "2022-11-10T02:15:17.360Z",
    uid: "1",
    updateTime: "2022-11-10T02:15:17.360Z",
    price: 6399,
    count: 1,
    title: "XXXX40 Pro",
    commodityId: 1,
    image: "common/product001.png",
    orderId: "8189683677531",
    status: 2,
    specifications: [
      { name: '颜色', value: '宝石蓝' },
      { name: '规格', value: '12+512G' }
    ],
    description: "XXXX40 Pro 5G手机"
  },
  {
    amount: 6399,
    createTime: "2022-11-01T11:23:51.857Z",
    orderTime: "2022-11-01T11:23:51.857Z",
    payTime: "2022-11-01T11:40:48.365Z",
    uid: "1",
    updateTime: "2022-11-01T11:40:48.365Z",
    price: 6399,
    count: 1,
    title: "XXXX40 Pro",
    commodityId: 1,
    image: "common/product001.png",
    orderId: "8479164261530",
    status: 1,
    specifications: [
      { name: '颜色', value: '珠光白' },
      { name: '规格', value: '8+256G' }
    ],
    description: "XXXX40 Pro 5G手机"
  },
  {
    amount: 6399,
    createTime: "2022-10-31T08:24:41.675Z",
    orderTime: "2022-10-31T08:24:41.675Z",
    payTime: "2022-11-02T12:08:50.869Z",
    uid: "1",
    updateTime: "2022-11-02T12:08:50.869Z",
    price: 6399,
    count: 1,
    title: "XXXX40 Pro",
    commodityId: 1,
    image: "common/product001.png",
    orderId: "7068271460267",
    status: 2,
    specifications: [
      { name: '颜色', value: '深邃黑' },
      { name: '规格', value: '8+256G' }
    ],
    description: "XXXX40 Pro 5G手机"
  },
  {
    amount: 9999,
    createTime: "2022-11-03T08:12:16.761Z",
    orderTime: "2022-11-03T08:12:16.761Z",
    payTime: "2022-11-03T08:12:50.130Z",
    uid: "1",
    updateTime: "2022-11-03T08:12:50.130Z",
    price: 5199,
    count: 1,
    title: "XXXXBook 13",
    commodityId: 2,
    image: "common/product002.png",
    orderId: "3716463840116",
    status: 2,
    specifications: [
      { name: '颜色', value: '宝石蓝' },
      { name: '规格', value: '12+512G' }
    ],
    description: "XX笔记本电脑XXXXBook 13 11代酷睿"
  },
  {
    amount: 6399,
    createTime: "2022-10-31T12:28:33.027Z",
    orderTime: "2022-10-31T12:28:33.027Z",
    payTime: "2022-11-01T09:54:31.241Z",
    uid: "1",
    updateTime: "2022-11-01T09:54:31.241Z",
    price: 6399,
    count: 1,
    title: "XXXX40 Pro",
    commodityId: 1,
    image: "common/product001.png",
    orderId: "1691138712761",
    status: 1,
    specifications: [
      { name: '颜色', value: '宝石蓝' },
      { name: '规格', value: '12+512G' }
    ],
    description: "XXXX40 Pro 5G手机"
  },
  {
    amount: 6399,
    createTime: "2022-12-21T03:34:09.556Z",
    orderTime: "2022-12-21T03:34:09.556Z",
    payTime: "2022-12-21T03:35:03.096Z",
    uid: "1",
    updateTime: "2022-12-21T03:35:03.096Z",
    price: 6399,
    count: 1,
    title: "XXXX40 Pro",
    commodityId: 1,
    image: "common/product001.png",
    orderId: "3196746164785",
    status: 1,
    specifications: [
      { name: '颜色', value: '深邃黑' },
      { name: '规格', value: '8+256G' }
    ],
    description: "XXXX40 Pro 5G手机"
  },
  {
    amount: 5199,
    createTime: "2022-10-08T03:35:37.331Z",
    orderTime: "2022-10-08T03:35:37.331Z",
    payTime: "2022-10-08T03:38:43.391Z",
    uid: "1",
    updateTime: "2022-10-08T03:38:43.391Z",
    price: 5199,
    count: 1,
    title: "XXXXBook 13",
    commodityId: 2,
    image: "common/product002.png",
    orderId: "9863350027162",
    status: 2,
    specifications: [
      { name: '颜色', value: '卡其色' },
      { name: '规格', value: '12+512G' }
    ],
    description: "XX笔记本电脑XXXXBook 13 11代酷睿"
  }
]

export { commodityData, shopCartData, orderData };