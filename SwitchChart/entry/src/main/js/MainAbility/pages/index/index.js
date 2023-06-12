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

import CommonConstants from '../../common/constants/CommonConstants';

const coefficients = CommonConstants.PRECISION_COEFFICIENT;
const addSize = CommonConstants.RAINBOW_ADD_SIZE;
const addPercent = CommonConstants.RAINBOW_PERCENT_ADD;

export default {
  data: {
    // Line and bar interval.
    interval: null,

    // rainbow interval.
    rainbowInterval: null,

    // Used memory.
    used: CommonConstants.RAINBOW_USED_SIZE,

    // Percentage used.
    percent: CommonConstants.RAINBOW_USED_PERCENT,

    // Data length.
    dataLength: CommonConstants.LINE_DATA_LENGTH,

    // Number of bar chart groups.
    barGroup: CommonConstants.BAR_DEFAULT_DATA.length,

    // Line chart data.
    lineData: null,

    // Proportion system data.
    systemDataSize: CommonConstants.RAINBOW_SYSTEM_SIZE,

    // Proportion chart data.
    rainBowData: CommonConstants.RAINBOW_DEFAULT_DATA,

    // Bar chart data.
    barData: CommonConstants.BAR_DEFAULT_DATA,

    // Line chart style.
    lineOps: {
      xAxis: {
        min: 0,
        max: CommonConstants.LINE_X_MAX,
        display: false
      },
      yAxis: {
        min: 0,
        max: CommonConstants.LINE_Y_MAX,
        display: false
      },
      series: {
        lineStyle: {
          width: '1px',
          smooth: true
        },
        headPoint: {
          shape: 'circle',
          size: CommonConstants.LINE_POINT_SIZE,
          strokeWidth: CommonConstants.LINE_POINT_WIDTH,
          fillColor: '#FFFFFF',
          strokeColor: '#0A59F7',
          display: true
        },
        loop: {
          margin: CommonConstants.LINE_MARGIN,
          gradient: true
        }
      }
    },

    // Bar chart style.
    barOps: {
      xAxis: {
        min: 0,
        max: CommonConstants.BAR_X_MAX,
        display: false,
        axisTick: CommonConstants.BAR_X_TICK
      },
      yAxis: {
        min: 0,
        max: CommonConstants.BAR_Y_MAX,
        display: false
      }
    }
  },

  /**
   * Initialize
   */
  onInit() {
    this.changeLine();
  },

  /**
   * Callback for switching the status of the switch button.
   */
  change(event) {
    if (event.checked) {
      this.interval = setInterval(() => {
        // Update line chart data.
        this.changeLine();
        // Updating bar chart Data.
        this.changeBar();
      }, CommonConstants.LINE_INTERVAL_TIME);
      this.rainbowInterval = setInterval(() => {
        // Update the proportion chart data.
        this.changeGauge();
      }, CommonConstants.RAINBOW_INTERVAL_TIME);
    } else {
      clearInterval(this.interval);
      clearInterval(this.rainbowInterval);
    }
  },

  /**
   * Update line chart data.
   */
  changeLine() {
    const dataArray = [];
    for (let i = 0; i < this.dataLength; i++) {
      const nowValue = Math.floor(Math.random() * CommonConstants.LINE_RANDOM_MAX + 1);
      const obj = {
        'value': nowValue, // Y coordinate
        'pointStyle': {
          'shape': 'circle', // Node shape
          'size': CommonConstants.LINE_POINT_SIZE,
          'fillColor': '#FFFFFF',
          'strokeColor': '#0A59F7'
        }
      };
      dataArray.push(obj);
    }
    this.lineData = [
      {
        // The color of the line.
        strokeColor: '#0A59F7',
        // Gradient fill color.
        fillColor: '#0A59F7',
        data: dataArray,
        gradient: true
      }
    ];
  },

  /**
   * Update the proportion chart data.
   */
  changeGauge() {
    const sysData = this.rainBowData[this.rainBowData.length - 2];
    sysData.value += addPercent;
    this.percent += addPercent;
    // Avoid loss of precision when adding decimals.
    this.used = (this.used * coefficients + addSize * coefficients) / coefficients;
    this.systemDataSize = (this.systemDataSize * coefficients + addSize * coefficients) / coefficients;
    if (sysData.value + CommonConstants.RAINBOW_OTHER_PERCENT > CommonConstants.RAINBOW_ALL_PERCENT) {
      sysData.value = CommonConstants.RAINBOW_SYSTEM_PERCENT;
      this.percent = CommonConstants.RAINBOW_USED_PERCENT;
      this.used = CommonConstants.RAINBOW_USED_SIZE;
      this.systemDataSize = CommonConstants.RAINBOW_SYSTEM_SIZE;
    }
    this.rainBowData = this.rainBowData.splice(0, this.rainBowData.length);
  },

  /**
   * Updating bar chart data.
   */
  changeBar() {
    for (let i = 0; i < this.barGroup; i++) {
      const dataArray = this.barData[i].data;
      for (let j = 0; j < this.dataLength; j++) {
        dataArray[j] = Math.floor(Math.random() * CommonConstants.BAR_RANDOM_MAX + 1);
      }
    }
    this.barData = this.barData.splice(0, this.barGroup + 1);
  }
};