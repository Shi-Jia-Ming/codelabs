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

import DataRdb from '@ohos.data.relationalStore';
import ChartValues from '../../viewmodel/ChartValues';
import ChartPoint from '../../viewmodel/ChartPoint';
import PointStyle from '../../viewmodel/PointStyle';
import DatabaseUtils from './DatabaseUtils';
import CommonConstants from '../constants/CommonConstants';
import FormData from '../../viewmodel/FormData';
import Logger from '../utils/Logger';

/**
 * Chart data operation tool class.
 */
export class ChartDataUtils {
  /**
   * Get chart points.
   *
   * @param {DataRdb.RdbStore} rdbStore RDB database.
   * @return Return the steps value of the last three days.
   */
  async getChartPoints(rdbStore: DataRdb.RdbStore) {
    let chartPoints = await DatabaseUtils.getLastThreeDaysValue(rdbStore).catch((error: Error) => {
      Logger.error(CommonConstants.TAG_CHART, 'getLastThreeDaysValue error ' + JSON.stringify(error));
    });
    return chartPoints;
  }

  /**
   * Get chart values.
   *
   * @param {number} stepsValue Value of steps.
   * @param {DataRdb.RdbStore} rdbStore RDB database.
   * @return {ChartValues} chartValues.
   */
  async getChartValues(stepsValue: number, rdbStore: DataRdb.RdbStore) {
    let chartValues: ChartValues = new ChartValues();
    // Set fill color.
    chartValues.fillColor = CommonConstants.CHART_VALUES_FILL_COLOR;
    // Set the color of the line.
    chartValues.strokeColor = CommonConstants.CHART_VALUES_STROKE_COLOR;
    chartValues.gradient = true;
    // Gets a collection of points from the previous three days.
    let chartPoints: ChartPoint[];
    await this.getChartPoints(rdbStore).then((pointArray: ChartPoint[] | void) => {
      chartPoints = pointArray as ChartPoint[];
      let nowChartPoint: ChartPoint = this.getChartPoint(stepsValue);
      // Join today's steps value.
      chartPoints.push(nowChartPoint);
      chartValues.data = chartPoints;
    }).catch((error: Error) => {
      Logger.error(CommonConstants.TAG_CHART, 'getChartPoints error ' + JSON.stringify(error));
    });
    return chartValues;
  }

  /**
   * Get chart point.
   *
   * @param {number} stepsValue Value of steps.
   * @return {ChartPoint} chartPoint.
   */
  getChartPoint(stepsValue: number) {
    let chartPoint: ChartPoint = new ChartPoint();
    // Value of a chart point. if the value exceeds 1000, only 1000 is displayed.
    chartPoint.value = Math.min(CommonConstants.TARGET_STEPS, stepsValue);
    chartPoint.description = stepsValue.toString();
    // Display position of the chart point. set this parameter to above.
    chartPoint.textLocation = CommonConstants.TEXT_LOCATION;
    // Sets the color of the description font.
    chartPoint.textColor = CommonConstants.WHITE_COLOR;
    let pointStyle: PointStyle = new PointStyle();
    pointStyle.size = CommonConstants.POINT_SIZE;
    pointStyle.fillColor = CommonConstants.WHITE_COLOR;
    pointStyle.strokeColor = CommonConstants.WHITE_COLOR;
    pointStyle.shape = CommonConstants.SHAPE_CIRCLE;
    chartPoint.pointStyle = pointStyle;
    return chartPoint;
  }

  /**
   * Get form data.
   *
   * @param {number} stepValue Value of steps.
   * @param {number} dimension Card Specifications.
   * @param {DataRdb.RdbStore} rdbStore RDB database.
   * @return {FormData} formData.
   */
  async getFormData(formId: string, stepValue: number, dimension: number, rdbStore: DataRdb.RdbStore) {
    let round: number;
    if (stepValue >= CommonConstants.TARGET_STEPS) {
      round = CommonConstants.HUNDRED_PERCENT;
    } else {
      round = Math.round(stepValue / CommonConstants.TARGET_STEPS * CommonConstants.HUNDRED_PERCENT);
    }
    let formData: FormData = new FormData();
    formData.percent = round;
    formData.steps = stepValue;
    formData.formId = formId;
    // Check whether the card type is 2x4.
    if (dimension === CommonConstants.DIMENSION_TWO_BY_FOUR) {
      let dataSets: Array<ChartValues> = new Array<ChartValues>();
      // Get chart point set data.
      await this.getChartValues(stepValue, rdbStore).then((result) => {
        dataSets.push(result);
      }).catch((error: Error) => {
        Logger.error(CommonConstants.TAG_CHART, 'getFormData chartValues error ' + JSON.stringify(error));
      });
      // Add Field.
      formData.datasets = dataSets;
      formData.mileage = Math.round(stepValue * CommonConstants.METER_PER_STEP);
    }
    return formData;
  }
}

export default new ChartDataUtils();