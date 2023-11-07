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
  id: number = 0;
  title: ResourceStr = $r('app.string.area_name_a');
  subTitle: ResourceStr = $r('app.string.area_sub_name_a');
  createTime: ResourceStr = $r('app.string.create_year_2015');
  content: ResourceStr[] = [];
  thumbnail: ResourceStr = $r('app.media.ic_thumbnail_a');
  swiperPic: ResourceStr = $r('app.media.ic_A');
  subPicTop: ResourceStr = $r('app.media.ic_A_photo_top');
  subPicBottom: ResourceStr = $r('app.media.ic_A_photo_bottom');
  titleIcon: ResourceStr = $r('app.media.ic_title_top_A');
  imageList: ResourceStr[] = [];
  buildingInformation: ResourceStr = $r('app.string.build_information_a');
  buildingPic: ResourceStr = $r('app.media.ic_building_A');
  geographyPic: ResourceStr = $r('app.media.ic_geography_dark_A');
  geographyPicLight: ResourceStr = $r('app.media.ic_geography_lighter_A');
  backgroundColor: ResourceStr = $r('app.color.introduction_page_green');
  starLinePic: ResourceStr[] = [];
}