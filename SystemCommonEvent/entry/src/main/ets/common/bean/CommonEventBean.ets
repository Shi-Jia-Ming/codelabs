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

/**
 * ButtonList item information
 */
export class CommonEventBean {
  /**
   * The title of common events.
   */
  title: Resource;

  /**
   * The name of common events.
   */
  name: Resource;

  /**
   * The state of common events.
   */
  state: Resource;

  /**
   * The change state of common event state.
   */
  changeState: boolean;

  /**
   * The title of the button.
   */
  buttonTitle: Resource;

  /**
   * Subscribed or not.
   */
  isSubscribe: boolean;

  /**
   * The subscriber of common events.
   */
  subscriber: any;

  /**
   * System public event name.
   */
  subEvents: string;

  /**
   * The icon of open state.
   */
  onIcon: Resource;

  /**
   * The icon of closed state.
   */
  offIcon: Resource;
}