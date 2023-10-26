/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import Common from '../common/constants/Const';
import IconItem from './IconItem';
import Point from './Point';

const TWO_PI: number = 2 * Math.PI;

@Observed
export class IconsModel {
  public imagerArr: Array<IconItem> = [];
  private num: number = Common.IMAGES_MIN;
  private radius: number;

  constructor(num: number, radius: number) {
    this.radius = radius;
    this.addImage(num);
  }

  public addImage(num: number) {
    this.num = num;
    if (this.imagerArr.length === num) {
      return;
    }
    if (this.imagerArr.length > num) {
      this.imagerArr.splice(num, this.imagerArr.length - num);
    } else {
      for (let i = this.imagerArr.length; i < num; i++) {
        const point = this.genPointByIndex(i);
        this.imagerArr.push(new IconItem(i, Common.IMAGE_RESOURCE[i], false, point));
      }
    }

    this.refreshPoint(num);
  }

  public refreshPoint(num: number) {
    for (let i = 0; i < num; i++) {
      this.imagerArr[i].point = this.genPointByIndex(i);
    }
  }

  public genPointByIndex(index: number): Point {
    const x = this.radius * Math.cos(TWO_PI * index / this.num);
    const y = this.radius * Math.sin(TWO_PI * index / this.num);
    return new Point(x, y);
  }

  public reset() {
    for (let i = 0; i < this.num; i++) {
      if (this.imagerArr[i].clicked) {
        this.imagerArr[i].clicked = false;
      }
    }
  }
}