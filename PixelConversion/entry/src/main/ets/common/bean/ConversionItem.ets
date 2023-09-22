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

export default class ConversionItem {
  title: string;
  subTitle: string;
  value: number = 0;
  conversionTitle: string;
  conversionSubTitle: string;
  conversionValue: number;
  notice?: Resource | string;

  constructor(title?: string, subTitle?: string, value?: number, conversionTitle?: string, conversionSubTitle?: string,
              conversionValue?: number, notice?: Resource | string) {
    this.title = title ? title : '';
    this.subTitle = subTitle ? subTitle : '';
    this.value = value ? value : 0;
    this.conversionTitle = conversionTitle ? conversionTitle : '';
    this.conversionSubTitle = conversionSubTitle ? conversionSubTitle : '';
    this.conversionValue = conversionValue ? conversionValue : 0;
    this.notice = notice ? notice : '';
  }
}