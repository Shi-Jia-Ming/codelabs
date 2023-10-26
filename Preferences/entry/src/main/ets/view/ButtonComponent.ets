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
import ButtonItemData from '../viewmodel/ButtonItemData';
import Fruit from '../viewmodel/Fruit';
import StyleConstants from '../common/constants/StyleConstants';

/**
 * Button component.
 */
@Component
export default struct ButtonComponent {
  private buttonItemValues: Array<ButtonItemData> = this.getButtonItemValues();
  @Link fruit: Fruit;

  build() {
    Column() {
      ForEach(this.buttonItemValues, (item: ButtonItemData) => {
        Button(item.resource, { type: ButtonType.Capsule, stateEffect: true })
          .backgroundColor($r('app.color.button_background_color'))
          .width(StyleConstants.BUTTON_WIDTH)
          .height(StyleConstants.BUTTON_HEIGHT)
          .fontWeight(StyleConstants.FONT_WEIGHT)
          .fontSize(StyleConstants.FONT_SIZE)
          .margin({ bottom: StyleConstants.BUTTON_MARGIN_BOTTOM })
          .onClick(() => {
            item.clickMethod();
          })
      }, (item: ButtonItemData) => JSON.stringify(item))
    }
  }

  /**
   * Gets the data in the clicked button.
   */
  getButtonItemValues() {
    let values: Array<ButtonItemData> = [
      new ButtonItemData(
        $r('app.string.write_data_btn_text'),
        () => {
          // Write data.
          PreferenceModel.writeData(this.fruit);
        }
      ),
      new ButtonItemData(
        $r('app.string.read_data_btn_text'),
        () => {
          // Get data from the preferences database.
          PreferenceModel.getFruitData().then((resultData: Fruit) => {
            if (resultData) {
              this.fruit = resultData;
            }
          });
        }
      ),
      new ButtonItemData(
        $r('app.string.delete_data_file_btn_text'),
        () => {
          // Delete database files.
          PreferenceModel.deletePreferences();
          // After a database file is deleted, the corresponding data is left blank.
          this.fruit.fruitName = '';
          this.fruit.fruitNum = ''
        }
      )
    ];
    return values;
  }
}