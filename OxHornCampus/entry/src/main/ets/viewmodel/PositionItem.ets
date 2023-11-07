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

import { PositionType } from '../common/constants/CommonConstants';

/**
 * Landmark location data.
 */
export class PositionItem {
  icon: Resource = $r('app.media.ic_train_station');
  text: Resource = $r('app.string.train_station');

  /**
   * Facility Category.
   */
  type: PositionType = PositionType.TRAIN_STATION;

  /**
   * Facility Point Coordinates.
   */
  lngLat: Array<GeoCoordinates> = [];
}

/**
 * Geographical coordinates, longitude and latitude.
 */
export class GeoCoordinates {
  longitude: number = 0;
  latitude: number = 0;
}

/**
 * PixelCoordinates.
 */
export class PixelCoordinates{
  coordinateX: number = 0;
  coordinateY: number = 0;
}