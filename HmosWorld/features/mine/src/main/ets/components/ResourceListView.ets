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

import common from '@ohos.app.ability.common';
import { CommonConstants, LearningResource, NoMoreLayout, ObservedArray, ResourcesType, } from '@ohos/common';
import { ArticleCardView } from './ArticleCardView';
import { FeedCardView } from './FeedCardView';
import Constants from '../constants/Constants';
import { ScrollPosition } from './MineView';
import { UserModel } from '../model/UserModel';

const eventHub: common.EventHub = (getContext(this) as common.UIAbilityContext).eventHub;

@Component
export struct ResourceListView {
  @State userModel: UserModel = UserModel.getInstance();
  @State collectedIds: ObservedArray<string> = this.userModel.collectedIds;
  @State likedIds: ObservedArray<string> = this.userModel.likedIds;
  @ObjectLink contents: ObservedArray<LearningResource>;
  @State listPosition: number = ScrollPosition.start;
  @Consume scrollPosition: number;
  scrollerForScroll?: Scroller;
  scrollerForList?: Scroller;

  isCollected(resourceId: string): boolean {
    return this.collectedIds.some((id: string) => id === resourceId);
  }

  isLiked(resourceId: string): boolean {
    return this.likedIds.some((id: string) => id === resourceId);
  }

  build() {
    List({ space: Constants.RESOURCE_LIST_SPACE, scroller: this.scrollerForList }) {
      ForEach(this.contents, (content: LearningResource, index?: number) => {
        ListItem() {
          if (content.type === ResourcesType.ARTICLE) {
            ArticleCardView({
              articleItem: content,
              isCollected: this.isCollected(content.id),
              isLiked: this.isLiked(content.id),
              onCollected: () => {
                eventHub.emit(CommonConstants.COLLECTED_EVENT, {
                  resourceId: content.id,
                  resourceType: content.type,
                  actionValue: !this.isCollected(content.id)
                })
              },
              onLiked: () => {
                eventHub.emit(CommonConstants.LIKED_EVENT, {
                  resourceId: content.id,
                  resourceType: content.type,
                  actionValue: !this.isLiked(content.id)
                })
              }
            })
          } else {
            FeedCardView({ articleItem: content })
          }
        }
        .backgroundColor($r('app.color.hmos_color_white'))
        .borderRadius($r('app.float.resource_list_border_radius'))
      })

      ListItem() {
        NoMoreLayout()
      }
    }
    .padding({ left: $r('app.float.list_padding'), right: $r('app.float.list_padding') })
    .alignListItem(ListItemAlign.Start)
    .width(Constants.FULL_SCREEN)
    .height(Constants.FULL_SCREEN)
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.None)
    .onReachStart(() => {
      this.listPosition = ScrollPosition.start;
    })
    .onReachEnd(() => {
      this.listPosition = ScrollPosition.end;
    })
    .onScrollFrameBegin((offset: number) => {
      if (!((this.listPosition === ScrollPosition.start && offset < 0)
        || (this.listPosition === ScrollPosition.end && offset > 0))) {
        this.listPosition = ScrollPosition.center;
      }

      if (this.scrollPosition === ScrollPosition.end
        && (this.listPosition !== ScrollPosition.start || offset > 0)) {
        return { offsetRemain: offset };
      } else {
        this.scrollerForScroll?.scrollBy(0, offset);
        return { offsetRemain: 0 };
      }
    })
  }
}