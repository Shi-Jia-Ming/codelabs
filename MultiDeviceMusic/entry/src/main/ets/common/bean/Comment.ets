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
 * Comment entity class.
 */
export class Comment {
  /**
   * Comment nickname.
   */
  nickname: string;

  /**
   * Comment content.
   */
  content: string;

  /**
   * Comment time.
   */
  time: string;

  /**
   * Comment image.
   */
  icon: ResourceStr;

  /**
   * Reply to a list of comments.
   */
  commentList?: Comment[];

  constructor(nickname: string, content: string, time: string, icon: ResourceStr, commentList?: Comment[]) {
    this.nickname = nickname;
    this.content = content;
    this.time = time;
    this.icon = icon;
    this.commentList = commentList;
  }
}