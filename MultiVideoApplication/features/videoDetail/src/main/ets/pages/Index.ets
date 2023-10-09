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

import { AvPlayerUtil, DeviceScreen, Logger } from '@ohos/commons';
import { BreakpointConstants, CommonConstants } from '@ohos/commons';
import router from '@ohos.router';
import { SelfComment } from '../view/SelfComment';
import { AllComments } from '../view/AllComments';
import { VideoDetail } from '../view/VideoDetail';
import { DetailConstants } from '../constants/DetailConstants';

@Entry
@Component
export struct Index {
  @StorageLink('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  @State commentImgHeight: string = DetailConstants.INITIAL_COMMENT_IMAGE_HEIGHT;
  @State commentImgWidth: string = DetailConstants.INITIAL_COMMENT_IMAGE_WIDTH;
  @State relatedVideoHeight: number = DetailConstants.INITIAL_RELATED_VIDEO_HEIGHT;
  @State videoHeight: number = DetailConstants.INITIAL_VIDEO_HEIGHT;
  private avPlayerUtil: AvPlayerUtil= new AvPlayerUtil();
  private screenHeight: number = 0;

  aboutToAppear() {
    this.screenHeight = DeviceScreen.getDeviceHeight();
  }

  aboutToDisappear() {
    this.avPlayerUtil.release();
  }

  onPageShow() {
    this.avPlayerUtil.onTimeUpdate();
    this.avPlayerUtil.setStartTime((router.getParams() as Record<string, number>).currentTime);
    this.avPlayerUtil.play();
  }

  onPageHide() {
    this.avPlayerUtil.pause();
    this.avPlayerUtil.offTimeUpdate();
  }

  build() {
    GridRow({
      columns: {
        sm: BreakpointConstants.GRID_ROW_COLUMNS[2],
        md: BreakpointConstants.GRID_ROW_COLUMNS[0],
        lg: BreakpointConstants.GRID_ROW_COLUMNS[0]
      }
    }) {
      GridCol({
        span: {
          sm: BreakpointConstants.GRID_COLUMN_SPANS[5],
          md: BreakpointConstants.GRID_COLUMN_SPANS[0],
          lg: BreakpointConstants.GRID_COLUMN_SPANS[0]
        }
      }) {
        SideBarContainer() {
          Column() {
            Scroll() {
              AllComments({ commentImgHeight: $commentImgHeight, commentImgWidth: $commentImgWidth })
                .visibility(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ? Visibility.Visible :
                  Visibility.None)
            }
            .align(Alignment.Top)
            .scrollBar(BarState.Off)
            .layoutWeight(1)
            .width(CommonConstants.FULL_PERCENT)
            .padding({ bottom: $r('app.float.side_scroll_padding') })

            SelfComment()
              .visibility(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ? Visibility.Visible :
                Visibility.None)
          }
          .justifyContent(FlexAlign.Start)
          .height(CommonConstants.FULL_PERCENT)
          .width(CommonConstants.FULL_PERCENT)
          .backgroundColor(Color.White)
          .onAreaChange((newValue: Area) => {
            let height: number = DetailConstants.COMMENT_IMAGE_MIN_HEIGHT_NUMBER + (Number(newValue.width) -
              DetailConstants.SIDE_BAR_MIN_WIDTH_NUMBER) / (DetailConstants.SIDE_BAR_MAX_WIDTH_NUMBER -
              DetailConstants.SIDE_BAR_MIN_WIDTH_NUMBER) * (DetailConstants.COMMENT_IMAGE_MAX_HEIGHT_NUMBER -
              DetailConstants.COMMENT_IMAGE_MIN_HEIGHT_NUMBER);
            let width: number = DetailConstants.COMMENT_IMAGE_MIN_WIDTH_NUMBER + (Number(newValue.width) -
              DetailConstants.SIDE_BAR_MIN_WIDTH_NUMBER) / (DetailConstants.SIDE_BAR_MAX_WIDTH_NUMBER -
              DetailConstants.SIDE_BAR_MIN_WIDTH_NUMBER) * (DetailConstants.COMMENT_IMAGE_MAX_WIDTH_NUMBER -
              DetailConstants.COMMENT_IMAGE_MIN_WIDTH_NUMBER);
            this.commentImgHeight = JSON.stringify(height);
            this.commentImgWidth = JSON.stringify(width);
          })

          Column() {
            VideoDetail({ screenHeight: this.screenHeight, avPlayerUtil: this.avPlayerUtil, relatedVideoHeight:
              $relatedVideoHeight, videoHeight: $videoHeight })
            SelfComment()
              .visibility(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ? Visibility.None :
                Visibility.Visible)
          }
          .height(CommonConstants.FULL_PERCENT)
          .width(CommonConstants.FULL_PERCENT)
        }
        .showSideBar(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ? true : false)
        .showControlButton(false)
        .autoHide(false)
        .sideBarPosition(SideBarPosition.End)
        .minSideBarWidth($r('app.float.side_bar_min_width'))
        .maxSideBarWidth($r('app.float.side_bar_max_width'))
        .sideBarWidth($r('app.float.side_bar_min_width'))
      }
      .height(CommonConstants.FULL_PERCENT)
    }
    .width(CommonConstants.FULL_PERCENT)
    .height(CommonConstants.FULL_PERCENT)
    .onBreakpointChange((breakPoints) => {
      this.currentBreakpoint = breakPoints;
      if (breakPoints !== BreakpointConstants.BREAKPOINT_LG && this.videoHeight < DetailConstants.INITIAL_VIDEO_HEIGHT)
      {
        this.relatedVideoHeight = 0;
      } else if (breakPoints === BreakpointConstants.BREAKPOINT_LG) {
        this.relatedVideoHeight = DetailConstants.INITIAL_RELATED_VIDEO_HEIGHT;
      } else {
        Logger.info(`No specific function`);
      }
    })
  }
}