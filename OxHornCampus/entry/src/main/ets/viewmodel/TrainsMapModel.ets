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

import { TrainsMap, Position } from './TrainsMap';
import { TrainsLine, CommonConstants as Const } from '../common/constants/CommonConstants';

class TrainsMapModel {
  /**
   * Calculate the time interval for redrawing.
   */
  calcDelay(distance: number, line: number): number {
    let ret: number = 0;
    switch (line) {
      case TrainsLine.LINE_ONE:
        ret = Const.LINE_ONE_TIME / distance;
        break;
      case TrainsLine.LINE_TWO:
        ret = Const.LINE_TWO_TIME / distance;
        break;
      case TrainsLine.LINE_THREE:
        ret = Const.LINE_THREE_TIME / distance;
        break;
      default:
        ret = 0;
    }
    return ret;
  }

  /**
   *  Calculate the distance traveled by a train for one lap.
   */
  calcDistance(data: Position[]): number {
    let sumDistance: number = 0;
    const length = data.length;
    data.forEach((item: Position, index: number) => {
      const startX = item.x;
      const startY = item.y;
      const endX = index === length - 1 ? data[0].x : data[index + 1].x;
      const endY = index === length - 1 ? data[0].y : data[index + 1].y;
      if (Math.abs(startX - endX) >= Math.abs(startY - endY)) {
        sumDistance += Math.abs(startX - endX);
      } else {
        sumDistance += Math.abs(startY - endY);
      }
    })
    return sumDistance;
  }

  /**
   * The distance traveled by the train.
   */
  travelDistance(distance: number, startTime: string, line: number): number {
    let ret: number = 0;
    const date = new Date();
    const dateStr = `${date.getFullYear()}-${date.getMonth() + 1}-${date.getDate()} `;
    const startDate = new Date(dateStr + startTime).getTime();
    const currentDate = date.getTime();
    const diff = currentDate - startDate;

    switch (line) {
      case TrainsLine.LINE_ONE:
        ret = distance * (diff % (Const.LINE_ONE_TIME)) / (Const.LINE_ONE_TIME);
        break;
      case TrainsLine.LINE_TWO:
        ret = distance * (diff % (Const.LINE_TWO_TIME)) / (Const.LINE_TWO_TIME);
        break;
      case TrainsLine.LINE_THREE:
        ret = distance * (diff % (Const.LINE_THREE_TIME)) / (Const.LINE_THREE_TIME);
        break;
      default:
        ret = 0;
    }
    return Number(ret.toFixed(2));
  }

  fetchDirection(startX: number, startY: number, endX: number, endY: number): number {
    let ret: number = 0;
    if (startX === endX) {
      return startY > endY ? 0 : Const.DIRECTION * 2;
    }
    if (startY === endY) {
      return startX > endX ? -Const.DIRECTION : Const.DIRECTION;
    }
    let angle = this.calcAngle(startX, startY, endX, endY);
    if (startX > endX && startY > endY) {
      ret = -(Const.DIRECTION - angle);
    }
    if (startX > endX && startY < endY) {
      ret = -Const.DIRECTION - angle;
    }
    if (startX < endX && startY > endY) {
      ret = Const.DIRECTION - angle;
    }
    if (startX < endX && startY < endY) {
      ret = Const.DIRECTION + angle;
    }
    return ret;
  }

  calcAngle(startX: number, startY: number, endX: number, endY: number): number {
    const x = Math.abs(startX - endX);
    const y = Math.abs(startY - endY);
    const radianA = Math.atan(y / x);
    const angleA = Math.round(Const.PI_ANGLE / Math.PI * radianA);
    return angleA;
  }

  fetchRatioX(start: Position, end: Position): number {
    let diffX = start.x - end.x;
    let diffY = start.y - end.y;
    if (Math.abs(diffX) >= Math.abs(diffY)) {
      return -diffX / Math.abs(diffX);
    } else {
      return -Number((diffX / Math.abs(diffY)).toFixed(2));
    }
  }

  fetchRatioY(start: Position, end: Position): number {
    let diffX = start.x - end.x;
    let diffY = start.y - end.y;
    if (Math.abs(diffY) >= Math.abs(diffX)) {
      return -diffY / Math.abs(diffY);
    } else {
      return -Number((diffY / Math.abs(diffX)).toFixed(2));
    }
  }
}

let trainsMapModel = new TrainsMapModel();

export default trainsMapModel as TrainsMapModel;

