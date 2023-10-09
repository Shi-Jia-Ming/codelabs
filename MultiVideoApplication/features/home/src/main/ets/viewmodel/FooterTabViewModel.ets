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

export class FooterTabViewModel {
  private tabList: FooterTab[] = [];

  constructor() {
    this.tabList.push(new FooterTab($r('app.string.tab_home'), $r("app.media.ic_tabs_home_normal"),
      $r('app.media.ic_tabs_home_selected'), $r('app.media.ic_tabs_home_white')));
    this.tabList.push(new FooterTab($r('app.string.tab_development'), $r('app.media.ic_tabs_post_normal'),
      $r('app.media.ic_tabs_post_selected'), $r('app.media.ic_tabs_post_white')));
    this.tabList.push(new FooterTab($r('app.string.tab_member'), $r('app.media.ic_tabs_vip_normal'),
      $r('app.media.ic_tabs_vip_selected'), $r('app.media.ic_tabs_vip_white')));
    this.tabList.push(new FooterTab($r('app.string.tab_mine'), $r('app.media.ic_tabs_mine_normal'),
      $r('app.media.ic_tabs_mine_selected'), $r('app.media.ic_tabs_mine_white')));
  }

  getTabList(): FooterTab[] {
    return this.tabList;
  }
}

export class FooterTab {
  /**
   * Name of the tab.
   */
  private name: Resource;

  /**
   * Icon of the tab.
   */
  private icon: Resource;

  /**
   * Icon selected.
   */
  private iconSelected: Resource;

  /**
   * White icon.
   */
  private iconWhite: Resource;

  constructor(name: Resource, icon: Resource, iconSelected: Resource, iconWhite: Resource) {
    this.name = name;
    this.icon = icon;
    this.iconSelected = iconSelected;
    this.iconWhite = iconWhite;
  }

  getName(): Resource {
    return this.name;
  }

  getIcon(): Resource {
    return this.icon;
  }

  getIconSelected(): Resource {
    return this.iconSelected;
  }

  getIconWhite(): Resource {
    return this.iconWhite;
  }
}