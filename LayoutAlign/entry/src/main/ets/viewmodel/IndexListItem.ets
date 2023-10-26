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
import { FLEX_MODULE } from './AttributeModuleData';
import { CONTAINER, CONTAINER_TYPE } from '../common/constants/CommonConstants';
import { ContainerModuleItem } from './ContainerModuleItem'

/*
 * class for IndexListItem
 */
export class IndexListItem {
  name: string = CONTAINER.FLEX;
  icon: Resource = $r('app.media.ic_flex');
  containerType: number = CONTAINER_TYPE.FLEX;
  moduleList: ContainerModuleItem[] = FLEX_MODULE;
}