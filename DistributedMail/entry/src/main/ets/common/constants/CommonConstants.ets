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

export class CommonConstants {

  /**
   * The maximum component width.
   */
  static readonly PERCENTAGE_MAX: string = '100%';

  /**
   * Distributed mail image storage location.
   */
  static readonly MAIL_DISTRIBUTED_PATH: string = '/data/storage/el2/distributedfiles/';

  /**
   * File name for storing cross-end photos.
   */
  static readonly PICTURE_NAME: string = 'pictureName';

  /**
   * Supports transfer.
   */
  static readonly CAN_CONTINUATION: string = 'true';

  /**
   * Forwarding is not supported.
   */
  static readonly NO_CONTINUATION: string = 'false';

  /**
   * With picture streaming.
   */
  static readonly CAN_PHOTO: string = 'true';

  /**
   * Transfer without picture.
   */
  static readonly NO_PHOTO: string = 'false';

  /**
   * Image stream size.
   */
  static readonly IMAGE_STREAM_SIZE: number = 10240000;

  /**
   * Bottom toolbar picture spacing.
   */
  static readonly BOTTOM_IMAGE_SPACE: number = 24;

  static readonly FILE_BUFFER_SIZE: number = 4096;

  static readonly APPENDIX_LIST_SPACE: number = 5;

  static readonly APPENDIX_LIST_START_MARGIN: number = 15;

  static readonly APPENDIX_LIST_END_MARGIN: number = 15;
}



