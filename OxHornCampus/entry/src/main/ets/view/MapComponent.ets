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

import { AddressItem, Location } from '../common/bean/AddressItem';
import { PositionItem } from '../common/bean/PositionItem';
import { CommonConstants as Const } from '../common/constants/CommonConstants';
import MapController from '../controller/MapController';
import MapModel from '../viewmodel/MapModel';
import { PositionList } from '../viewmodel/MapModel';

@Component
export struct Map {
  private panOption: PanGestureOptions = new PanGestureOptions({ direction: PanDirection.All });
  @State screenMapWidth: number = 0;
  @State screenMapHeight: number = 0;
  @State mapWidth: number = 0;
  @State mapHeight: number = 0;
  @State mapX: number = 0;
  @State mapY: number = 0;
  @Provide data: AddressItem = new AddressItem(undefined, undefined, [], undefined);

  build() {
    Stack({ alignContent: Alignment.BottomEnd }) {
      Column() {
        Stack({ alignContent: Alignment.TopStart }) {
          ForEach(this.data.locations, (item: Location) => {
            Image(this.data.icon)
              .width(Const.MAP_LANDMARKS_SIZE)
              .height(Const.MAP_LANDMARKS_SIZE)
              .offset({
                x: item.positionX,
                y: item.positionY
              })
            Text(this.data.name)
              .fontSize($r('app.float.map_text_size'))
              .fontColor(this.data.textColor)
              .fontWeight(FontWeight.Bold)
              .offset({
                x: item.positionX + Const.MAP_TEXT_OFFSET_X,
                y: item.positionY + Const.MAP_TEXT_OFFSET_Y
              })
          }, item => JSON.stringify(item))
        }
        .backgroundImage($r('app.media.ic_nav_map'))
        .backgroundImageSize(ImageSize.Cover)
        .width(this.mapWidth)
        .height(this.mapHeight)
        .offset({ x: this.mapX, y: this.mapY })
      }
      .height(Const.FULL_PERCENT)
      .width(Const.FULL_PERCENT)
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Start)
      .onAreaChange((oldVal: Area, newVal: Area) => {
        if (this.screenMapWidth === 0 || this.screenMapHeight === 0) {
          this.screenMapWidth = Number(newVal.width);
          this.screenMapHeight = Number(newVal.height);
          MapController.initMap(this);
        }
      })
      .gesture(
        GestureGroup(GestureMode.Exclusive,
          PinchGesture({ fingers: Const.MAP_FINGER_COUNT })
            .onActionUpdate((event: GestureEvent) => {
              MapController.pinchUpdate(event);
            })
            .onActionEnd(() => {
              MapController.pinchEnd();
            }),
          TapGesture({ count: Const.MAP_FINGER_COUNT })
            .onAction(() => {
              MapController.tapAction();
            }),
          PanGesture(this.panOption)
            .onActionUpdate((event: GestureEvent) => {
              MapController.panUpdate(event);
            })
            .onActionEnd(() => {
              MapController.panEnd();
            })
        )
      )

      CustomPanel({ mapWidth: this.mapWidth, mapHeight: this.mapHeight })
    }
  }
}

@Component
struct PositionGridView {
  positionItem: PositionItem;

  build() {
    Column() {
      Image(this.positionItem.icon)
        .width($r('app.float.navigation_panel_icon_size'))
        .height($r('app.float.navigation_panel_icon_size'))
        .margin($r('app.float.navigation_panel_icon_margin'))
      Text(this.positionItem.text)
        .fontSize($r('app.float.navigation_icon_text'))
    }
  }
}

@Component
struct CustomPanel {
  @State positionList: Array<PositionItem> = PositionList;
  @State panelOpacity: number = Const.PANEL_HIGH_OPACITY;
  @State panelHeight: number = Const.PANEL_FULL_HEIGHT;
  @State flag: boolean = true;
  @State isDownImage: boolean = true;
  @State imageEnable: boolean = true;
  @State iconOpacity: number = Const.PANEL_HIGH_OPACITY;
  @Consume data: AddressItem;
  @Prop mapWidth: number;
  @Prop mapHeight: number;

  build() {
    Column() {
      Column() {
        Image(this.isDownImage ? $r('app.media.ic_panel_down') : $r('app.media.ic_panel_up'))
          .enabled(this.imageEnable)
          .height($r('app.float.navigation_icon_down'))
          .onClick(() => {
            this.upAndDown();
          })
      }
      .opacity(this.iconOpacity)
      .backgroundColor($r('app.color.custom_panel_background'))
      .borderRadius({
        topLeft: $r('app.float.navigation_panel_radius'),
        topRight: $r('app.float.navigation_panel_radius')
      })
      .width(Const.FULL_PERCENT)

      Column() {
        Search({ placeholder: Const.PANEL_PLACEHOLDER })
          .width(Const.SEARCHBAR_WIDTH)
          .height($r('app.float.navigation_search_height'))
          .onSubmit((value: string) => {
            this.positionList.forEach((item: PositionItem) => {
              if (MapController.getResourceString(item.text) === value) {
                this.data = MapModel.calCoordinateByLonAndLat(item.lngLat, item.type, this);
                MapController.calLandmarksPosition();
                MapController.setFirstLandmarksCenter();
                this.upAndDown();
              }
            }, item => JSON.stringify(item));
          })
        Grid() {
          ForEach(this.positionList, (item: PositionItem) => {
            GridItem() {
              PositionGridView({ positionItem: item })
                .enabled(this.imageEnable)
                .onClick(() => {
                  this.data = MapModel.calCoordinateByLonAndLat(item.lngLat, item.type, this);
                  MapController.calLandmarksPosition();
                  MapController.setFirstLandmarksCenter();
                  this.upAndDown();
                })
            }
          }, item => JSON.stringify(item))
        }
        .columnsTemplate(Const.GRID_COLUMNS)
        .columnsGap($r('app.float.navigation_column_gap'))
        .rowsGap($r('app.float.navigation_row_gap'))
        .padding($r('app.float.navigation_grid_padding'))
      }
      .opacity(this.panelOpacity)
      .height(this.panelHeight)
      .animation({
        duration: Const.ANIMATION_DURATION,
        curve: Curve.EaseOut,
        iterations: 1,
        playMode: PlayMode.Normal
      })
      .backgroundColor($r('app.color.custom_panel_background'))
    }
    .width(Const.FULL_PERCENT)
    .borderRadius($r('app.float.navigation_panel_radius'))
  }

  upAndDown() {
    // Prevents repeated clicks during fade-down.
    this.imageEnable = false;
    if (this.isDownImage) {
      this.panelOpacity = 0;
      this.panelHeight = 0;
      this.iconOpacity = Const.PANEL_LOW_OPACITY;
    } else {
      this.panelHeight = Const.PANEL_FULL_HEIGHT;
      this.panelOpacity = Const.PANEL_HIGH_OPACITY;
      this.iconOpacity = Const.PANEL_HIGH_OPACITY;
    }
    this.isDownImage = !this.isDownImage;
    this.imageEnable = true;
  }
}