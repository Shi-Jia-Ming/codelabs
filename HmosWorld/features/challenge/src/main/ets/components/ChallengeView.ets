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

import router from '@ohos.router';
import common from '@ohos.app.ability.common';
import resourceManager from '@ohos.resourceManager';
import AnimIcon from './AnimIcon';
import StrokeText from './StrokeText';
import { Logger } from '@ohos/common';
import { MapElement, mapElementData } from '../model/MapData';
import { ChallengeConstants as Const } from '../constants/ChallengeConstants';

const TAG = 'ChallengeView';

@Component
export struct ChallengeView {
  private panOption: PanGestureOptions = new PanGestureOptions({ direction: PanDirection.All });
  // Map container width and height
  @State mapContainerWidth: number = 0;
  @State mapContainerHeight: number = 0;
  // Actual width and height of the loaded map image
  @State mapWidth: number = 0;
  @State mapHeight: number = 0;
  // Map coordinates, relative to the upper left corner
  @State mapX: number = 0;
  @State mapY: number = 0;
  @State mapElements: MapElement[] = [];
  private panX: number = 0;
  private panY: number = 0;
  private leftTop: Array<number> = [];
  // Load ratio of real images to actual images.
  private ratio: number = 0;

  /**
   * init map size
   */
  initMap(): void {
    // Set the map height to the screen height by default.
    this.mapHeight = this.mapContainerHeight;
    // Calculate the image width based on the image length/width ratio.
    this.mapWidth = Const.MAP_REAL_WIDTH / Const.MAP_REAL_HEIGHT * this.mapHeight;
    this.ratio = vp2px(this.mapContainerHeight) / Const.MAP_REAL_HEIGHT;
    // The middle of the map is displayed on the screen by default.
    this.mapX = (this.mapContainerWidth - this.mapWidth) / 2;
    // Maximum map sliding distance.
    this.leftTop = [(this.mapContainerWidth - this.mapWidth), 0];
    this.initMapElements();
  }

  /**
   * Initializing Map Element Data,Calculate the coordinates
   */
  initMapElements(): void {
    this.mapElements = [];
    for (let index = 0; index < mapElementData.length; index++) {
      const element: MapElement = mapElementData[index];
      let temp: MapElement = JSON.parse(JSON.stringify(element));
      temp.iconPositionX = px2vp(element.iconPositionX) * this.ratio;
      temp.iconPositionY = px2vp(element.iconPositionY) * this.ratio;
      this.mapElements.push(temp);
    }
  }

  /**
   * Panning gestures.
   *
   * @param event Events when panning.
   */
  panUpdate(event: GestureEvent): void {
    let panX = Math.round(event.offsetX);
    let panY = Math.round(event.offsetY);
    if (this.panX !== panX || this.panY !== panY) {
      this.panCheck(panX, panY);
    }
    this.panX = panX;
    this.panY = panY;
  }

  /**
   * Calculate Coordinates During Drag
   *
   * @param panX Map Move Horizontal Distance.
   * @param panY Map Move Longitudinal Distance.
   */
  panCheck(panX: number, panY: number): void {
    let mapPanX = panX - this.panX;
    let mapPanY = panY - this.panY;
    this.mapX += mapPanX;
    this.mapY += mapPanY;
    if (this.mapX < this.leftTop[0]) {
      this.mapX = this.leftTop[0];
    }
    if (this.mapX > 0) {
      this.mapX = 0;
    }
    if (this.mapY < this.leftTop[1]) {
      this.mapY = this.leftTop[1];
    }
    if (this.mapY > 0) {
      this.mapY = 0;
    }
  }

  build() {
    Column() {
      Stack({ alignContent: Alignment.TopStart }) {
        MapIcons({ mapElements: this.mapElements })
      }
      .backgroundImage($r('app.media.ic_nav_map'))
      .backgroundImageSize(ImageSize.Cover)
      .width(this.mapWidth)
      .height(this.mapHeight)
      .position({ x: this.mapX, y: this.mapY })
      .gesture(
        PanGesture(this.panOption)
          .onActionUpdate((event?: GestureEvent) => {
            if (event) {
              this.panUpdate(event);
            }
          })
          .onActionEnd(() => {
            this.panX = 0;
            this.panY = 0;
          })
      )
    }
    .height(Const.FULL_PERCENT)
    .width(Const.FULL_PERCENT)
    .onAreaChange((oldVal: Area, newVal: Area) => {
      if (this.mapContainerWidth === 0 || this.mapContainerHeight === 0) {
        this.mapContainerWidth = Number(newVal.width);
        this.mapContainerHeight = Number(newVal.height);
        Logger.info(TAG, 'mapContainerWidth: ' + this.mapContainerWidth);
        Logger.info(TAG, 'mapContainerHeight: ' + this.mapContainerHeight);
        this.initMap();
      }
    })
  }
}

@Component
struct MapIcons {
  @Prop mapElements: MapElement[] = [];

  build() {
    Stack() {
      ForEach(this.mapElements,
        (item: MapElement) => {
          IconItem({ item: item })
        },
        (item: MapElement) => JSON.stringify(item)
      )
    }
  }
}

@Component
struct IconItem {
  private item: MapElement = new MapElement();
  @State textStr: string = '';

  aboutToAppear() {
    let resource: resourceManager.Resource = {
      bundleName: this.item.zone.bundleName,
      moduleName: this.item.zone.moduleName,
      id: this.item.zone.id
    };
    getContext(this).resourceManager.getStringValue(resource).then(value => {
      this.textStr = value;
    })
  }

  build() {
    Column() {
      AnimIcon({ item: this.item })
      if (this.textStr != '') {
        StrokeText({ textStr: this.textStr, textColor: this.item.textColor })
      }
    }
    .onClick(() => {
      let bundleName = (getContext(this) as common.UIAbilityContext).applicationInfo.name;
      router.pushUrl({
        url: `@bundle:${bundleName}/challenge/ets/pages/IntroductionPage`,
        params: { id: this.item.id }
      });
    })
    .position({
      x: this.item.iconPositionX,
      y: this.item.iconPositionY
    })
  }
}


