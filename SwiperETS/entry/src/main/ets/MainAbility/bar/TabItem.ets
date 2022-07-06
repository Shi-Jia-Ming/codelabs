/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

const tabData: any[] = [
  { 'id': '1', 'name': 'AI', 'imagePressed': $r('app.media.a1'), 'imageNormal': $r('app.media.a2')},
  { 'id': '2', 'name': '全球化', 'imagePressed': $r('app.media.b1'), 'imageNormal': $r('app.media.b2')},
  { 'id': '3', 'name': '隐私', 'imagePressed': $r('app.media.c1'), 'imageNormal': $r('app.media.c2')},
  { 'id': '4', 'name': '通用', 'imagePressed': $r('app.media.d1'), 'imageNormal': $r('app.media.d2')}
]

/**
 * 底部导航栏模型
 *
 * @param id id
 * @param name 标题
 * @param imagePressed 按下状态的图片
 * @param imageNormal 默认状态的图片
 */
export class TabItem {
  id: string;
  name: string;
  imagePressed: Resource;
  imageNormal: Resource;

  constructor(id: string, name: string, imagePressed: Resource, imageNormal: Resource) {
    this.id = id;
    this.name = name;
    this.imagePressed = imagePressed;
    this.imageNormal = imageNormal;
  }
}

export function initializeOnStartup(): Array<TabItem> {
  let tabDataArray: Array<TabItem> = []
  tabData.forEach(item => {
    tabDataArray.push(new TabItem(item.id, item.name, item.imagePressed, item.imageNormal));
  })
  return tabDataArray;
}