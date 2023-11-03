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
 * Fill arc data.
 */
export default class FillArcData {
  /**
   * The x-axis coordinate of the center of the arc.
   */
  x: number;

  /**
   * The y-axis coordinate of the center of the arc.
   */
  y: number;

  /**
   * Radius of the arc.
   */
  radius: number;

  /**
   * The start point of the arc, in radians.
   */
  startAngle: number;

  /**
   * The end point of the arc, in radians.
   */
  endAngle: number;

  /**
   * The constructor of FillArcData.
   *
   * @param x The x-axis coordinate of the center of the arc.
   * @param y The y-axis coordinate of the center of the arc.
   * @param radius Radius of the arc.
   * @param startAngle The start point of the arc, in radians.
   * @param endAngle The end point of the arc, in radians.
   * @param fillColor The fill color of the arc.
   */
  constructor(x: number, y: number, radius: number, startAngle: number, endAngle: number) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.startAngle = startAngle;
    this.endAngle = endAngle;
  }
}
