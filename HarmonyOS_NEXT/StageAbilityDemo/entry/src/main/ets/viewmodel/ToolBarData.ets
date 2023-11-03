/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
 * ToolBarData is used to initialize ToolBarComponent.
 */
export default class ToolBarData {
  num: number = 0;
  text: Resource = $r('app.string.nav_index');
  icon_after: Resource = $rawfile('index/home.png');
  icon: Resource = $rawfile('index/home_selected.png');
}