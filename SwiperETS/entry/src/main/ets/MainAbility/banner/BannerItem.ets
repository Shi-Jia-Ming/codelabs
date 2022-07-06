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

const imageData: any[] = [
  { 'id': '1', 'name': '第一张图片标题', 'image': $r('app.media.image1') },
  { 'id': '2', 'name': '第二张图片标题', 'image': $r('app.media.image2') },
  { 'id': '3', 'name': '第三张图片标题', 'image': $r('app.media.image3') },
  { 'id': '4', 'name': '第四张图片标题', 'image': $r('app.media.image4') },
  { 'id': '5', 'name': '第五张图片标题', 'image': $r('app.media.image5') },
  { 'id': '6', 'name': '第六张图片标题', 'image': $r('app.media.image6') }
]

/**
 * 轮播图数据模型
 *
 * @param id id
 * @param name 标题
 * @param image 图片
 */
export class BannerItem{
  id: string;
  name: string;
  image: Resource;

  constructor(id: string, name: string, image: Resource) {
    this.id = id;
    this.name = name;
    this.image = image;
  }
}

export function initializeOnStartup(type: number): Array<BannerItem> {
  let imageDataArray: Array<BannerItem> = []
  imageData.forEach((item, index) => {
    if (type == 0) {
      if (index > 2) {
        imageDataArray.push(new BannerItem(item.id, item.name, item.image));
      }
    } else {
      if (index < 3) {
        imageDataArray.push(new BannerItem(item.id, item.name, item.image));
      }
    }
  })
  return imageDataArray;
}