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

import Point from '../common/bean/Point';

const TWO_PI: number = 2 * Math.PI;

@Observed
export class AxisModel {
  private radius: number;
  private num: number;
  public points: Point[] = [];

  constructor(radius: number, num: number) {
    this.radius = radius;
    this.addPoints(num);
  }

  addPoints(num: number) {
    if (num <= 0) {
      return;
    }
    this.points = [];
    this.num = num;
    for (let i = 0; i < num; i++) {
      let x = this.radius * Math.cos(TWO_PI * i / this.num);
      let y = this.radius * Math.sin(TWO_PI * i / this.num);
      this.points.push(new Point(x, y));
    }
  }
}