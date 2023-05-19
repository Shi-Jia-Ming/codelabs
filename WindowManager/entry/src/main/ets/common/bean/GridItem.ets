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
 * Grid item data entity.
 */
export default class GridItem {
  /**
   * Title of grid item.
   */
  title: Resource;

  /**
   * Image of grid item.
   */
  image?: Resource;

  /**
   * Other resource of grid item.
   */
  others?: Resource;

  constructor(title: Resource, image?: Resource, others?: Resource) {
    this.title = title;
    this.image = image;
    this.others = others;
  }
}