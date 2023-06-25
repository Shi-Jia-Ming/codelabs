/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export interface NavItem {
  icon: Resource;
  icon_selected: Resource;
  text: Resource;
  id: number;
}

// tabId
export enum TabId {
  HOME,
  ACHIEVEMENT,
  MINE
}

export const NavList: NavItem[] = [
  {
    icon: $r('app.media.ic_tabs_home_normal'),
    icon_selected: $r('app.media.ic_tabs_home_sel'),
    text: $r('app.string.tab_home'),
    id: TabId.HOME
  },
  {
    icon: $r('app.media.ic_tabs_achievement_normal'),
    icon_selected: $r('app.media.ic_tabs_achievement_sel'),
    text: $r('app.string.tab_achievement'),
    id: TabId.ACHIEVEMENT
  },
  {
    icon: $r('app.media.ic_tabs_mine_normal'),
    icon_selected: $r('app.media.ic_tabs_mine_sel'),
    text: $r('app.string.tab_mine'),
    id: TabId.MINE
  },
]