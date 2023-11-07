/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { AlarmSettingType } from '../common/constants/AlarmSettingType';

/**
 * Alarm setting item information.
 */
export default class AlarmSettingItem {
  /**
   * Alarm setting title.
   */
  public title: string;
  /**
   * Alarm setting content.
   */
  public content: string;
  /**
   * Alarm setting type.
   */
  public sType: AlarmSettingType;

  constructor(title: string, content: string, sType: AlarmSettingType) {
    this.title = title;
    this.content = content;
    this.sType = sType;
  }
}