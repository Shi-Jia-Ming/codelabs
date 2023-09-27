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
import Notification from '@ohos.notificationManager';
import DatabaseUtils from '../common/utils/DatabaseUtils';
import DateUtils from '../common/utils/DateUtils';
import Logger from "../common/utils/Logger"
import SensorData from '../common/database/SensorData';
import CommonConstants from '../common/constants/CommonConstants';
import { GlobalContext } from '../common/utils/GlobalContext';

/**
 * The MainPage is the entry point of the application and shows how to develop the MainPage.
 * Steps are added every 10 seconds on the main page.
 * Messages are displayed on the notification bar. Card data can be updated normally.
 * Developers can modify the interval and self-open notification bar messages.
 */
@Entry
@Component
struct MainPage {
  @State stepsValue: number = 0;
  private intervalId: number = 0;
  private iconStepsBackground: Resource = $r('app.media.icon_steps_background');

  aboutToAppear() {
    let rdbStoreValue: DataRdb.RdbStore = GlobalContext.getContext().getObject('rdbStore') as DataRdb.RdbStore;
    this.requestNotification();
    DatabaseUtils.getSensorData(rdbStoreValue, DateUtils.getDate(0))
      .then((sensorData: SensorData) => {
        if (sensorData) {
          this.stepsValue = sensorData.stepsValue;
        }
        // Start the timer.
        this.intervalId = setInterval(() => {
          this.stepsValue += CommonConstants.INTERVAL_STEPS_VALUE;
          DatabaseUtils.insertValues(this.stepsValue, rdbStoreValue);
          DatabaseUtils.updateForms(this.stepsValue, rdbStoreValue);
          DatabaseUtils.sendNotifications(this.stepsValue.toString());
        }, CommonConstants.INTERVAL_DELAY_TIME);
      }).catch((error: Error) => {
      Logger.error(CommonConstants.MAIN_PAGE_TAG, 'getSensorData error ' + JSON.stringify(error));
    });
  }

  aboutToDisappear() {
    clearInterval(this.intervalId);
    // Cancel message all notifications.
    Notification.cancelAll((data) => {
      Logger.info(CommonConstants.MAIN_PAGE_TAG, 'cancelAll data ' + JSON.stringify(data));
    });
  }

  // Request notification bar permissions.
  requestNotification() {
    Notification.requestEnableNotification().then(() => {
      Logger.info(CommonConstants.MAIN_PAGE_TAG, 'requestEnableNotification success');
    }).catch((err: Error) => {
      Logger.error(CommonConstants.MAIN_PAGE_TAG, 'requestEnableNotification failed : ' + JSON.stringify(err));
    });
  }

  build() {
    Stack() {
      Image(this.iconStepsBackground)
        .width(CommonConstants.FULL_WIDTH)
        .height(CommonConstants.FULL_HEIGHT)
        .objectFit(ImageFit.Cover)

      Column() {
        Text($r('app.string.main_text_title'))
          .progressTextStyle(CommonConstants.MAIN_TITLE_TEXT_FONT_SIZE, FontWeight.Medium)
          .margin({
            top: CommonConstants.MAIN_TITLE_TEXT_MARGIN_TOP,
            bottom: CommonConstants.MAIN_TITLE_TEXT_MARGIN_BOTTOM
          })

        Row() {
          Text(this.stepsValue.toString())
            .progressTextStyle(CommonConstants.MAIN_CONTENT_TEXT_FONT_SIZE, FontWeight.Bold)

          Text($r('app.string.steps'))
            .progressTextStyle(CommonConstants.MAIN_TITLE_TEXT_FONT_SIZE, FontWeight.Medium)
        }
      }
      .width(CommonConstants.FULL_WIDTH)
      .height(CommonConstants.FULL_HEIGHT)
    }
  }
}

// Steps text common style.
@Extend(Text) function progressTextStyle(styleFontSize: number, styleFontWeight: number) {
  .fontColor(Color.White)
  .fontSize(styleFontSize)
  .fontWeight(styleFontWeight)
}