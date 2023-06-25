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

import reminderAgent from '@ohos.reminderAgentManager';
import notification from '@ohos.notificationManager';
import preferences from '@ohos.data.preferences';
import Logger from '../common/utils/Logger';
import { H_STORE, REMINDER_AGENT_TAG, PACKAGE_NAME, ENTRY_ABILITY } from '../common/constants/CommonConstants';

// publishReminder
function publishReminder(params: any, context: Context) {
  if (!params) {
    Logger.error(REMINDER_AGENT_TAG, 'publishReminder params is empty');
    return;
  }
  let notifyId = params.notificationId.toString();
  hasPreferencesValue(context, notifyId, (preferences: preferences.Preferences, hasValue: boolean) => {
    if (hasValue) {
      preferences.get(notifyId, -1, (error: Error, value: number) => {
        if (value >= 0) {
          reminderAgent.cancelReminder(value).then(() => {
            processReminderData(params, preferences, notifyId);
          }).catch((err) => {
            Logger.error(REMINDER_AGENT_TAG, `cancelReminder err: ${err}`);
          });
        } else {
          Logger.error(REMINDER_AGENT_TAG, 'preferences get value error ' + JSON.stringify(error));
        }
      });
    } else {
      processReminderData(params, preferences, notifyId);
    }
  });
}

// cancelReminder
function cancelReminder(reminderId, context) {
  if (!reminderId) {
    Logger.error(REMINDER_AGENT_TAG, 'cancelReminder reminderId is empty');
    return;
  }
  let reminder = reminderId.toString();
  hasPreferencesValue(context, reminder, (preferences: preferences.Preferences, hasValue: boolean) => {
    if (!hasValue) {
      Logger.error(REMINDER_AGENT_TAG, 'cancelReminder preferences value is empty');
      return;
    }
    getPreferencesValue(preferences, reminder);
  });
}

// hasNotificationId
function hasNotificationId(params: number) {
  if (!params) {
    Logger.error(REMINDER_AGENT_TAG, 'hasNotificationId params is undefined');
    return;
  }
  return reminderAgent.getValidReminders().then((reminders) => {
    if (!reminders.length) {
      return false;
    }
    let notificationIdList = [];
    for (let i = 0; i < reminders.length; i++) {
      notificationIdList.push(reminders[i].notificationId);
    }
    const flag = notificationIdList.indexOf(params);

    return flag === -1 ? false : true;
  });
}

function hasPreferencesValue(context: Context, hasKey: string, callback: Function) {
  let preferencesPromise = preferences.getPreferences(context, H_STORE);
  preferencesPromise.then((preferences: preferences.Preferences) => {
    preferences.has(hasKey).then((hasValue: boolean) => {
      callback(preferences, hasValue);
    });
  });
}

// processReminderData
function processReminderData(params: object, preferences: preferences.Preferences, notifyId: string) {
  let timer = fetchData(params);
  reminderAgent.publishReminder(timer).then((reminderId: number) => {
    putPreferencesValue(preferences, notifyId, reminderId);
  }).catch((err) => {
    Logger.error(REMINDER_AGENT_TAG, `publishReminder err: ${err}`);
  });
}

// fetchData
function fetchData(params): reminderAgent.ReminderRequestAlarm {
  return {
    reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
    hour: params.hour || 0,
    minute: params.minute || 0,
    daysOfWeek: params.daysOfWeek || [],
    wantAgent: {
      pkgName: PACKAGE_NAME,
      abilityName: ENTRY_ABILITY
    },
    title: params.title || '',
    content: params.content || '',
    notificationId: params.notificationId || -1,
    slotType: notification.SlotType.SOCIAL_COMMUNICATION
  }
}

function putPreferencesValue(preferences: preferences.Preferences, putKey: string, putValue: number) {
  preferences.put(putKey, putValue).then(() => {
    preferences.flush();
  }).catch((error) => {
    Logger.error(REMINDER_AGENT_TAG, 'preferences put value error ' + JSON.stringify(error));
  });
}

function getPreferencesValue(preferences: preferences.Preferences, getKey: string) {
  preferences.get(getKey, -1).then((value: number) => {
    if (value >= 0) {
      reminderAgent.cancelReminder(value).then(() => {
        Logger.info(REMINDER_AGENT_TAG, 'cancelReminder promise success');
      }).catch((err) => {
        Logger.error(REMINDER_AGENT_TAG, `cancelReminder err: ${err}`);
      });
    }
  }).catch((error) => {
    Logger.error(REMINDER_AGENT_TAG, 'preferences get value error ' + JSON.stringify(error));
  });
}

const reminder = {
  publishReminder,
  cancelReminder,
  hasNotificationId
}

export default reminder;