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
 * Item info of the zones.
 */
export default class ZonesItem {
  id: number;
  title: ResourceStr;
  subTitle: ResourceStr;
  createTime: ResourceStr;
  content: ResourceStr[];
  thumbnail: ResourceStr;
  swiperPic: ResourceStr;
  subPicTop: ResourceStr;
  subPicBottom: ResourceStr;
  titleIcon: ResourceStr;
  imageList: ResourceStr[];
  buildingInformation: ResourceStr;
  buildingPic: ResourceStr;
  geographyPic: ResourceStr;
  geographyPicLight: ResourceStr;
  backgroundColor: ResourceStr;
  starLinePic: ResourceStr[];
}