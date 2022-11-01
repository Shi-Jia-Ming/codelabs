/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import {ContainerModuleItem} from './ContainerModuleItem'

/*
 * class for IndexListItem
 */
export class IndexListItem{
  private name : string;
  private  icon :Resource;
  private containerType : number
  private moduleList :ContainerModuleItem[];
  constructor(name : string,icon:Resource,containerType :number,moduleList :ContainerModuleItem[]){
    this.name = name;
    this.icon = icon;
    this.containerType = containerType;
    this.moduleList = moduleList;
  }
}