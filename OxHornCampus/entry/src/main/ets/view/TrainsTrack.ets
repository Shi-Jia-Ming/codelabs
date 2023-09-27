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

import { TrainsMap, Position } from '../common/bean/TrainsMap';
import { CommonConstants as Const, TrainsLine } from '../common/constants/CommonConstants';
import TrainsMapModel from '../viewmodel/TrainsMapModel';

@Component
export default struct TrainsTrack {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  private settings1: RenderingContextSettings = new RenderingContextSettings(true);
  private contextTrainLine: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings1);
  private imgTrain: ImageBitmap = new ImageBitmap(Const.TRAIN_URL);
  private imgCircle: ImageBitmap = new ImageBitmap(Const.CIRCLE_URL);
  private trainLine: number = 0;
  @State canvasWidth: number = 0;
  @State canvasHeight: number = 0;
  @State trainX: number = 0;
  @State trainY: number = 0;
  @State bgX: number = 0;
  @State bgY: number = 0;
  @State currentIndex: number = 0;
  @State rotateAngle: number = Const.INIT_ROTATE_ANGLE;
  @State positionStart: Position = new Position();
  @State positionEnd: Position = new Position();
  @State sumDistance: number = 0;
  @State delay: number = 10;
  @ObjectLink trainsInfo: TrainsMap;

  aboutToAppear() {
    this.sumDistance = TrainsMapModel.calcDistance(this.trainsInfo.lineData);
    this.delay = TrainsMapModel.calcDelay(this.sumDistance, this.trainLine);
    this.fetchStartPosition();
  }

  /**
   * Obtain initial position.
   */
  fetchStartPosition() {
    const travelDistance = TrainsMapModel.travelDistance(this.sumDistance, this.fetchStartTime(this.trainLine), this.trainLine);
    this.calcFirstDistance(this.trainsInfo.lineData, travelDistance);
  }

  fetchStartTime(index: number): string {
    let ret = Const.LINE_ONE_START_TIME;
    const date = new Date();
    const weekday = date.getDay();
    if (index === TrainsLine.LINE_THREE && weekday === 6) {
      ret = Const.LINE_THREE_WEEKEND_START_TIME;
    }
    return ret;
  }

  calcFirstDistance(data: Position[], travelDistance: number) {
    let sumDistance: number = 0;
    const length = data.length;

    for (let index = 0;index < length; index++) {
      if (sumDistance > travelDistance) {
        this.currentIndex = index - 1;
        this.trainX = data[index - 1].x;
        this.trainY = data[index - 1].y;
        this.calcPosition(this.trainX, this.trainY, this.canvasWidth, this.canvasHeight);
        break;
      } else {
        const startX = data[index].x, startY = data[index].y;
        const endX = index === length - 1 ? data[0].x : data[index+1].x,
          endY = index === length - 1 ? data[0].y : data[index+1].y;
        if (Math.abs(startX - endX) >= Math.abs(startY - endY)) {
          sumDistance += Math.abs(startX - endX);
        } else {
          sumDistance += Math.abs(startY - endY);
        }
      }
    }
  }

  calcPosition(x: number, y: number, w: number, h: number) {
    if (x + this.bgX > w - Const.HORIZONTAL_THRESHOLD) {
      this.bgX = Math.abs(this.bgX - w / 2) > Const.CANVAS_WIDTH - w ? -Const.CANVAS_WIDTH + w : this.bgX - w / 2;
    }

    if (x + this.bgX < Const.HORIZONTAL_THRESHOLD) {
      this.bgX = Math.abs(this.bgX + w / 2) < 0 ? 0 : this.bgX + w / 2;
    }

    if (y + this.bgY > h - Const.VERTICAL_THRESHOLD) {
      this.bgY = Math.abs(this.bgY - h / 2) > Const.CANVAS_HEIGHT - h ? -Const.CANVAS_HEIGHT + h : this.bgY - h / 2;
    }

    if (y + this.bgY < Const.VERTICAL_THRESHOLD) {
      this.bgY = Math.abs(this.bgY + h / 2) < 0 ? 0 : this.bgY + h / 2;
    }
  }

  /**
   *  Draw the next location of the train.
   */
  drawTrainPosition() {
    if (Math.abs(this.trainX - this.positionEnd.x) <= Const.AVERAGE_ERROR &&
      Math.abs(this.trainY - this.positionEnd.y) <= Const.AVERAGE_ERROR) {
      this.trainX = this.positionEnd.x;
      this.trainY = this.positionEnd.y;
      if (this.currentIndex === this.trainsInfo.lineData.length - 2) {
        this.currentIndex = 0;
      } else {
        this.currentIndex += 1;
      }
    }
    this.positionStart = this.trainsInfo.lineData[this.currentIndex];
    this.positionEnd = this.trainsInfo.lineData[this.currentIndex + 1];
    this.rotateAngle = Const.BASIC_ROTATE_ANGLE +
      TrainsMapModel.fetchDirection(this.positionStart.x, this.positionStart.y, this.positionEnd.x, this.positionEnd.y);

    this.contextTrainLine.clearRect(0, 0, this.canvasWidth, this.canvasHeight);
    this.trainX += TrainsMapModel.fetchRatioX(this.positionStart, this.positionEnd);
    this.trainY += TrainsMapModel.fetchRatioY(this.positionStart, this.positionEnd);
    this.calcPosition(this.trainX, this.trainY, this.canvasWidth, this.canvasHeight);
    this.context.clearRect(0, 0, this.canvasWidth, this.canvasHeight);
    this.context.drawImage(this.trainsInfo.imgBg, this.bgX, this.bgY, Const.CANVAS_WIDTH, Const.CANVAS_HEIGHT);
    this.contextTrainLine.drawImage(
      this.imgTrain,
      this.trainX + this.bgX - Const.TRAIN_OFFSET_X,
      this.trainY + this.bgY - Const.TRAIN_OFFSET_Y,
      Const.TRAIN_WIDTH,
      Const.TRAIN_HEIGHT
    );
    this.contextTrainLine.drawImage(
      this.imgCircle,
      this.trainX + this.bgX - Const.CIRCLE_OFFSET_X,
      this.trainY + this.bgY - Const.CIRCLE_OFFSET_Y,
      Const.CIRCLE_WIDTH,
      Const.CIRCLE_HEIGHT
    );
  }

  build() {
    Stack() {
      Canvas(this.context)
        .width(Const.FULL_SIZE)
        .aspectRatio(Const.CANVAS_ASPECT_RADIO)
        .borderRadius(Const.CANVAS_BORDER_RADIUS)
        .onReady(() => {
          this.context.drawImage(this.trainsInfo.imgBg, this.bgX, this.bgY, Const.CANVAS_WIDTH, Const.CANVAS_HEIGHT);
          this.canvasWidth = this.context.width;
          this.canvasHeight = this.context.height;
        })

      Image(Const.ARROW_URL)
        .width(Const.ARROW_WIDTH)
        .height(Const.ARROW_HEIGHT)
        .position({
          x: this.trainX + this.bgX - Const.ARROW_OFFSET_X,
          y: this.trainY + this.bgY - Const.ARROW_OFFSET_Y
        })
        .rotate({
          x: 0,
          y: 0,
          z: 1,
          angle: this.rotateAngle
        })

      Canvas(this.contextTrainLine)
        .width(Const.FULL_SIZE)
        .aspectRatio(Const.CANVAS_ASPECT_RADIO)
        .borderRadius(Const.CANVAS_BORDER_RADIUS)
        .onReady(() => {
          this.contextTrainLine.drawImage(
            this.imgTrain,
            this.trainX + this.bgX - Const.TRAIN_OFFSET_X,
            this.trainY + this.bgY - Const.TRAIN_OFFSET_Y,
            Const.TRAIN_WIDTH,
            Const.TRAIN_HEIGHT
          );
          this.contextTrainLine.drawImage(
            this.imgCircle,
            this.trainX + this.bgX - Const.CIRCLE_OFFSET_X,
            this.trainY + this.bgY - Const.CIRCLE_OFFSET_Y,
            Const.CIRCLE_WIDTH,
            Const.CIRCLE_HEIGHT
          );
          setInterval(() => {
            this.drawTrainPosition();
          }, this.delay)
        })
    }
  }
}