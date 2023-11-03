/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import BalanceComponent from '../BalanceComponent';
import { TopBar } from '../../common/constants/HomeConstants';
import { PERCENTAGE_100 } from '../../common/constants/Constants';

@Component
export default struct TopBarComponent {
  build() {
    BalanceComponent({ left: this.LogoLayout, right: this.QRCodeLayout })
      .width(PERCENTAGE_100)
      .height(TopBar.HEIGHT)
  }

  @Builder LogoLayout() {
    Image($rawfile('index/icon.png'))
      .size({ width: TopBar.IMAGE_SIZE })
      .objectFit(ImageFit.Contain)
  }

  @Builder QRCodeLayout() {
    Image($rawfile('index/qrcode.png'))
      .size({ width: TopBar.IMAGE_SIZE })
      .objectFit(ImageFit.Contain)
  }
}