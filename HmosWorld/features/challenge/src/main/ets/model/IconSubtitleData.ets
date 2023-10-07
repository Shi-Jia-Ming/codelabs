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

/**
 * Item info of subtitle.
 */
export class IconSubtitle {
  icon: ResourceStr = '';
  title: string = '';
  enTitle: string = '';
}

export const ICON_SUBTITLE_ARRAY: IconSubtitle[] = [
  { icon: $r('app.media.ic_design_style'), title:'设计风格', enTitle: 'DESIGN STYLE' },
  { icon: $r('app.media.ic_building'), title:'建筑信息', enTitle: 'BUILDING INFORMATION' },
  { icon: $r('app.media.ic_geography_icon'), title:'地理位置', enTitle: 'GEOGRAPHIC LOCATION' }
]