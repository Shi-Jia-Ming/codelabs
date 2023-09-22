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

import { BalanceStyle } from '../common/constants/Constants';

/*
 * BalanceComponent
 * right: The right component align start.
 *  left: The left component align end.
 */
@Component
export default struct BalanceComponent {
  @BuilderParam right: () => void = () => {};
  @BuilderParam left: () => void = () => {};

  build() {
    Row() {
      Row() {
        this.left()
      }
      .layoutWeight(BalanceStyle.LAYOUT_WEIGHT)
      .align(Alignment.Start)

      Row() {
        this.right()
      }
      .layoutWeight(BalanceStyle.LAYOUT_WEIGHT)
      .justifyContent(FlexAlign.End)

    }
  }
}