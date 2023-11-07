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

import PointStyle from './PointStyle';

/**
 * Chart point entity class.
 */
export default class ChartPoint {
  /**
   * Step value.
   */
  value: number = 0;
  /**
   * Style of chart points.
   */
  pointStyle: PointStyle = {
    shape: '',
    fillColor: '',
    strokeColor: '',
    size: 0
  };

  /**
   * Description of icon points.
   */
  description: string = '';

  /**
   * Chart text position.
   */
  textLocation: string = '';

  /**
   * Chart text color.
   */
  textColor: string='';
}