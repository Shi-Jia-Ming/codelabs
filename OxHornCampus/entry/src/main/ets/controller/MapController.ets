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

import { AddressItem, Location } from '../viewmodel/AddressItem';
import { CommonConstants as Const } from '../common/constants/CommonConstants';
import Logger from '../common/utils/Logger';

const TAG = 'MapController';

/**
 * Used for map control.
 */
export class MapController {
  private leftTop: Array<number> = [];
  private previousScale: number = 0;
  private pinchCount: number = 0;
  private panX: number = 0;
  private panY: number = 0;

  /**
   * Initialize the map.
   *
   * @param mapContext This object of MapComponent.
   */
  initLeftTop(screenMapWidth: number, mapWidth: number): void {
    this.leftTop = [(screenMapWidth - mapWidth), 0];
  }

  /**
   * When the map is pinched.
   *
   * @param event Kneading gesture event.
   */
  pinchUpdate(event: GestureEvent, callBack: Function): void {
    let scale = Number.parseFloat(event.scale.toFixed(Const.MAP_SCALE_ACCURACY));
    let ratio = 1;
    if (this.previousScale !== scale) {
      if (event.scale < 1) {
        ratio = 1 / Const.MAP_ZOOM_RATIO;
        this.pinchCount--;
      } else {
        ratio = Const.MAP_ZOOM_RATIO;
        this.pinchCount++;
      }
      if (this.pinchCount > Const.ZOOM_MAX_TIMES) {
        this.pinchCount = Const.ZOOM_MAX_TIMES;
        return;
      }
      if (this.pinchCount < 0) {
        this.pinchCount = 0;
        return;
      }
      callBack(ratio);
    }
    this.previousScale = scale;
  }

  /**
   * End of map kneading gesture.
   */
  pinchEnd(screenMapWidth: number, mapWidth: number, mapHeight: number): void {
    let minX = screenMapWidth - mapWidth;
    let minY = (1 / this.mapMultiples() - 1) * mapHeight;
    this.leftTop = [minX, minY];
  }

  /**
   * Double-click the map.
   */
  tapAction(callBack: Function): void {
    let isMaxTime: boolean = false;
    if (++this.pinchCount > Const.ZOOM_MAX_TIMES) {
      this.pinchCount = Const.ZOOM_MAX_TIMES;
      isMaxTime = true;
    }
    this.leftTop = callBack(isMaxTime);
  }

  /**
   * Panning gestures.
   *
   * @param event Events when panning.
   */
  panUpdate(event: GestureEvent, callBack: Function): void {
    let panX = Number.parseInt(event.offsetX.toFixed(0));
    let panY = Number.parseInt(event.offsetY.toFixed(0));
    if ((this.panX !== panX) || (this.panY !== panY)) {
      let mapPanX = panX - this.panX;
      let mapPanY = panY - this.panY;
      callBack(mapPanX, mapPanY, this.leftTop);
    }
    this.panX = panX;
    this.panY = panY;
  }

  /**
   * End of panning gesture.
   */
  panEnd(): void {
    this.panX = 0;
    this.panY = 0;
  }

  /**
   * Calculating Landmark Locations.
   */
  calLandmarksPosition(data: AddressItem): void {
    data.locations = data.locations.map((item: Location) => {
      item.positionX = item.oriPositionX * this.mapMultiples() -
        Const.MAP_LANDMARKS_SIZE * Const.MAP_ZOOM_RATIO / Const.DOUBLE_OR_HALF;
      item.positionY = item.oriPositionY * this.mapMultiples() -
        Const.MAP_LANDMARKS_SIZE * Const.MAP_ZOOM_RATIO;
      return item;
    })
  }

  /**
   * Obtains the map magnification.
   *
   * @returns Map magnification.
   */
  mapMultiples(): number {
    return Math.pow(Const.MAP_ZOOM_RATIO, this.pinchCount);
  }

  /**
   * Obtains the resource name.
   *
   * @param resource Resource file.
   * @returns Resource File Name.
   */
  getResourceString(resource: Resource): string {
    let resourceString: string = '';
    try {
      resourceString = getContext(this).resourceManager.getStringSync(resource.id);
    } catch (error) {
      Logger.error(TAG, `getResourceString failed, error is ${JSON.stringify(error)}`);
    }
    return resourceString;
  }
}

let mapController = new MapController();

export default mapController as MapController;