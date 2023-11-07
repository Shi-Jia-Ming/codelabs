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

import { AddressItem, Location } from './AddressItem';
import { PositionItem, GeoCoordinates } from './PositionItem';
import { CommonConstants as Const, PositionType } from '../common/constants/CommonConstants';
import { Geography } from '../common/utils/Geography';
import MapController from '../controller/MapController';

/**
 * Initializing Map Data.
 */
export class MapModel {
  private data?: AddressItem;
  private addressArray: Array<AddressItem> = new Array(Const.MAP_LANDMARKS_LENGTH).fill(undefined);

  /**
   * Obtains landmark objects on the map based on the longitude and latitude.
   *
   * @param geoCoordinates Longitude and latitude.
   * @param type Landmark Type.
   * @param mapContext Objects in a map component.
   * @returns Landmark objects in the map.
   */
  calCoordinateByLonAndLat(geoCoordinates: Array<GeoCoordinates>, type: number, mapWidth: number, mapHeight: number): AddressItem {
    this.data = undefined;
    if (!this.addressArray[type - 1]) {
      let addressItem = new AddressItem();
      addressItem.name = mapLandmarksName[type-1];
      addressItem.icon = mapLandmarksIcon[type - 1];
      addressItem.locations = this.initLocationData(geoCoordinates, mapWidth, mapHeight);
      addressItem.textColor = mapLandmarksTextColor[type - 1];
      this.addressArray[type - 1] = addressItem;
    }
    this.data = this.addressArray[type - 1];
    return this.data;
  }

  /**
   * Initialize the coordinates of landmarks on the map.
   *
   * @param geoCoordinates Longitude and latitude data.
   * @returns Coordinates of landmarks on the map.
   */
  initLocationData(geoCoordinates: Array<GeoCoordinates>, mapWidth: number, mapHeight: number): Array<Location> {
    let locations: Array<Location> = [];
    geoCoordinates.forEach((item: GeoCoordinates) => {
      let pixelCoordinates = Geography.toPixelCoordinates(item.latitude, item.longitude);
      let positionX = pixelCoordinates.coordinateX * mapWidth / MapController.mapMultiples() / Const.MAP_WIDTH;
      let positionY = pixelCoordinates.coordinateY / Const.MAP_HEIGHT * mapHeight / MapController.mapMultiples();
      locations.push(new Location(positionX, positionY));
    })
    return locations;
  }
}

let mapModel = new MapModel();

export default mapModel as MapModel;

export const PositionList: Array<PositionItem> = [
  {
    icon: $r('app.media.ic_train_station'),
    text: $r('app.string.train_station'),
    type: PositionType.TRAIN_STATION,
    lngLat: [
      {
        longitude: 113.886514,
        latitude: 22.876813
      }
    ]
  },
  {
    icon: $r('app.media.ic_mother_child'),
    text: $r('app.string.mother_child_room'),
    type: PositionType.MOTHER_CHILD_ROOM,
    lngLat: [
      {
        longitude: 113.887914,
        latitude: 22.876813
      }
    ]
  },
  {
    icon: $r('app.media.ic_car_road'),
    text: $r('app.string.car_road'),
    type: PositionType.CAR_ROAD,
    lngLat: [
      {
        longitude: 113.886304,
        latitude: 22.875713
      }
    ]
  },
  {
    icon: $r('app.media.ic_cafe'),
    text: $r('app.string.cafe'),
    type: PositionType.CAFE,
    lngLat: [
      {
        longitude: 113.886004,
        latitude: 22.878518
      },
      {
        longitude: 113.889137,
        latitude: 22.880663
      }
    ]
  },
  {
    icon: $r('app.media.ic_smoking_area'),
    text: $r('app.string.smoking_area'),
    type: PositionType.SMOKING_AREA,
    lngLat: [
      {
        longitude: 113.88793,
        latitude: 22.875979
      }
    ]
  },
  {
    icon: $r('app.media.ic_convenience_store'),
    text: $r('app.string.convenience_store'),
    type: PositionType.CONVENIENCE_STORE,
    lngLat: [
      {
        longitude: 113.886104,
        latitude: 22.878618
      }
    ]
  },
  {
    icon: $r('app.media.ic_gymnasium'),
    text: $r('app.string.gymnasium'),
    type: PositionType.GYMNASIUM,
    lngLat: [
      {
        longitude: 113.887592,
        latitude: 22.876602
      }
    ]
  },
  {
    icon: $r('app.media.ic_restaurant'),
    text: $r('app.string.restaurant'),
    type: PositionType.RESTAURANT,
    lngLat: [
      {
        longitude: 113.889261,
        latitude: 22.880244
      }
    ]
  },
  {
    icon: $r('app.media.ic_side_walk'),
    text: $r('app.string.side_walk'),
    type: PositionType.SIDE_WALK,
    lngLat: [
      {
        longitude: 113.886312,
        latitude: 22.876207
      }
    ]
  },
  {
    icon: $r('app.media.ic_library'),
    text: $r('app.string.library'),
    type: PositionType.LIBRARY,
    lngLat: [
      {
        longitude: 113.88689,
        latitude: 22.876711
      }
    ]
  }
]

const mapLandmarksName: Array<Resource> = [
  $r('app.string.train_station'),
  $r('app.string.mother_child_room'),
  $r('app.string.car_road'),
  $r('app.string.cafe'),
  $r('app.string.smoking_area'),
  $r('app.string.convenience_store'),
  $r('app.string.gymnasium'),
  $r('app.string.restaurant'),
  $r('app.string.side_walk'),
  $r('app.string.library')
]

const mapLandmarksTextColor: Array<Resource> = [
  $r('app.color.train_station_color'),
  $r('app.color.mother_child_room_color'),
  $r('app.color.car_road_color'),
  $r('app.color.cafe_color'),
  $r('app.color.smoking_area_color'),
  $r('app.color.convenience_store_color'),
  $r('app.color.gymnasium_color'),
  $r('app.color.restaurant_color'),
  $r('app.color.side_walk_color'),
  $r('app.color.library_color')
]

const mapLandmarksIcon: Array<Resource> = [
  $r('app.media.ic_location_train'),
  $r('app.media.ic_location_nursing'),
  $r('app.media.ic_location_driveway'),
  $r('app.media.ic_location_cafe'),
  $r('app.media.ic_location_smoking'),
  $r('app.media.ic_location_shop'),
  $r('app.media.ic_location_gymnasium'),
  $r('app.media.ic_location_restaurant'),
  $r('app.media.ic_location_sidewalk'),
  $r('app.media.ic_location_library')
];