export const PositionList: Array<TrainsMap> = [
  {
    imgBg: new ImageBitmap('common/images/ic_line1.png'),
    interval: 10,
    lineData: [
      { x: 318, y: 132 },
      { x: 296, y: 131 },
      { x: 283, y: 129 },
      { x: 275, y: 126 },
      { x: 262, y: 116 },
      { x: 248, y: 111 },
      { x: 235, y: 121 },
      { x: 219, y: 140 },
      { x: 159, y: 194 },
      { x: 134, y: 245 },
      { x: 138, y: 271 },
      { x: 163, y: 284 },
      { x: 258, y: 266 },
      { x: 271, y: 254 },
      { x: 278, y: 237 },
      { x: 284, y: 220 },
      { x: 290, y: 215 },
      { x: 302, y: 215 },
      { x: 340, y: 215 },
      { x: 362, y: 193 },
      { x: 374, y: 164 },
      { x: 357, y: 146 },
      { x: 335, y: 135 },
      { x: 318, y: 132 }
    ]
  },
  {
    imgBg: new ImageBitmap("common/images/ic_line2.png"),
    interval: 17,
    lineData: [
      { x: 657, y: 394 },
      { x: 640, y: 391 },
      { x: 557, y: 352 },
      { x: 535, y: 343 },
      { x: 518, y: 341 },
      { x: 503, y: 331 },
      { x: 502, y: 321 },
      { x: 507, y: 312 },
      { x: 531, y: 294 },
      { x: 548, y: 288 },
      { x: 564, y: 281 },
      { x: 565, y: 273 },
      { x: 485, y: 210 },
      { x: 466, y: 185 },
      { x: 457, y: 177 },
      { x: 444, y: 174 },
      { x: 409, y: 170 },
      { x: 374, y: 164 },
      { x: 357, y: 146 },
      { x: 335, y: 135 },
      { x: 318, y: 132 },
      { x: 296, y: 131 },
      { x: 283, y: 129 },
      { x: 275, y: 126 },
      { x: 262, y: 116 },
      { x: 248, y: 111 },
      { x: 235, y: 121 },
      { x: 219, y: 140 },
      { x: 159, y: 194 },
      { x: 134, y: 245 },
      { x: 138, y: 271 },
      { x: 163, y: 284 },
      { x: 258, y: 266 },
      { x: 271, y: 254 },
      { x: 278, y: 237 },
      { x: 284, y: 220 },
      { x: 290, y: 215 },
      { x: 302, y: 215 },
      { x: 340, y: 215 },
      { x: 362, y: 193 },
      { x: 374, y: 178 },
      { x: 409, y: 170 },
      { x: 444, y: 174 },
      { x: 457, y: 177 },
      { x: 466, y: 185 },
      { x: 485, y: 210 },
      { x: 565, y: 273 },
      { x: 564, y: 281 },
      { x: 570, y: 290 },
      { x: 584, y: 296 },
      { x: 617, y: 320 },
      { x: 643, y: 328 },
      { x: 667, y: 329 },
      { x: 682, y: 329 },
      { x: 695, y: 337 },
      { x: 706, y: 350 },
      { x: 708, y: 360 },
      { x: 704, y: 369 },
      { x: 678, y: 390 },
      { x: 657, y: 394 }
    ]
  },
  {
    imgBg: new ImageBitmap("common/images/ic_line3.png"),
    interval: 37,
    lineData: [
      { x: 248, y: 111 },
      { x: 235, y: 121 },
      { x: 219, y: 140 },
      { x: 159, y: 194 },
      { x: 134, y: 245 },
      { x: 138, y: 271 },
      { x: 163, y: 284 },
      { x: 258, y: 266 },
      { x: 271, y: 254 },
      { x: 278, y: 237 },
      { x: 284, y: 220 },
      { x: 290, y: 215 },
      { x: 302, y: 215 },
      { x: 340, y: 215 },
      { x: 362, y: 193 },
      { x: 374, y: 178 },
      { x: 409, y: 170 },
      { x: 444, y: 174 },
      { x: 457, y: 177 },
      { x: 466, y: 185 },
      { x: 485, y: 210 },
      { x: 565, y: 273 },
      { x: 564, y: 281 },
      { x: 570, y: 290 },
      { x: 584, y: 296 },
      { x: 617, y: 320 },
      { x: 643, y: 326 },
      { x: 667, y: 329 },
      { x: 679, y: 329 },
      { x: 695, y: 335 },
      { x: 728, y: 357 },
      { x: 750, y: 368 },
      { x: 804, y: 443 },
      { x: 805, y: 454 },
      { x: 798, y: 459 },
      { x: 778, y: 462 },
      { x: 759, y: 462 },
      { x: 745, y: 456 },
      { x: 720, y: 432 },
      { x: 713, y: 415 },
      { x: 721, y: 397 },
      { x: 750, y: 368 },
      { x: 736, y: 359 },
      { x: 728, y: 357 },
      { x: 720, y: 359 },
      { x: 678, y: 390 },
      { x: 657, y: 394 },
      { x: 640, y: 391 },
      { x: 557, y: 352 },
      { x: 535, y: 343 },
      { x: 518, y: 341 },
      { x: 503, y: 331 },
      { x: 502, y: 321 },
      { x: 507, y: 312 },
      { x: 531, y: 294 },
      { x: 548, y: 288 },
      { x: 564, y: 281 },
      { x: 565, y: 273 },
      { x: 485, y: 210 },
      { x: 466, y: 185 },
      { x: 457, y: 177 },
      { x: 444, y: 174 },
      { x: 409, y: 170 },
      { x: 374, y: 164 },
      { x: 357, y: 146 },
      { x: 335, y: 135 },
      { x: 318, y: 132 },
      { x: 296, y: 131 },
      { x: 283, y: 129 },
      { x: 275, y: 126 },
      { x: 262, y: 116 },
      { x: 248, y: 111 }
    ]
  }
]