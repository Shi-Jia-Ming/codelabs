/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
enum FontSize {
  Smaller = 8,
  Small = 12,
  Middle = 14,
  Large = 18,
  Larger = 21,
  Largest=23
}

export enum AppFontSize {
  /**
   * Indicates that the fontSize of the app button.
   */
  Button1 = FontSize.Large,
  Button2 = FontSize.Small,

  /**
   * Indicates that the fontSize of the app title.
   */
  Title = FontSize.Larger,
  Subtitle  = FontSize.Large,
  /**
   * Indicates that the fontSize of the app normal text.
   */
  Text1 = FontSize.Middle,
  Text2 = FontSize.Small,
  Text3 = FontSize.Smaller
}