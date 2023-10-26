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

import PreferenceModel from '../model/PreferenceModel';
import ButtonComponent from '../view/ButtonComponent';
import TextItemComponent from '../view/TextItemComponent';
import Fruit from '../viewmodel/Fruit';
import CommonConstants from '../common/constants/CommonConstants';
import StyleConstants from '../common/constants/StyleConstants';

/**
 * Index Page.
 */
@Entry
@Component
struct Index {
  @State fruit: Fruit = new Fruit();

  build() {
    Column() {
      // Fruit name text item component.
      TextItemComponent({
        textResource: $r('app.string.fruit_text'),
        placeholderResource: $r('app.string.fruit_placeholder'),
        textFlag: CommonConstants.FRUIT_FLAG,
        fruit: $fruit,
        textInputCallBack: (value: string) => {
          this.fruit.fruitName = value;
        }
      })

      // Fruit num text item component.
      TextItemComponent({
        textResource: $r('app.string.number_text'),
        placeholderResource: $r('app.string.number_placeholder'),
        textFlag: CommonConstants.NUMBER_FLAG,
        fruit: $fruit,
        textInputCallBack: (value: string) => {
          this.fruit.fruitNum = value;
        }
      })

      // button component.
      ButtonComponent({ fruit: $fruit })
    }
    .width(StyleConstants.FULL_PERCENT)
    .height(StyleConstants.FULL_PERCENT)
    .backgroundColor($r('app.color.main_background_color'))
  }

  async aboutToAppear() {
    // Get the lightweight storage db file from memory.
    await PreferenceModel.getPreferencesFromStorage();
    // Get the key value with the key name fruit from the lightweight storage db file.
    PreferenceModel.getFruitData().then((resultData: Fruit) => {
      if (resultData) {
        this.fruit = resultData;
      }
    });
  }
}