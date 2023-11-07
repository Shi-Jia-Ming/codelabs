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
import DayDataItem from '../../viewmodel/DayDataItem'

/**
 * Detail page constant description.
 */
export class DetailConstant {
  /**
   * detail page day data.
   */
  static readonly DAY_DATA: DayDataItem[] = [
    { timeType: 0, delSelect: 0, data: ['上午', '下午'] } as DayDataItem,
    { timeType: 1, delSelect: 0, data:
    [
      '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'
    ]
    } as DayDataItem,
    { timeType: 2, delSelect: 0, data:
    [
      '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12',
      '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24',
      '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36',
      '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48',
      '49', '50', '51', '52', '53', '54', '55', '56', '57', '58', '59', '00',
    ]
    } as DayDataItem
  ];
  /**
   * week day data.
   */
  static readonly WEEKDAY_DATA: number[] = [1, 2, 3, 4, 5, 6, 7];
  /**
   * ring duration list data.
   */
  static readonly RING_DURATION: number[] = [1, 5, 10, 15, 20, 30];
  /**
   * default string minute.
   */
  static readonly DEFAULT_STRING_MINUTE: string = '分钟';
  /**
   * default string group name.
   */
  static readonly DEFAULT_STRING_GROUP_NAME: string = 'radioGroup';
  /**
   * default string provider key.
   */
  static readonly DEFAULT_PROVIDER_KEY: string = 'alarmItemProvide';
  /**
   * default string repeat.
   */
  static readonly DEFAULT_STRING_REPEAT: string = '重复';
  /**
   * default string alarm name.
   */
  static readonly DEFAULT_STRING_ALARM_NAME: string = '闹钟名';
  /**
   * default string interval.
   */
  static readonly DEFAULT_STRING_INTERVAL: string = '再响间隔';
  /**
   * default string duration.
   */
  static readonly DEFAULT_STRING_DURATION: string = '闹铃时长';
  /**
   * default string times.
   */
  static readonly DEFAULT_STRING_TIMES: string = '次';
}