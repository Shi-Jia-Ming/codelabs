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
 * Application simulation data can be obtained from the server by developers.
 */
const commodityData = [
  {
    "detail_pic_url": "common/product001.png",
    "attr_list": "[{\"name\":\"颜色\",\"value\":[\"深邃黑\",\"珠光白\",\"宝石蓝\"]},{\"name\":\"版本\",\"value\":" +
    "[\"8+128G\",\"8+256G\",\"12+512G\"]},{\"name\":\"网络制式\",\"value\":[\"4G全网通\",\"5G全网通\"]},{\"name\":\"类型\",\"value\":[\"官方标配\"]}]",
    "category_id": "1",
    "price": 6399,
    "name": "XXXX40 Pro",
    "pic_url": "common/product001.png",
    "spu_id": "1",
    "desc": "XXXX Pro 5G手机",
    "promotion": "新品"
  },
  {
    "detail_pic_url": "common/product002.png",
    "attr_list": "[{\"name\":\"颜色\",\"value\":[\"深邃黑\",\"珠光白\",\"宝石蓝\"]},{\"name\":\"版本\",\"value\":" +
    "[\"8+128G\",\"8+256G\",\"12+512G\"]},{\"name\":\"网络制式\",\"value\":[\"4G全网通\",\"5G全网通\"]},{\"name\":\"类型\",\"value\":[\"官方标配\"]}]",
    "category_id": "1",
    "price": 5199,
    "name": "XXXXBook 13",
    "pic_url": "common/product002.png",
    "spu_id": "2",
    "desc": "XX笔记本电脑XXXXBook 13 11代酷睿",
    "promotion": "新品"
  },
  {
    "detail_pic_url": "common/product003.png",
    "attr_list": "[{\"name\":\"颜色\",\"value\":[\"黑色\",\"白色\"]},{\"name\":\"版本\",\"value\":" +
    "[\"8+128G\",\"8+256G\",\"12+512G\"]},{\"name\":\"网络制式\",\"value\":[\"4G全网通\",\"5G全网通\"]}," +
    "{\"name\":\"类型\",\"value\":[\"官方标配\"]}]",
    "category_id": "3",
    "price": 6588,
    "name": "PXX40 Pro",
    "pic_url": "common/product003.png",
    "spu_id": "3",
    "desc": "PXX40 Pro 5G手机 支持XXXOS",
    "promotion": "限时"
  },
  {
    "detail_pic_url": "common/product004.png",
    "attr_list": "[{\"name\":\"颜色\",\"value\":[\"深邃黑\",\"珠光白\",\"宝石蓝\"]},{\"name\":\"版本\",\"value\":" +
    "[\"8+128G\",\"8+256G\",\"12+512G\"]},{\"name\":\"网络制式\",\"value\":[\"4G全网通\",\"5G全网通\"]}," +
    "{\"name\":\"类型\",\"value\":[\"官方标配\"]}]",
    "category_id": null,
    "price": 3999,
    "name": "XXXX30 Pro",
    "pic_url": "common/product004.png",
    "spu_id": "4",
    "desc": "XXXX30 Pro 超长续航 支持XXXOS系统",
    "promotion": "新品"
  },
  {
    "detail_pic_url": "common/product005.png",
    "attr_list": "[{\"name\":\"颜色\",\"value\":[\"黑色\",\"白色\"]},{\"name\":\"版本\",\"value\":" +
    "[\"8+128G\",\"8+256G\",\"12+512G\"]},{\"name\":\"网络制式\",\"value\":[\"4G全网通\",\"5G全网通\"]}," +
    "{\"name\":\"类型\",\"value\":[\"官方标配\"]}]",
    "category_id": null,
    "price": 1899,
    "name": "XX20e",
    "pic_url": "common/product005.png",
    "spu_id": "5",
    "desc": "XX 5000mAh大电池 6.3英寸高清大屏",
    "promotion": "赠送积分"
  },
  {
    "detail_pic_url": "common/product006.png",
    "attr_list": "[{\"name\":\"颜色\",\"value\":[\"深邃黑\",\"珠光白\",\"宝石蓝\"]},{\"name\":\"版本\",\"value\":" +
    "[\"8+128G\",\"8+256G\",\"12+512G\"]},{\"name\":\"网络制式\",\"value\":[\"4G全网通\",\"5G全网通\"]}," +
    "{\"name\":\"类型\",\"value\":[\"官方标配\"]}]",
    "category_id": null,
    "price": 2199,
    "name": "XX20 Plus",
    "pic_url": "common/product006.png",
    "spu_id": "6",
    "desc": "40W超级快充 90Hz高刷新率",
    "promotion": "新品"
  },
  {
    "detail_pic_url": "common/product006.png",
    "attr_list": "[{\"name\":\"颜色\",\"value\":[\"黑色\",\"白色\"]},{\"name\":\"版本\",\"value\":" +
    "[\"8+128G\",\"8+256G\",\"12+512G\"]},{\"name\":\"网络制式\",\"value\":[\"4G全网通\",\"5G全网通\"]}," +
    "{\"name\":\"类型\",\"value\":[\"官方标配\"]}]",
    "category_id": "1",
    "price": 3299,
    "name": "XXXX7 Pro",
    "pic_url": "common/product006.png",
    "spu_id": "7",
    "desc": "XX手机 5000W高清后置拍摄",
    "promotion": "限时"
  },
  {
    "detail_pic_url": "common/product006.png",
    "attr_list": "[{\"name\":\"颜色\",\"value\":[\"深邃黑\",\"珠光白\",\"宝石蓝\"]},{\"name\":\"版本\",\"value\":" +
    "[\"8+128G\",\"8+256G\",\"12+512G\"]},{\"name\":\"网络制式\",\"value\":[\"4G全网通\",\"5G全网通\"]}," +
    "{\"name\":\"类型\",\"value\":[\"官方标配\"]}]",
    "category_id": "1",
    "price": 12999,
    "name": "XXXX xs2",
    "pic_url": "common/product006.png",
    "spu_id": "8",
    "desc": "XX曲面屏手机 内翻铰链设计",
    "promotion": "赠送积分"
  },
  {
    "detail_pic_url": "common/product003.png",
    "attr_list": "[{\"name\":\"颜色\",\"value\":[\"黑色\",\"白色\"]},{\"name\":\"版本\",\"value\":" +
    "[\"8+128G\",\"8+256G\",\"12+512G\"]},{\"name\":\"网络制式\",\"value\":[\"4G全网通\",\"5G全网通\"]}," +
    "{\"name\":\"类型\",\"value\":[\"官方标配\"]}]",
    "category_id": "3",
    "price": 6588,
    "name": "PXX40 Pro",
    "pic_url": "common/product003.png",
    "spu_id": "9",
    "desc": "PXX40 Pro 5G手机 支持XXXOS",
    "promotion": "限时"
  },
  {
    "detail_pic_url": "common/product004.png",
    "attr_list": "[{\"name\":\"颜色\",\"value\":[\"深邃黑\",\"珠光白\",\"宝石蓝\"]},{\"name\":\"版本\",\"value\":" +
    "[\"8+128G\",\"8+256G\",\"12+512G\"]},{\"name\":\"网络制式\",\"value\":[\"4G全网通\",\"5G全网通\"]}," +
    "{\"name\":\"类型\",\"value\":[\"官方标配\"]}]",
    "category_id": null,
    "price": 3999,
    "name": "XXXX30 Pro",
    "pic_url": "common/product004.png",
    "spu_id": "10",
    "desc": "XXXX30 Pro 超长续航 支持XXXOS系统",
    "promotion": "新品"
  },
  {
    "detail_pic_url": "common/product003.png",
    "attr_list": "[{\"name\":\"颜色\",\"value\":[\"黑色\",\"白色\"]},{\"name\":\"版本\",\"value\":" +
    "[\"8+128G\",\"8+256G\",\"12+512G\"]},{\"name\":\"网络制式\",\"value\":[\"4G全网通\",\"5G全网通\"]}," +
    "{\"name\":\"类型\",\"value\":[\"官方标配\"]}]",
    "category_id": "3",
    "price": 6588,
    "name": "PXX40 Pro",
    "pic_url": "common/product003.png",
    "spu_id": "11",
    "desc": "PXX40 Pro 5G手机 支持XXXOS",
    "promotion": "限时"
  },
  {
    "detail_pic_url": "common/product006.png",
    "attr_list": "[{\"name\":\"颜色\",\"value\":[\"黑色\",\"白色\"]},{\"name\":\"版本\",\"value\":" +
    "[\"8+128G\",\"8+256G\",\"12+512G\"]},{\"name\":\"网络制式\",\"value\":[\"4G全网通\",\"5G全网通\"]}," +
    "{\"name\":\"类型\",\"value\":[\"官方标配\"]}]",
    "category_id": "1",
    "price": 3299,
    "name": "XXXX7 Pro",
    "pic_url": "common/product006.png",
    "spu_id": "12",
    "desc": "XX手机 5000W高清后置拍摄",
    "promotion": "限时"
  }
]

