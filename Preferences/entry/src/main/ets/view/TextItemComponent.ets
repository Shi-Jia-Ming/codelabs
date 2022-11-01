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

import StyleConstants from '../common/constants/StyleConstants';
import CommonConstants from '../common/constants/CommonConstants';
import Fruit from '../common/bean/Fruit';

/**
 * Text item component.
 */
@Component
export default struct TextItemComponent {
  private textResource: Resource;
  private placeholderResource: Resource;
  private marginBottom: string;
  private marginTop: string;
  private textInputType: InputType;
  private textFlag: number;
  @Link fruit: Fruit;
  private textInputCallBack: (value: string) => void;

  aboutToAppear() {
    if (this.textFlag === CommonConstants.FRUIT_FLAG) {
      // Fruit name text input.
      this.marginTop = StyleConstants.MARGIN_TOP;
      this.marginBottom = StyleConstants.MARGIN_BOTTOM_SMALL;
      this.textInputType = InputType.Normal;
    } else {
      // Fruit number text input.
      this.marginBottom = StyleConstants.MARGIN_BOTTOM_BIG;
      this.textInputType = InputType.Number;
    }
  }

  build() {
    Column() {
      Text(this.textResource)
        .fontSize(StyleConstants.TEXT_FONT_SIZE)
        .height(StyleConstants.TEXT_HEIGHT)
        .width(StyleConstants.FULL_PERCENT)
        .fontColor($r('app.color.text_font_color'))
        .letterSpacing(StyleConstants.LETTER_SPACING)
        .fontWeight(StyleConstants.FONT_WEIGHT)
        .margin({
          bottom: StyleConstants.TEXT_MARGIN_BOTTOM,
          left: StyleConstants.TEXT_MARGIN_LEFT,
          top: this.marginTop
        })

      TextInput({
        placeholder: this.placeholderResource,
        text: this.textFlag === 0 ? (this.fruit.fruitName) : (this.fruit.fruitNum)
      })
        .placeholderFont({ size: StyleConstants.FONT_SIZE, weight: StyleConstants.FONT_WEIGHT })
        .placeholderColor($r('app.color.placeholder_color'))
        .caretColor(Color.Blue)
        .type(this.textInputType)
        .height(StyleConstants.TEXT_INPUT_HEIGHT)
        .width(StyleConstants.TEXT_INPUT_WIDTH)
        .margin({ bottom: this.marginBottom })
        .fontSize(StyleConstants.FONT_SIZE)
        .fontColor($r('app.color.text_font_color'))
        .fontWeight(StyleConstants.FONT_WEIGHT)
        .backgroundColor($r('app.color.white'))
        .onChange((value: string) => {
          this.textInputCallBack(value);
        })
    }
  }
}