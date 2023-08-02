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

import { Location } from '../common/bean/AddressItem';
import { CommonConstants as Const } from '../common/constants/CommonConstants';
import Logger from '../common/utils/Logger';

const TAG = 'MapController';

/**
 * Used for map control.
 */
export class MapController {
  private mapContext: any;
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
  initMap(mapContext): void {
    this.mapContext = mapContext;
    this.mapContext.mapHeight = this.mapContext.screenMapHeight;
    this.mapContext.mapWidth = Const.MAP_WIDTH * this.mapContext.mapHeight / Const.MAP_HEIGHT;
    this.mapContext.mapX = (this.mapContext.screenMapWidth - this.mapContext.mapWidth) / Const.DOUBLE_OR_HALF;
    this.leftTop = [(this.mapContext.screenMapWidth - this.mapContext.mapWidth), 0];
  }

  /**
   * When the map is pinched.
   *
   * @param event Kneading gesture event.
   */
  pinchUpdate(event: GestureEvent): void {
    let scale = parseFloat(event.scale.toFixed(Const.MAP_SCALE_ACCURACY));
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
      this.mapContext.mapWidth *= ratio;
      this.mapContext.mapHeight *= ratio;
      let offsetX = (1 - ratio) * (this.mapContext.screenMapWidth /
        Const.DOUBLE_OR_HALF - this.mapContext.mapX);
      let offsetY = (1 - ratio) * (this.mapContext.mapHeight /
        Const.MAP_ZOOM_RATIO / Const.DOUBLE_OR_HALF - this.mapContext.mapY);
      this.mapContext.mapX += offsetX;
      this.mapContext.mapY += offsetY;
      this.calLandmarksPosition();
      this.zoomOutCheck();
    }
    this.previousScale = scale;
  }

  /**
   * Check whether the map is zoomed to the screen boundary during zooming.
   */
  zoomOutCheck(): void {
    // Top left corner.
    if (this.mapContext.mapX > 0) {
      this.mapContext.mapX = 0;
    }
    if (this.mapContext.mapY > 0) {
      this.mapContext.mapY = 0;
    }
    // Lower right corner.
    if ((this.mapContext.mapX + this.mapContext.mapWidth) < this.mapContext.screenMapWidth) {
      this.mapContext.mapX = this.mapContext.screenMapWidth - this.mapContext.mapWidth;
    }
    if ((this.mapContext.mapY + this.mapContext.mapHeight) < (this.mapContext.mapHeight / this.mapMultiples())) {
      this.mapContext.mapY = this.mapContext.mapHeight / this.mapMultiples() - this.mapContext.mapHeight;
    }
  }

  /**
   * End of map kneading gesture.
   */
  pinchEnd(): void {
    let minX = this.mapContext.screenMapWidth - this.mapContext.mapWidth;
    let minY = (1 / this.mapMultiples() - 1) * this.mapContext.mapHeight;
    this.leftTop = [minX, minY];
  }

  /**
   * Double-click the map.
   */
  tapAction(): void {
    if (++this.pinchCount > Const.ZOOM_MAX_TIMES) {
      this.pinchCount = Const.ZOOM_MAX_TIMES;
      return;
    }
    this.mapContext.mapWidth *= Const.MAP_ZOOM_RATIO;
    this.mapContext.mapHeight *= Const.MAP_ZOOM_RATIO;
    let offsetX = (1 - Const.MAP_ZOOM_RATIO) *
      (this.mapContext.screenMapWidth / Const.DOUBLE_OR_HALF - this.mapContext.mapX);
    let offsetY = (1 - Const.MAP_ZOOM_RATIO) * (this.mapContext.mapHeight /
      Const.MAP_ZOOM_RATIO / Const.DOUBLE_OR_HALF - this.mapContext.mapY);
    this.mapContext.mapX += offsetX;
    this.mapContext.mapY += offsetY;
    this.calLandmarksPosition();
    // Calculate the farthest coordinate of the upper left corner.
    let minX = (this.mapContext.screenMapWidth - this.mapContext.mapWidth);
    let minY = this.mapContext.mapHeight / this.mapMultiples() - this.mapContext.mapHeight;
    this.leftTop = [minX, minY];
  }

  /**
   * Panning gestures.
   *
   * @param event Events when panning.
   */
  panUpdate(event: GestureEvent): void {
    let panX = parseInt(event.offsetX.toFixed(0));
    let panY = parseInt(event.offsetY.toFixed(0));
    if ((this.panX !== panX) || (this.panY !== panY)) {
      this.panCheck(panX, panY);
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
   * Calculate Coordinates During Drag.
   *
   * @param panX Map Move Horizontal Distance.
   * @param panY Map Move Longitudinal Distance.
   */
  panCheck(panX, panY): void {
    let mapPanX = panX - this.panX;
    let mapPanY = panY - this.panY;
    this.mapContext.mapX += mapPanX;
    this.mapContext.mapY += mapPanY;
    if (this.mapContext.mapX < this.leftTop[0]) {
      this.mapContext.mapX = this.leftTop[0];
    }
    if (this.mapContext.mapX > 0) {
      this.mapContext.mapX = 0;
    }
    if (this.mapContext.mapY < this.leftTop[1]) {
      this.mapContext.mapY = this.leftTop[1];
    }
    if (this.mapContext.mapY > 0) {
      this.mapContext.mapY = 0;
    }
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
   * Calculating Landmark Locations.
   */
  calLandmarksPosition(): void {
    this.mapContext.data.locations = this.mapContext.data.locations.map((item: Location) => {
      item.positionX = item.oriPositionX * this.mapMultiples() -
        Const.MAP_LANDMARKS_SIZE * Const.MAP_ZOOM_RATIO / Const.DOUBLE_OR_HALF;
      item.positionY = item.oriPositionY * this.mapMultiples() -
        Const.MAP_LANDMARKS_SIZE * Const.MAP_ZOOM_RATIO;
      return item;
    })
  }

  /**
   * When selecting a landmark, place the first coordinate in the middle of the screen horizontally.
   */
  setFirstLandmarksCenter(): void {
    let locations = this.mapContext.data.locations;
    if (locations.length > 0) {
      // Horizontally centered.
      this.mapContext.mapX = this.mapContext.screenMapWidth / Const.DOUBLE_OR_HALF - locations[0].positionX;
      if (this.mapContext.mapX > 0) {
        this.mapContext.mapX = 0;
      }
      if (this.mapContext.mapX < (this.mapContext.screenMapWidth - this.mapContext.mapWidth)) {
        this.mapContext.mapX = this.mapContext.screenMapWidth - this.mapContext.mapWidth;
      }
      // Vertically centered.
      this.mapContext.mapY = this.mapContext.screenMapHeight / Const.DOUBLE_OR_HALF - locations[0].positionY;
      if (this.mapContext.mapY > 0) {
        this.mapContext.mapY = 0;
      }
      if (this.mapContext.mapY < (this.mapContext.screenMapHeight - this.mapContext.mapHeight)) {
        this.mapContext.mapY = this.mapContext.screenMapHeight - this.mapContext.mapHeight;
      }
    }
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
      Logger.error(TAG, `getResourceString failed, error code: ${error.code}, message: ${error.message}.`);
    }
    return resourceString;
  }
}

let mapController = new MapController();

export default mapController as MapController;