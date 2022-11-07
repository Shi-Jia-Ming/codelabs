/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import {Banner01} from '../banner/Banner01';
import {Banner02} from '../banner/Banner02';

@Entry
@Component
struct PageBanner {
  build() {
    Column() {
      Text('圆点指示器样式').fontSize(16).margin({top:50,bottom:10}).fontColor(0x000000)
      Banner01()
      Text('数字标题样式').fontSize(16).margin({top:50,bottom:10}).fontColor(0x000000)
      Banner02()
    }.height('100%').backgroundColor(0xF0EFF4)
  }
}