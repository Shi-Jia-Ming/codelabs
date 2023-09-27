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

import router from '@ohos.router';

import { RouterUrlConstants } from '../common/constants/RouterUrlConstants';

const optionList: OptionItem[] = [
  { image: $r('app.media.ic_collect'), text: $r('app.string.collect') },
  { image: $r('app.media.ic_download'), text: $r('app.string.download') },
  { image: $r('app.media.ic_comments'), text: $r('app.string.comment'), action: () => {
    router.pushUrl({
      url: RouterUrlConstants.MUSIC_COMMENT
    }, router.RouterMode.Single)
  } },
  { image: $r('app.media.ic_share'), text: $r('app.string.share') }
]

class OptionItem {
  image: Resource = $r('app.media.ic_collect');
  text?: Resource;
  action?: () => void;
}

export { optionList, OptionItem }