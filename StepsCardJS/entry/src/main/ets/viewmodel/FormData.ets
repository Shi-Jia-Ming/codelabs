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

import ChartValues from './ChartValues';

/**
 * Form data entity class.
 */
export default class FormData {
  /**
   * Form ID
   */
  formId: string = '';

  /**
   * Step percentage.
   */
  percent: number = 0;

  /**
   * Form steps.
   */
  steps: number = 0;

  /**
   * Chart data point collection.
   */
  datasets: Array<ChartValues> = [];

  /**
   * Travel mileage.
   */
  mileage: number = 0;
}