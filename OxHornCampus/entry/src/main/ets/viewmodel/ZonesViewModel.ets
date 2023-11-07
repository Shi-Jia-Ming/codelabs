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

import ZonesItem from './ZonesItem';

class ZonesViewModel {
  getZonesList(): ZonesItem[] {
    return defaultList;
  }

  getZonesByIndex(index: number): ZonesItem {
    return defaultList[index];
  }
}

let zonesViewModel = new ZonesViewModel();

export default zonesViewModel as ZonesViewModel;

const defaultList: ZonesItem[] = [
  {
    id: 0,
    title: $r('app.string.area_name_a'),
    subTitle: $r('app.string.area_sub_name_a'),
    thumbnail: $r('app.media.ic_thumbnail_a'),
    swiperPic: $r('app.media.ic_A'),
    createTime: $r('app.string.create_year_2015'),
    content: [$r('app.string.introduction_paragraph_first_a'),
      $r('app.string.introduction_paragraph_second_a')],
    subPicTop: $r('app.media.ic_A_photo_top'),
    subPicBottom: $r('app.media.ic_A_photo_bottom'),
    titleIcon: $r('app.media.ic_title_top_A'),
    imageList: [$r('app.media.ic_A_1'), $r('app.media.ic_A_2'), $r('app.media.ic_A_3'), $r('app.media.ic_A_4'),
      $r('app.media.ic_A_5')],
    buildingInformation: $r('app.string.build_information_a'),
    buildingPic: $r("app.media.ic_building_A"),
    geographyPic: $r("app.media.ic_geography_dark_A"),
    geographyPicLight: $r("app.media.ic_geography_lighter_A"),
    backgroundColor: $r('app.color.introduction_page_green'),
    starLinePic: [$r("app.media.ic_starLine_A_light"), $r("app.media.ic_starLine_A_dark")]
  },
  {
    id: 1,
    title: $r('app.string.area_name_b'),
    subTitle: $r('app.string.area_sub_name_b'),
    thumbnail: $r('app.media.ic_thumbnail_b'),
    swiperPic: $r('app.media.ic_B'),
    createTime: $r('app.string.create_year_2015'),
    content: [$r('app.string.introduction_paragraph_first_b'),
    $r('app.string.introduction_paragraph_second_b')],
    subPicTop: $r("app.media.ic_B_photo_top"),
    subPicBottom: $r("app.media.ic_B_photo_bottom"),
    titleIcon: $r('app.media.ic_title_top_B'),
    imageList: [$r('app.media.ic_B_1'), $r('app.media.ic_B_2'), $r('app.media.ic_B_3'), $r('app.media.ic_B_4'),
    $r('app.media.ic_B_5')],
    buildingInformation: $r('app.string.build_information_b'),
    buildingPic: $r('app.media.ic_building_G'),
    geographyPic: $r("app.media.ic_geography_dark_B"),
    geographyPicLight: $r("app.media.ic_geography_lighter_B"),
    backgroundColor: $r('app.color.introduction_b_page_blue'),
    starLinePic: [$r("app.media.ic_starLine_B_light"), $r("app.media.ic_starLine_B_dark")]
  },
  {
    id: 2,
    title: $r('app.string.area_name_c'),
    subTitle: $r('app.string.area_sub_name_c'),
    thumbnail: $r('app.media.ic_thumbnail_c'),
    swiperPic: $r("app.media.ic_C"),
    createTime: $r('app.string.create_year_2015'),
    content: [$r('app.string.introduction_paragraph_first_c'),
    $r('app.string.introduction_paragraph_second_c')],
    subPicTop: $r("app.media.ic_C_photo_top"),
    subPicBottom: $r("app.media.ic_C_photo_bottom"),
    titleIcon: $r('app.media.ic_title_top_C'),
    imageList: [$r('app.media.ic_C_1'), $r('app.media.ic_C_2'), $r('app.media.ic_C_3'), $r('app.media.ic_C_4'),
    $r('app.media.ic_C_5')],
    buildingInformation: $r('app.string.build_information_c'),
    buildingPic: $r('app.media.ic_building_C'),
    geographyPic: $r("app.media.ic_geography_dark_C"),
    geographyPicLight: $r("app.media.ic_geography_lighter_C"),
    backgroundColor: $r('app.color.introduction_c_page_blue'),
    starLinePic: [$r("app.media.ic_starLine_C_light"), $r("app.media.ic_starLine_C_dark")]
  },
  {
    id: 3,
    title: $r('app.string.area_name_d'),
    subTitle: $r('app.string.area_sub_name_d'),
    thumbnail: $r('app.media.ic_thumbnail_d'),
    swiperPic: $r("app.media.ic_D"),
    createTime: $r('app.string.create_year_2015'),
    content: [$r('app.string.introduction_paragraph_first_d'),
    $r('app.string.introduction_paragraph_second_d')],
    subPicTop: $r("app.media.ic_D_photo_top"),
    subPicBottom: $r("app.media.ic_D_photo_bottom"),
    titleIcon: $r('app.media.ic_title_top_D'),
    imageList: [$r('app.media.ic_D_1'), $r('app.media.ic_D_2'), $r('app.media.ic_D_3'), $r('app.media.ic_D_4'),
    $r('app.media.ic_D_5')],
    buildingInformation: $r('app.string.build_information_d'),
    buildingPic: $r('app.media.ic_building_D'),
    geographyPic: $r("app.media.ic_geography_dark_D"),
    geographyPicLight: $r("app.media.ic_geography_lighter_D"),
    backgroundColor: $r('app.color.introduction_d_page_blue'),
    starLinePic: [$r("app.media.ic_starLine_D_light"), $r("app.media.ic_starLine_D_dark")]
  },
  {
    id: 4,
    title: $r('app.string.area_name_e'),
    subTitle: $r('app.string.area_sub_name_e'),
    thumbnail: $r('app.media.ic_thumbnail_e'),
    swiperPic: $r('app.media.ic_E'),
    createTime: $r('app.string.create_year_2015'),
    content: [$r('app.string.introduction_paragraph_first_e'),
      $r('app.string.introduction_paragraph_second_e')],
    subPicTop: $r('app.media.ic_E_photo_top'),
    subPicBottom: $r('app.media.ic_E_photo_bottom'),
    titleIcon: $r('app.media.ic_title_top_E'),
    imageList: [$r('app.media.ic_E_1'), $r('app.media.ic_E_2'), $r('app.media.ic_E_3'), $r('app.media.ic_E_4'),
      $r('app.media.ic_E_5')],
    buildingInformation: $r('app.string.build_information_e'),
    buildingPic: $r('app.media.ic_building_E'),
    geographyPic: $r("app.media.ic_geography_dark_E"),
    geographyPicLight: $r("app.media.ic_geography_lighter_E"),
    backgroundColor: $r('app.color.introduction_page_orange_dark'),
    starLinePic: [$r('app.media.ic_starLine_E_lighter'), $r('app.media.ic_starLine_E_dark')]
  },
  {
    id: 5,
    title: $r('app.string.area_name_f'),
    subTitle: $r('app.string.area_sub_name_f'),
    thumbnail: $r('app.media.ic_thumbnail_f'),
    swiperPic: $r('app.media.ic_F'),
    createTime: $r('app.string.create_year_2015'),
    content: [$r('app.string.introduction_paragraph_first_f'),
      $r('app.string.introduction_paragraph_second_f')],
    subPicTop: $r('app.media.ic_F_photo_top'),
    subPicBottom: $r('app.media.ic_F_photo_bottom'),
    titleIcon: $r('app.media.ic_title_top_F'),
    imageList: [$r('app.media.ic_F_1'), $r('app.media.ic_F_2'), $r('app.media.ic_F_3'), $r('app.media.ic_F_4'),
      $r('app.media.ic_F_5')],
    buildingInformation: $r('app.string.build_information_f'),
    buildingPic: $r("app.media.ic_building_F"),
    geographyPic: $r("app.media.ic_geography_lighter_F"),
    geographyPicLight: $r("app.media.ic_geography_lighter_F"),
    backgroundColor: $r('app.color.introduction_page_orange_light'),
    starLinePic: [$r('app.media.ic_starLine_F_lighter'), $r('app.media.ic_starLine_F_dark')]
  },
  {
    id: 6,
    title: $r('app.string.area_name_g'),
    subTitle: $r('app.string.area_sub_name_g'),
    thumbnail: $r("app.media.ic_thumbnail_g"),
    swiperPic: $r('app.media.ic_G'),
    createTime: $r('app.string.create_year_2015'),
    content: [$r('app.string.introduction_paragraph_first_g'),
      $r('app.string.introduction_paragraph_second_g')],
    subPicTop: $r('app.media.ic_G_photo_top'),
    subPicBottom: $r("app.media.ic_G_photo_bottom"),
    titleIcon: $r('app.media.ic_title_top_G'),
    imageList: [$r('app.media.ic_G_1'), $r('app.media.ic_G_2'), $r('app.media.ic_G_3'), $r('app.media.ic_G_4'),
      $r('app.media.ic_G_5')],
    buildingInformation: $r('app.string.build_information_g'),
    buildingPic: $r('app.media.ic_building_G'),
    geographyPic: $r("app.media.ic_geography_dark_G"),
    geographyPicLight: $r("app.media.ic_geography_lighter_G"),
    backgroundColor: $r('app.color.introduction_page_blue'),
    starLinePic: [$r('app.media.ic_starLine_G_light'), $r('app.media.ic_starLine_G_dark')]
  },
  {
    id: 7,
    title: $r('app.string.area_name_h'),
    subTitle: $r('app.string.area_sub_name_h'),
    thumbnail: $r('app.media.ic_thumbnail_h'),
    swiperPic: $r('app.media.ic_H'),
    createTime: $r('app.string.create_year_2015'),
    content: [$r('app.string.introduction_paragraph_first_h'),
      $r('app.string.introduction_paragraph_second_h')],
    subPicTop: $r("app.media.ic_H_photo_top"),
    subPicBottom: $r("app.media.ic_H_photo_bottom"),
    titleIcon: $r('app.media.ic_title_top_H'),
    imageList: [$r('app.media.ic_H_1'), $r('app.media.ic_H_2'), $r('app.media.ic_H_3'), $r('app.media.ic_H_4'),
      $r('app.media.ic_H_5')],
    buildingInformation: $r('app.string.build_information_h'),
    buildingPic: $r('app.media.ic_building_H'),
    geographyPic: $r("app.media.ic_geography_dark_H"),
    geographyPicLight: $r("app.media.ic_geography_lighter_H"),
    backgroundColor: $r('app.color.introduction_page_blue_light'),
    starLinePic: [$r('app.media.ic_starLine_H_light'), $r('app.media.ic_starLine_H_dark')]
  },
  {
    id: 8,
    title: $r('app.string.area_name_j'),
    subTitle: $r('app.string.area_sub_name_j'),
    thumbnail: $r('app.media.ic_thumbnail_j'),
    swiperPic: $r('app.media.ic_J'),
    createTime: $r('app.string.create_year_2015'),
    content: [$r('app.string.introduction_paragraph_first_j'),
      $r('app.string.introduction_paragraph_second_j')],
    subPicTop: $r('app.media.ic_J_photo_top'),
    subPicBottom: $r('app.media.ic_J_photo_bottom'),
    titleIcon: $r('app.media.ic_title_top_J'),
    imageList: [$r('app.media.ic_J_1'), $r('app.media.ic_J_2'), $r('app.media.ic_J_3'), $r('app.media.ic_J_4'),
      $r('app.media.ic_J_5')],
    buildingInformation: $r('app.string.build_information_j'),
    buildingPic: $r('app.media.ic_building_J'),
    geographyPic: $r("app.media.ic_geography_dark_J"),
    geographyPicLight: $r("app.media.ic_geography_lighter_J"),
    backgroundColor: $r('app.color.introduction_page_red'),
    starLinePic: [$r('app.media.ic_starLine_J_lighter'), $r('app.media.ic_starLine_J_dark')]
  },
  {
    id: 9,
    title: $r('app.string.area_name_k'),
    subTitle: $r('app.string.area_sub_name_k'),
    thumbnail: $r('app.media.ic_thumbnail_k'),
    swiperPic: $r('app.media.ic_K'),
    createTime: $r('app.string.create_year_2015'),
    content: [$r('app.string.introduction_paragraph_first_k'),
      $r('app.string.introduction_paragraph_second_k')],
    subPicTop: $r("app.media.ic_K_photo_top"),
    subPicBottom: $r("app.media.ic_K_photo_bottom"),
    titleIcon: $r('app.media.ic_title_top_K'),
    imageList: [$r('app.media.ic_K_1'), $r('app.media.ic_K_2'), $r('app.media.ic_K_3'), $r('app.media.ic_K_4'),
      $r('app.media.ic_K_5')],
    buildingInformation: $r('app.string.build_information_k'),
    buildingPic: $r('app.media.ic_building_K'),
    geographyPic: $r("app.media.ic_geography_dark_K"),
    geographyPicLight: $r("app.media.ic_geography_lighter_K"),
    backgroundColor: '#769D33',
    starLinePic: [$r("app.media.ic_starLine_K_light"), $r("app.media.ic_starLine_K_dark")]
  },
  {
    id: 10,
    title: $r('app.string.area_name_l'),
    subTitle: $r('app.string.area_sub_name_l'),
    thumbnail: $r('app.media.ic_thumbnail_l'),
    swiperPic: $r('app.media.ic_L'),
    createTime: $r('app.string.create_year_2015'),
    content: [$r('app.string.introduction_paragraph_first_l'),
      $r('app.string.introduction_paragraph_second_l')],
    subPicTop: $r("app.media.ic_L_photo_top"),
    subPicBottom: $r("app.media.ic_L_photo_bottom"),
    titleIcon: $r('app.media.ic_title_top_L'),
    imageList: [$r('app.media.ic_L_1'), $r('app.media.ic_L_2'), $r('app.media.ic_L_3'), $r('app.media.ic_L_4'),
      $r('app.media.ic_L_5')],
    buildingInformation: $r('app.string.build_information_l'),
    buildingPic: $r('app.media.ic_building_L'),
    geographyPic: $r("app.media.ic_geography_dark_L"),
    geographyPicLight: $r("app.media.ic_geography_lighter_L"),
    backgroundColor: $r('app.color.introduction_page_red_light'),
    starLinePic: [$r("app.media.ic_starLine_L_light"), $r("app.media.ic_starLine_L_dark")]
  },
  {
    id: 11,
    title: $r('app.string.area_name_m'),
    subTitle: $r('app.string.area_sub_name_m'),
    thumbnail: $r('app.media.ic_thumbnail_m'),
    swiperPic: $r('app.media.ic_M'),
    createTime: $r('app.string.create_year_2015'),
    content: [$r('app.string.introduction_paragraph_first_m'),
    $r('app.string.introduction_paragraph_second_m')],
    subPicTop: $r("app.media.ic_M_photo_top"),
    subPicBottom: $r("app.media.ic_M_photo_bottom"),
    titleIcon: $r('app.media.ic_title_top_M'),
    imageList: [$r('app.media.ic_M_1'), $r('app.media.ic_M_2'), $r('app.media.ic_M_3'), $r('app.media.ic_M_4'),
    $r('app.media.ic_M_5')],
    buildingInformation: $r('app.string.build_information_m'),
    buildingPic: $r('app.media.ic_building_M'),
    geographyPic: $r("app.media.ic_geography_dark_M"),
    geographyPicLight: $r("app.media.ic_geography_lighter_M"),
    backgroundColor: $r('app.color.introduction_page_blue_lighter'),
    starLinePic: [$r("app.media.ic_starLine_M_light"), $r("app.media.ic_starLine_M_dark")]
  }
]