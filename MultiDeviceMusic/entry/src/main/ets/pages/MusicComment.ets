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

import { BreakpointConstants } from '../common/constants/BreakpointConstants'
import { StyleConstants } from '../common/constants/StyleConstants'
import { Comment } from '../viewmodel/Comment';
import CommentViewModel from '../viewmodel/CommentViewModel';
import { ListItemComponent } from '../view/ListItemComponent';
import { HeadComponent } from '../view/HeadComponent';
import { MusicInfoComponent } from '../view/MusicInfoComponent';
import { CommonConstants } from '../common/constants/CommonConstants';

@Entry
@Component
struct MusicComment {
  @State currentBp: string = BreakpointConstants.CURRENT_BREAKPOINT;
  @State wonderfulComment: Comment[] = CommentViewModel.getWonderfulReview();
  @State newComment: Comment[] = CommentViewModel.getNewComment();

  @Builder
  ShowTitle(title: ResourceStr) {
    Row() {
      Text(title)
        .fontSize($r('app.float.comment_title_size'))
        .fontColor($r('app.color.comment_title_color'))
        .lineHeight($r('app.float.title_line_height'))
        .fontWeight(FontWeight.Medium)
        .margin({
          top: $r('app.float.title_margin_top'),
          bottom: $r('app.float.title_margin_bottom'),
          left: this.currentBp === BreakpointConstants.BREAKPOINT_SM ?
          $r('app.float.margin_left_sm') : $r('app.float.margin_left'),
          right: this.currentBp === BreakpointConstants.BREAKPOINT_SM ?
          $r('app.float.margin_right_sm') : $r('app.float.margin_right')
        })
    }
    .justifyContent(FlexAlign.Start)
    .width(StyleConstants.FULL_WIDTH)
  }

  build() {
    GridRow({
      breakpoints: {
        value: BreakpointConstants.BREAKPOINT_VALUE,
        reference: BreakpointsReference.WindowSize
      },
      columns: {
        sm: BreakpointConstants.COLUMN_SM,
        md: BreakpointConstants.COLUMN_MD,
        lg: BreakpointConstants.COLUMN_LG
      },
      gutter: { x: BreakpointConstants.GUTTER_X }
    }) {
      GridCol({
        span: {
          sm: BreakpointConstants.COLUMN_SM,
          md: BreakpointConstants.COLUMN_MD,
          lg: BreakpointConstants.COLUMN_LG
        }
      }) {
        Column() {
          HeadComponent()
            .margin({
              left: this.currentBp === BreakpointConstants.BREAKPOINT_SM ?
              $r('app.float.margin_left_sm') : $r('app.float.margin_left'),
              right: this.currentBp === BreakpointConstants.BREAKPOINT_SM ?
              $r('app.float.margin_right_sm') : $r('app.float.margin_right')
            })

          MusicInfoComponent()
            .margin({
              left: this.currentBp === BreakpointConstants.BREAKPOINT_SM ?
              $r('app.float.margin_left_sm') : $r('app.float.margin_left'),
              right: this.currentBp === BreakpointConstants.BREAKPOINT_SM ?
              $r('app.float.margin_right_sm') : $r('app.float.margin_right')
            })

          this.ShowTitle($r('app.string.wonderful_comment'))

          List() {
            ForEach(this.wonderfulComment, (comment: Comment, index?: number) => {
              if (this.currentBp === BreakpointConstants.BREAKPOINT_SM ||
                this.currentBp === BreakpointConstants.BREAKPOINT_MD) {
                if (index && index < CommonConstants.LIST_COUNT) {
                  ListItem() {
                    ListItemComponent({ item: comment })
                      .margin({
                        left: this.currentBp === BreakpointConstants.BREAKPOINT_SM ?
                          0 : $r('app.float.margin_left_list'),
                        right: this.currentBp === BreakpointConstants.BREAKPOINT_SM ?
                          0 : $r('app.float.margin_right_list')
                      })
                  }
                  .width(StyleConstants.FULL_WIDTH)
                  .padding({
                    bottom: $r('app.float.padding_bottom')
                  })
                }
              } else {
                ListItem() {
                  ListItemComponent({ item: comment })
                    .margin({
                      left: this.currentBp === BreakpointConstants.BREAKPOINT_SM ?
                        0 : $r('app.float.margin_left_list'),
                      right: this.currentBp === BreakpointConstants.BREAKPOINT_SM ?
                        0 : $r('app.float.margin_right_list')
                    })
                }
                .width(StyleConstants.FULL_WIDTH)
                .padding({
                  bottom: $r('app.float.padding_bottom')
                })
              }
            }, (item: Comment, index?: number) => index + JSON.stringify(item))
          }
          .lanes(this.currentBp === BreakpointConstants.BREAKPOINT_LG ? 2 : 1)
          .scrollBar(BarState.Off)
          .divider({
            color: $r('app.color.list_divider'),
            strokeWidth: $r('app.float.stroke_width'),
            startMargin: this.currentBp === BreakpointConstants.BREAKPOINT_SM ?
            $r('app.float.start_margin') : $r('app.float.start_margin_lg'),
            endMargin: this.currentBp === BreakpointConstants.BREAKPOINT_SM ?
              0 : $r('app.float.divider_margin_left')
          })
          .margin({
            left: this.currentBp === BreakpointConstants.BREAKPOINT_SM ?
            $r('app.float.margin_left_sm') : $r('app.float.margin_left_list'),
            right: this.currentBp === BreakpointConstants.BREAKPOINT_SM ?
            $r('app.float.margin_right_sm') : $r('app.float.margin_right_list')
          })

          this.ShowTitle($r('app.string.new_comment'))

          List() {
            ForEach(this.newComment, (comment: Comment) => {
              ListItem() {
                ListItemComponent({ item: comment })
                  .margin({
                    left: this.currentBp === BreakpointConstants.BREAKPOINT_SM ?
                      0 : $r('app.float.margin_left_list'),
                    right: this.currentBp === BreakpointConstants.BREAKPOINT_SM ?
                      0 : $r('app.float.margin_right_list')
                  })
              }
              .width(StyleConstants.FULL_WIDTH)
              .padding({
                bottom: $r('app.float.padding_bottom')
              })
            }, (item: Comment, index?: number) => index + JSON.stringify(item))
          }
          .layoutWeight(1)
          .lanes(this.currentBp === BreakpointConstants.BREAKPOINT_LG ? 2 : 1)
          .scrollBar(BarState.Off)
          .margin({
            left: this.currentBp === BreakpointConstants.BREAKPOINT_SM ?
            $r('app.float.margin_left_sm') : $r('app.float.margin_left_list'),
            right: this.currentBp === BreakpointConstants.BREAKPOINT_SM ?
            $r('app.float.margin_right_sm') : $r('app.float.margin_right_list')
          })
          .divider({
            color: $r('app.color.list_divider'),
            strokeWidth: $r('app.float.stroke_width'),
            startMargin: this.currentBp === BreakpointConstants.BREAKPOINT_SM ?
            $r('app.float.start_margin') : $r('app.float.start_margin_lg'),
            endMargin: this.currentBp === BreakpointConstants.BREAKPOINT_SM ?
              0 : $r('app.float.divider_margin_left')
          })
        }
        .height(StyleConstants.FULL_HEIGHT)
      }
    }
    .backgroundColor(Color.White)
    .onBreakpointChange((breakpoint) => {
      this.currentBp = breakpoint;
    })
  }
}