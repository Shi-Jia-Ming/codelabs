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

import { DetailConstants } from '../constants/DetailConstants';

export class UserViewModel {
  private userList: UserInfo[] = [];

  constructor() {
    this.userList.push(new UserInfo(DetailConstants.USER_INFO_NAMES[0], $r('app.media.user_profile_2'),
      DetailConstants.USER_INFO_COMMENTS[0], undefined, DetailConstants.USER_INFO_DATE));
    this.userList.push(new UserInfo(DetailConstants.USER_INFO_NAMES[1], $r('app.media.user_profile_3'),
      DetailConstants.USER_INFO_COMMENTS[1], $r("app.media.comment_2"), DetailConstants.USER_INFO_DATE));
    this.userList.push(new UserInfo(DetailConstants.USER_INFO_NAMES[2], $r('app.media.user_profile_4'),
      DetailConstants.USER_INFO_COMMENTS[2], $r('app.media.comment_3'), DetailConstants.USER_INFO_DATE));
  }

  getRelatedVideoList(): UserInfo[] {
    return this.userList;
  }

  getSelfInfo(): UserInfo {
    return new UserInfo('', $r('app.media.user_profile_1'), '', undefined, '');
  }
}

export class UserInfo {
  /**
   * Name of the user.
   */
  private name: string;

  /**
   * Image src of user.
   */
  private imageSrc: Resource;

  /**
   * Comment of user.
   */
  private comment: string;

  /**
   * Image src of the comment.
   */
  private commentImageSrc: Resource | undefined;

  /**
   * Time of the comment.
   */
  private time: string;

  constructor(name: string, imageSrc: Resource, comment: string, commentImageSrc: Resource | undefined, time: string) {
    this.name = name;
    this.imageSrc = imageSrc;
    this.comment = comment;
    this.commentImageSrc = commentImageSrc;
    this.time = time;
  }

  public getName(): string {
    return this.name;
  }

  public getImageSrc(): Resource {
    return this.imageSrc;
  }

  public getComment(): string {
    return this.comment;
  }

  public getCommentImageSrc(): Resource | undefined {
    return this.commentImageSrc;
  }

  public getTime(): string {
    return this.time;
  }
}