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
 * News list item info.
 */
export class NewsData {
  /**
   * News list item title.
   */
  title: string = '';

  /**
   * News list item content.
   */
  content: string = '';

  /**
   * News list item imagesUrl.
   */
  imagesUrl: Array<NewsFile> = [new NewsFile()];

  /**
   * News list item source.
   */
  source: string = '';
}

/**
 * News image list item info.
 */
export class NewsFile {
  /**
   * News image list item id.
   */
  id: number = 0;

  /**
   * News image list item url.
   */
  url:  | Object | ArrayBuffer = '';

  /**
   * News image list item type.
   */
  type: number = 0;

  /**
   * News image list item newsId.
   */
  newsId: number = 0;
}

