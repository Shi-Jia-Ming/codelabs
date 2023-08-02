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

import { PixelCoordinates } from '../bean/PositionItem';
import { CommonConstants as Const } from '../constants/CommonConstants';

/**
 * Geographical coordinate conversion tool.
 */
export class Geography {

  /**
   * The Mercator projection calculates the pixel coordinate system, which may have stretching errors.
   *
   * @param Latitude
   * @param Longitude
   * @returns pixelCoordinates.
   */
  public static toPixelCoordinates(latitude: number, longitude: number): PixelCoordinates {
    // Calculations that associate the selected area with coordinates.
    const yMin = Geography.MercatorY(Const.SOUTH_LATITUDE);
    const yMax = Geography.MercatorY(Const.NORTH_LATITUDE);
    // Ratio of the image width range to the longitude.
    const xFactor = Const.MAP_WIDTH / (Const.EAST_LONGITUDE - Const.WEST_LONGITUDE);

    // Ratio of the latitude range to the height of the image.
    const yFactor = Const.MAP_HEIGHT / (yMax - yMin);

    let x = (longitude - Const.WEST_LONGITUDE) * xFactor + Const.X_ADJ;
    let y = (yMax - Geography.MercatorY(latitude)) * yFactor + Const.Y_ADJ;
    return { coordinateX: x, coordinateY: y }
  }

  /**
   * Find radians based on latitude.
   *
   * @param latitude.
   * @returns Radiance corresponding to the latitude.
   */
  public static MercatorY(latitude: number): number {
    return Math.log(Math.tan((latitude * Const.RADIAN_CONSTANT / Const.DOUBLE_OR_HALF) +
      (Const.QUARTER_CIRCLE)));
  }
}