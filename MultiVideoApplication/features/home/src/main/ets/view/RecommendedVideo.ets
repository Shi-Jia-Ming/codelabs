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

import { BreakpointConstants, CommonConstants } from '@ohos/commons';
import { BreakpointType, DeviceScreen, Logger, WindowUtil } from '@ohos/commons';
import { HomeConstants } from '../constants/HomeConstants';
import { VideoImage, VideoImgViewModel } from '../viewmodel/VideoImgViewModel';
import { VideoContent, VideoImgRating, VideoTitle } from './CommonView';
import { VideoDialog } from './VideoDialog';

@Component
export struct RecommendedVideo {
  @StorageLink('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  @StorageLink('videoGridColumn') videoGridColumn: string = CommonConstants.VIDEO_GRID_COLUMNS[0];
  @Prop windowWidth: number = 0;
  @Prop currentTopIndex: number = 0;
  private videoImgList: VideoImage[] = new VideoImgViewModel().getVideoImgList();
  private videoDialogController?: CustomDialogController;
  private windowUtil?: WindowUtil;
  private screenWidth: number = DeviceScreen.getDeviceWidth();

  build() {
    Column() {
      // Video grid layout.
      Grid() {
        ForEach(this.videoImgList, (item: VideoImage, index: number) => {
          GridItem() {
            Column() {
              Stack({ alignContent: Alignment.Bottom}) {
                Image(item.getImgSrc())
                  .objectFit(ImageFit.Fill)
                  .width(CommonConstants.FULL_PERCENT)
                  .height(CommonConstants.FULL_PERCENT)
                  .draggable(false)
                  .id(JSON.stringify(item))
                VideoImgRating({ rating: item.getRating() })
              }
              .width(CommonConstants.FULL_PERCENT)
              // The width and height vary with the container assembly and the aspect ratio remains unchanged.
              .aspectRatio(HomeConstants.VIDEO_DIALOG_ASPECT_RATIO)
              .gesture(
                LongPressGesture({ repeat: false })
                  .onAction(() => {
                    if (index !== 0) {
                      Logger.info(`Please long press the first image`);
                      return;
                    }
                    // Obtains all attributes of a component.
                    let obj: Record<string, string> = JSON.parse(getInspectorByKey(JSON.stringify(item)));
                    let rectInfo: string[] = JSON.parse(HomeConstants.SQUARE_BRACKETS[0] + obj.$rect +
                      HomeConstants.SQUARE_BRACKETS[1]);
                    // Obtains the height of the component from the top.
                    let rectTop: number = px2vp(JSON.parse(HomeConstants.SQUARE_BRACKETS[0] + rectInfo[0] +
                      HomeConstants.SQUARE_BRACKETS[1])[1]);
                    let rectTop2: number = px2vp(JSON.parse(HomeConstants.SQUARE_BRACKETS[0] + rectInfo[1] +
                      HomeConstants.SQUARE_BRACKETS[1])[1]);
                    // Obtains the width of the component from the left.
                    let rectLeft: number = px2vp(JSON.parse(HomeConstants.SQUARE_BRACKETS[0] + rectInfo[0] +
                      HomeConstants.SQUARE_BRACKETS[1])[0]);
                    let topHeightNeeded: number = new BreakpointType(HomeConstants.VIDEO_DIALOG_HEIGHTS[0],
                      HomeConstants.VIDEO_DIALOG_HEIGHTS[1], HomeConstants.VIDEO_DIALOG_HEIGHTS[2])
                      .GetValue(this.currentBreakpoint) + rectTop - rectTop2;
                    if (this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM) {
                      topHeightNeeded += HomeConstants.HOME_HEADER_HEIGHT_SM;
                    } else {
                      Logger.info(`No extra height needed`);
                    }
                    let dialogYOffset: number;
                    // Adaptive pop-up window expansion direction.
                    if (topHeightNeeded < rectTop) {
                      dialogYOffset = rectTop2 - new BreakpointType(HomeConstants.VIDEO_DIALOG_HEIGHTS[0],
                        HomeConstants.VIDEO_DIALOG_HEIGHTS[1], HomeConstants.VIDEO_DIALOG_HEIGHTS[2])
                        .GetValue(this.currentBreakpoint);
                    } else {
                      dialogYOffset = rectTop;
                    }
                    this.windowUtil = WindowUtil.getInstance();
                    let isLayoutFullScreen: boolean = true;
                    if (this.windowUtil === undefined) {
                      Logger.error(`WindowUtil is undefined`);
                      return;
                    }
                    let mainWindow = this.windowUtil.getMainWindow();
                    if (mainWindow === undefined) {
                      Logger.error(`MainWindow is undefined`);
                      return;
                    }
                    isLayoutFullScreen = mainWindow.getWindowProperties().isLayoutFullScreen;
                    // Subtract the width and height of the window in the 2in1 device.
                    if (this.screenWidth >= BreakpointConstants.LARGE_DEVICE_WIDTH && isLayoutFullScreen !== true) {
                      dialogYOffset -= HomeConstants.WINDOW_UNDEFINED_TOP;
                      rectLeft -= HomeConstants.WINDOW_UNDEFINED_LEFT;
                    } else {
                      Logger.info(`No need to subtract extra height`);
                    }
                    this.videoDialogController = new CustomDialogController({
                      builder: VideoDialog(),
                      autoCancel: true,
                      customStyle: true,
                      alignment: DialogAlignment.TopStart,
                      offset: {
                        dx: rectLeft,
                        dy: dialogYOffset
                      }
                    });
                    // Display the customized pop-up window to play the video.
                    this.videoDialogController.open();
                  }))

              VideoTitle({ currentTopIndex: this.currentTopIndex, title: item.getTitle() })
              VideoContent({ currentTopIndex: this.currentTopIndex, content: item.getContent() })
            }
            .alignItems(HorizontalAlign.Start)
          }
        }, (item: VideoImage, index: number) => index + JSON.stringify(item))
      }
      .editMode(false)
      // Sets the number of grid layout columns and evenly divides the width.
      .columnsTemplate(this.videoGridColumn)
      .rowsTemplate(CommonConstants.VIDEO_GRID_COLUMNS[0])
      .width(CommonConstants.FULL_PERCENT)
      .rowsGap($r('app.float.video_grid_gap'))
      .columnsGap($r('app.float.video_grid_gap'))
      // Dynamically calculates the total height based on the following numbers of breakpoints.
      .height(this.getGridHeight(this.videoGridColumn, this.currentBreakpoint, this.windowWidth))
    }
    .padding({ left: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG && this.currentTopIndex === 2 ?
      $r('app.float.side_bar_width') : 0 })
    // Zooming and pinching functions of the grid.
    .gesture(PinchGesture({ fingers: 2 }).onActionUpdate((event: GestureEvent) => {
      if (event.scale > 1 && this.currentBreakpoint !== BreakpointConstants.BREAKPOINT_SM) {
        if (this.currentBreakpoint === BreakpointConstants.BREAKPOINT_MD) {
          this.videoGridColumn = CommonConstants.VIDEO_GRID_COLUMNS[1];
        } else {
          this.videoGridColumn = CommonConstants.VIDEO_GRID_COLUMNS[2];
        }
      } else if (event.scale < 1 && this.currentBreakpoint !== BreakpointConstants.BREAKPOINT_SM) {
        if (this.currentBreakpoint === BreakpointConstants.BREAKPOINT_MD) {
          this.videoGridColumn = CommonConstants.VIDEO_GRID_COLUMNS[2];
        } else {
          this.videoGridColumn = CommonConstants.VIDEO_GRID_COLUMNS[3];
        }
      } else {
        Logger.info(`Two-finger operation is not supported`);
      }
    }))
  }

  getGridHeight(videoGridColumn: string, currentBreakpoint: string, windowWidth: number): string {
    // Obtain the window width and subtract the blank parts on both sides.
    let result: number = px2vp(windowWidth) - HomeConstants.VIDEO_GRID_MARGIN;
    if (currentBreakpoint === BreakpointConstants.BREAKPOINT_LG) {
      result = result - HomeConstants.LG_SIDEBAR_WIDTH;
    } else {
      Logger.info(`No need to subtract sidebar width`);
    }
    // Calculate the width of a single image based on the number of grid columns.
    if (videoGridColumn === CommonConstants.VIDEO_GRID_COLUMNS[0]) {
      result = (result - HomeConstants.VIDEO_GRID_ITEM_SPACE * 1) / HomeConstants.TWO;
    } else if (videoGridColumn === CommonConstants.VIDEO_GRID_COLUMNS[1]) {
      result = (result - HomeConstants.VIDEO_GRID_ITEM_SPACE * 2) / CommonConstants.THREE;
    } else if (videoGridColumn === CommonConstants.VIDEO_GRID_COLUMNS[2]) {
      result = (result - HomeConstants.VIDEO_GRID_ITEM_SPACE * 3) / CommonConstants.FOUR;
    } else {
      result = (result - HomeConstants.VIDEO_GRID_ITEM_SPACE * 4) / HomeConstants.FIVE;
    }
    // Calculate the height of a single image, title, and content, and calculate the total height of the grid layout.
    return result / HomeConstants.VIDEO_DIALOG_ASPECT_RATIO * HomeConstants.TWO +
      HomeConstants.VIDEO_GRID_DESCRIPTION_HEIGHT + HomeConstants.HEIGHT_UNIT;
  }
}