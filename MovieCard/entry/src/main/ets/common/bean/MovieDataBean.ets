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
  sort: number;

  /**
   * Is show sort image
   */
  isShowSort: boolean;

  /***
   * Movie sort image
   */
  sortImage: Resource;

  /**
   * Movie title
   */
  title: string;

  /**
   * Movie describe
   */
  describe: string;

  /**
   * Movie image
   */
  movieImage: Resource;

  /**
   * Show card image
   */
  cardImage: string;

  /**
   * Movie stars
   */
  stars: Resource[];

  /**
   * Movie rating
   */
  rating: string;

  /**
   * Movie introduction
   */
  introduction: string;
}