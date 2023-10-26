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
 * Movie details info bean.
 */
export default class MovieDataBean {
  /**
   * Movie sort number
   */
  sort: number = 0;
  /**
   * Is show sort image
   */
  isShowSort: boolean = true;
  /***
   * Movie sort image
   */
  sortImage: Resource = $r('app.media.ic_first');
  /**
   * Movie title
   */
  title: string = '冰上姐妹';
  /**
   * Movie describe
   */
  describe: string = '讲述冰上女运动员之间团结友爱，互帮互助的故事';
  /**
   * Movie image
   */
  movieImage: Resource = $r('app.media.ic_movie_one');
  /**
   * Show card image
   */
  cardImage: string = '/common/ic_movie_one.png';
  /**
   * Movie stars
   */
  stars: Resource[] = [$r('app.media.ic_star')];
  /**
   * Movie rating
   */
  rating: string = '9.5';
  /**
   * Movie introduction
   */
  introduction: string = '默认简介';
}