const shopCartData = [
  {
    "uid": "1",
    "update_time": "2022-12-21T03:34:01.962Z",
    "quantity": 1,
    "create_time": "2022-11-02T02:42:31.338Z",
    "price": 6399,
    "name": "XXXX40 Pro",
    "sc_id": "6063101776955",
    "spu_id": "1",
    "pic_url": "common/product001.png",
    "selected": 0,
    "spu_attrs": "[{\"name\":\"颜色\",\"value\":\"珠光白\"},{\"name\":\"规格\",\"value\":\"8+256G\"}]",
    "desc": "XXXX40 Pro 5G手机"
  },
  {
    "uid": "1",
    "update_time": "2022-12-21T03:34:02.042Z",
    "quantity": 1,
    "create_time": "2022-11-03T03:14:33.407Z",
    "price": 6588,
    "name": "PXX40 Pro",
    "sc_id": "7726602128445",
    "spu_id": "3",
    "pic_url": "common/product003.png",
    "selected": 0,
    "spu_attrs": "[{\"name\":\"规格\",\"value\":\"8+128G\"},{\"name\":\"颜色\",\"value\":\"深邃黑\"}]",
    "desc": "PXX40 Pro 5G手机 支持XXXOS"
  }
]

const orderData = [
  {
    "amount": 2099,
    "create_time": "2022-11-01T09:39:34.442Z",
    "order_time": "2022-11-01T09:39:34.442Z",
    "pay_time": "2022-11-01T09:40:07.453Z",
    "uid": "1",
    "update_time": "2022-11-01T09:40:07.453Z",
    "price": 6588,
    "spu_num": 2,
    "name": "PXX40 Pro",
    "spu_id": "3",
    "pic_url": "common/product003.png",
    "order_id": "2675124576927",
    "status": 2,
    "spu_attrs": "[{\"name\":\"颜色\",\"value\":\"宝石蓝\"},{\"name\":\"规格\",\"value\":\"12+512G\"}]",
    "desc": "XXX40 Pro 5G手机 支持HarmonyOS"
  },
  {
    "amount": 6399,
    "create_time": "2022-11-02T11:33:03.414Z",
    "order_time": "2022-11-02T11:33:03.414Z",
    "pay_time": "2022-11-10T02:15:17.360Z",
    "uid": "1",
    "update_time": "2022-11-10T02:15:17.360Z",
    "price": 6399,
    "spu_num": 1,
    "name": "XXXX40 Pro",
    "spu_id": "1",
    "pic_url": "common/product001.png",
    "order_id": "8189683677531",
    "status": 2,
    "spu_attrs": "[{\"name\":\"颜色\",\"value\":\"宝石蓝\"},{\"name\":\"规格\",\"value\":\"12+512G\"}]",
    "desc": "XXXX40 Pro 5G手机"
  },
  {
    "amount": 6399,
    "create_time": "2022-11-01T11:23:51.857Z",
    "order_time": "2022-11-01T11:23:51.857Z",
    "pay_time": "2022-11-01T11:40:48.365Z",
    "uid": "1",
    "update_time": "2022-11-01T11:40:48.365Z",
    "price": 6399,
    "spu_num": 1,
    "name": "XXXX40 Pro",
    "spu_id": "1",
    "pic_url": "common/product001.png",
    "order_id": "8479164261530",
    "status": 1,
    "spu_attrs": "[{\"name\":\"颜色\",\"value\":\"珠光白\"},{\"name\":\"规格\",\"value\":\"8+256G\"}]",
    "desc": "XXXX40 Pro 5G手机"
  },
  {
    "amount": 6399,
    "create_time": "2022-10-31T08:24:41.675Z",
    "order_time": "2022-10-31T08:24:41.675Z",
    "pay_time": "2022-11-02T12:08:50.869Z",
    "uid": "1",
    "update_time": "2022-11-02T12:08:50.869Z",
    "price": 6399,
    "spu_num": 1,
    "name": "XXXX40 Pro",
    "spu_id": "1",
    "pic_url": "common/product001.png",
    "order_id": "7068271460267",
    "status": 2,
    "spu_attrs": "[{\"name\":\"颜色\",\"value\":\"深邃黑\"},{\"name\":\"规格\",\"value\":\"8+256G\"}]",
    "desc": "XXXX40 Pro 5G手机"
  },
  {
    "amount": 9999,
    "create_time": "2022-11-03T08:12:16.761Z",
    "order_time": "2022-11-03T08:12:16.761Z",
    "pay_time": "2022-11-03T08:12:50.130Z",
    "uid": "1",
    "update_time": "2022-11-03T08:12:50.130Z",
    "price": 5199,
    "spu_num": 1,
    "name": "XXXXBook 13",
    "spu_id": "2",
    "pic_url": "common/product002.png",
    "order_id": "3716463840116",
    "status": 2,
    "spu_attrs": "[{\"name\":\"颜色\",\"value\":\"宝石蓝\"},{\"name\":\"规格\",\"value\":\"12+512G\"}]",
    "desc": "XX笔记本电脑XXXXBook 13 11代酷睿"
  },
  {
    "amount": 6399,
    "create_time": "2022-10-31T12:28:33.027Z",
    "order_time": "2022-10-31T12:28:33.027Z",
    "pay_time": "2022-11-01T09:54:31.241Z",
    "uid": "1",
    "update_time": "2022-11-01T09:54:31.241Z",
    "price": 6399,
    "spu_num": 1,
    "name": "XXXX40 Pro",
    "spu_id": "1",
    "pic_url": "common/product001.png",
    "order_id": "1691138712761",
    "status": 1,
    "spu_attrs": "[{\"name\":\"颜色\",\"value\":\"宝石蓝\"},{\"name\":\"规格\",\"value\":\"12+512G\"}]",
    "desc": "XXXX40 Pro 5G手机"
  },
  {
    "amount": 6399,
    "create_time": "2022-12-21T03:34:09.556Z",
    "order_time": "2022-12-21T03:34:09.556Z",
    "pay_time": "2022-12-21T03:35:03.096Z",
    "uid": "1",
    "update_time": "2022-12-21T03:35:03.096Z",
    "price": 6399,
    "spu_num": 1,
    "name": "XXXX40 Pro",
    "spu_id": "1",
    "pic_url": "common/product001.png",
    "order_id": "3196746164785",
    "status": 1,
    "spu_attrs": "[{\"name\":\"颜色\",\"value\":\"深邃黑\"},{\"name\":\"规格\",\"value\":\"8+256G\"}]",
    "desc": "XXXX40 Pro 5G手机"
  },
  {
    "amount": 5199,
    "create_time": "2022-10-08T03:35:37.331Z",
    "order_time": "2022-10-08T03:35:37.331Z",
    "pay_time": "2022-10-08T03:38:43.391Z",
    "uid": "1",
    "update_time": "2022-10-08T03:38:43.391Z",
    "price": 5199,
    "spu_num": 1,
    "name": "XXXXBook 13",
    "spu_id": "2",
    "pic_url": "common/product002.png",
    "order_id": "9863350027162",
    "status": 2,
    "spu_attrs": "[{\"name\":\"颜色\",\"value\":\"卡其色\"},{\"name\":\"规格\",\"value\":\"12+512G\"}]",
    "desc": "XX笔记本电脑XXXXBook 13 11代酷睿"
  }
]

export { commodityData, shopCartData, orderData };