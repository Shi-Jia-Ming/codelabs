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
 * initial data model.
 */
export default class LinkDataModel {
  /**
   * parentId
   */
  superId: number;
  /**
   * ParentName
   */
  superName: string;
  id: number;
  courseName: string;
  imageUrl: Resource;
  price: number;

  constructor(superId: number, superName: string, id: number, courseName: string, imageUrl: Resource, price: number) {
    this.superId = superId;
    this.superName = superName;
    this.id = id;
    this.courseName = courseName;
    this.imageUrl = imageUrl;
    this.price = price;
  }
}