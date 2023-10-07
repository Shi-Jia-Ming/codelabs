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
import { Permissions } from '@ohos.abilityAccessCtrl';

/**
 * Common constants for all features.
 */
export class CommonConstants {
  /**
   * The request permission.
   */
  static readonly REQUEST_PERMISSIONS: Array<Permissions> = ['ohos.permission.ACTIVITY_MOTION',
    'ohos.permission.APPROXIMATELY_LOCATION',
    'ohos.permission.LOCATION'];

  /**
   * The data storage file name.
   */
  static readonly FILE_NAME: string = '/myStore';

  /**
   * The service name.
   */
  static readonly SERVICE_NAME: string = '.ServiceAbility';

  /**
   * The notification title.
   */
  static readonly NOTIFICATION_TITLE: string = 'Current location:';

  /**
   * The event id of service.
   */
  static readonly EVENT_SERVICE_ID: number = 2;

  /**
   * The notification id.
   */
  static readonly NOTIFICATION_ID: number = 1;

  /**
   * The interval time.
   */
  static readonly INTERVAL_TIME: number = 5000;

  /**
   * One hundred.
   */
  static readonly ONE_HUNDRED: number = 100;

  /**
   * Location priority.
   */
  static readonly LOCATION_PRIORITY: number = 0x203;

  /**
   * Location scenario.
   */
  static readonly LOCATION_SCENARIO: number = 0x300;

  /**
   * Location time interval.
   */
  static readonly LOCATION_TIME_INTERVAL: number = 0;

  /**
   * Location distance interval.
   */
  static readonly LOCATION_DISTANCE_INTERVAL: number = 0;

  /**
   * Location max accuracy.
   */
  static readonly LOCATION_MAX_ACCURACY: number = 0;

  /**
   * Want for get steps and location data.
   */
  static readonly WAIT: string = 'The target step count or current position is empty. Please try again later.';

  /**
   *The is status is false.
   */
  static readonly FALSE: string = 'false';

  /**
   * The is status is true.
   */
  static readonly TRUE: string = 'true';

  /**
   * The mac line.
   */
  static readonly MAX_LINE: number = 1;

  /**
   * The divider stroke width.
   */
  static readonly DIVIDER_STROKE_WIDTH: number = 0.5;

  /**
   * The offset dx.
   */
  static readonly OFFSET_DX: number = 0;

  /**
   * The offset dy.
   */
  static readonly OFFSET_DY: number = -12;

  /**
   * The percent sign.
   */
  static readonly PERCENT_SIGN: string = '%';

  /**
   * The progress border radius.
   */
  static readonly PROGRESS_BORDER_RADIUS: number = 100;

  /**
   * The progress stroke width.
   */
  static readonly PROGRESS_STROKE_WIDTH: number = 20;

  /**
   * The progress scale count.
   */
  static readonly PROGRESS_SCALE_COUNT: number = 100;

  /**
   * The progress scale width.
   */
  static readonly PROGRESS_SCALE_WIDTH: number = 30;

  /**
   * The progress total.
   */
  static readonly PROGRESS_TOTAL: number = 100;

  /**
   * The small font weight.
   */
  static readonly SMALL_FONT_WEIGHT: number = 400;

  /**
   * The big font weight.
   */
  static readonly BIG_FONT_WEIGHT: number = 500;

  /**
   * The initialization value.
   */
  static readonly INITIALIZATION_VALUE: string = '0';

  /**
   * The old steps value key.
   */
  static readonly OLD_STEPS: string = 'OLD_STEPS';

  /**
   * The old steps value key.
   */
  static readonly STEP_GOAL: string = 'STEP_GOAL';

  /**
   * The old steps value key.
   */
  static readonly START_POSITION: string = 'START_POSITION';

  /**
   * The current steps tag.
   */
  static readonly CURRENT_STEPS: string = 'CURRENT_STEPS';

  /**
   * The progress value tag.
   */
  static readonly PROGRESS_VALUE_TAG: string = 'PROGRESS_VALUE';

  /**
   * The is start tag.
   */
  static readonly IS_START: string = 'IS_START';

  /**
   * The percent of text input dialog width.
   */
  static readonly DIALOG_WIDTH: string = '93%'

  /**
   * The percent of text input divider width width.
   */
  static readonly DIVIDER_WIDTH: string = '90%';

  /**
   * The percent of current situation width.
   */
  static readonly SITUATION_WIDTH: string = '93%';

  /**
   * The percent of full width.
   */
  static readonly FULL_WIDTH: string = '100%';

  /**
   * The percent of full height.
   */
  static readonly FULL_HEIGHT: string = '100%';
  /**
   * The interval of sensor.
   */
  static readonly SENSOR_INTERVAL: number = 10000000;
}