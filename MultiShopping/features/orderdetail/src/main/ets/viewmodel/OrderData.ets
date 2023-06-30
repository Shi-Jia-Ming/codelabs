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

const addressInfo = [
  {
    "id": '1',
    "updateTime": '2022-10-22T10:10:10.222Z',
    "isDefault": 1,
    "province": '江苏省',
    "createTime": '2022-10-22T10:10:10.222Z',
    "phone": '131****2168',
    "city": '南京市',
    "postCode": '246100',
    "name": '李先生',
    "detailAddress": '中国南京软件谷 XX路18号XX云楼N13食堂B1楼小厨娘',
    "region": '玄武区',
    "addressId": '1'
  },
  {
    "id": '1',
    "updateTime": '2022-10-22T10:10:10.222Z',
    "isDefault": 0,
    "province": '江苏省',
    "createTime": '2022-10-22T10:10:10.222Z',
    "phone": '182****0193',
    "city": '南京市',
    "post_code": '241200',
    "name": '王先生',
    "detailAddress": '东山街道 中国南京软件谷 XX云楼N15',
    "region": '江宁区',
    "addressId": '3'
  }
]

const payEnum = {
  0: '应付款',
  1: '实付款',
  2: '实付款'
}

const statusEnum = {
  0: '待支付',
  1: '卖家已发货',
  2: '已完成'
}

export { addressInfo, payEnum, statusEnum }