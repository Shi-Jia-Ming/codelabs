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

/**
 * Home page list information.
 */
export default class IndexItem {
  /**
   * List item name.
   */
  title: ResourceStr;

  /**
   * List item description.
   */
  description: ResourceStr;

  /**
   * Button text information.
   */
  button: ResourceStr;

  /**
   * Background image information.
   */
  icon: Resource;

  /**
   * Jumping path information.
   */
  url: string;

  constructor(title: ResourceStr, description: ResourceStr, button: ResourceStr, icon: Resource, url: string) {
    this.title = title;
    this.description = description;
    this.button = button;
    this.icon = icon;
    this.url = url;
  }
}