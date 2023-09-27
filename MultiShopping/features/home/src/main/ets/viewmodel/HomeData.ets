/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

const searchSwiper: Resource[] = [
  $r('app.string.swiper_model_mate'),
  $r('app.string.swiper_model_chang'),
  $r('app.string.swiper_model_mate_book'),
  $r('app.string.swiper_model_Nova')
]

const classifyTitle: Resource[] = [
  $r('app.string.title_bar_homepage'),
  $r('app.string.title_bar_phone'),
  $r('app.string.title_bar_computer'),
  $r('app.string.title_bar_foods'),
  $r('app.string.title_bar_men_wear'),
  $r('app.string.title_bar_fresh'),
  $r('app.string.title_bar_furniture_kitchenware')
]

const swiperImage: Resource[] = [
  $r('app.media.ic_banner01'),
  $r('app.media.ic_banner02'),
  $r('app.media.ic_banner03'),
  $r('app.media.ic_banner04')
]

class ActivityTitleModel {
  title?: Resource
  desc?: Resource
}

const activityTitle: ActivityTitleModel[] = [
  {
    title: $r('app.string.activity_title_all'),
    desc: $r('app.string.activity_title_all_desc')
  },
  {
    title: $r('app.string.activity_title_selected'),
    desc: $r('app.string.activity_title_selected_desc')
  },
  {
    title: $r('app.string.activity_title_new_products'),
    desc: $r('app.string.activity_title_new_products_desc')
  },
  {
    title: $r('app.string.activity_title_affordable'),
    desc: $r('app.string.activity_title_affordable_desc')
  }
]

export { searchSwiper, classifyTitle, swiperImage, activityTitle, ActivityTitleModel }