/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

export default class CommonConstants {

  // Used data volume in the proportion chart.
  static RAINBOW_USED_SIZE = 96;

  // Percentage used in the proportion chart.
  static RAINBOW_USED_PERCENT = 75;

  // Percentage of each increase in the proportion chart.
  static RAINBOW_PERCENT_ADD = 5;

  // Data volume added each time in the proportion chart.
  static RAINBOW_ADD_SIZE = 128 * 0.05;

  // Data volume of the proportion chart system.
  static RAINBOW_SYSTEM_SIZE = 6.4;

  // Proportion Chart System Data Proportion.
  static RAINBOW_SYSTEM_PERCENT = 5;

  // Percentage of other data in the proportion chart.
  static RAINBOW_OTHER_PERCENT = 70;

  // Percentage of all data in the proportion chart.
  static RAINBOW_ALL_PERCENT = 100;

  // Interval for updating data in the proportion chart.
  static RAINBOW_INTERVAL_TIME = 3000;

  // Line chart x-axis maximum value.
  static LINE_X_MAX = 5;

  // Line chart x-axis maximum value.
  static LINE_Y_MAX = 100;

  // Line Chart Data Length.
  static LINE_DATA_LENGTH = 10;

  // Line graph random number.
  static LINE_RANDOM_MAX = 79;

  // Line chart anchor size.
  static LINE_POINT_SIZE = 5;

  // Line chart anchor line width.
  static LINE_POINT_WIDTH = 2;

  // Line chart anchor interval.
  static LINE_MARGIN = 2;

  // Line chart update data interval.
  static LINE_INTERVAL_TIME = 1000;

  // Maximum value on the x axis of the bar chart.
  static  BAR_X_MAX = 20;

  // Number of scales in a bar chart.
  static BAR_X_TICK = 4;

  // Maximum value on the y axis of the bar chart.
  static BAR_Y_MAX = 10000;

  // Bar chart random number.
  static BAR_RANDOM_MAX = 9999;

  // Interval for updating bar chart data.
  static PRECISION_COEFFICIENT = 10;

  // Default bar chart data.
  static BAR_DEFAULT_DATA = [
    {
      fillColor: '#4480FF',
      data: [200, 2000, 9900, 5600]
    },
    {
      fillColor: '#9F9DFE',
      data: [9900, 8800, 200, 6700]
    },
    {
      fillColor: '#FFCD02',
      data: [5600, 200, 7700, 9900]
    },
    {
      fillColor: '#0017A98E',
      data: [0, 0, 0, 0]
    }
  ];

  // Default data in the proportion chart.
  static RAINBOW_DEFAULT_DATA = [
    {
      value: 50,
      name: 'photo',
      startColor: '#FAD419',
      endColor: '#FFAF38'
    },
    {
      value: 12,
      name: 'app',
      startColor: '#F8987B',
      endColor: '#F5683D'
    },
    {
      value: 8,
      name: 'book',
      startColor: '#ED8EB8',
      endColor: '#E673A4'
    },
    {
      value: 5,
      name: 'sysData',
      startColor: '#AE8BE0',
      endColor: '#B66BED'
    },
    {
      value: 0,
      name: 'remaining'
    }
  ];
}