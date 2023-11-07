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

import Logger from '../common/util/Logger';
import CalculateUtil from '../common/util/CalculateUtil';
import CheckEmptyUtil from '../common/util/CheckEmptyUtil';
import keysModel from '../viewmodel/PresskeysViewModel';
import { PressKeyItem } from '../viewmodel/PressKeysItem';
import { CommonConstants, Symbol } from '../common/constants/CommonConstants';

@Entry
@Component
struct HomePage {
  @State inputValue: string = '';
  @State calValue: string = '';
  private expressions: Array<string> = [];

  build() {
    Column() {
      Column() {
        TextInput({ text: this.resultFormat(this.inputValue) })
          .height(CommonConstants.FULL_PERCENT)
          .fontSize(
            (this.inputValue.length > CommonConstants.INPUT_LENGTH_MAX) ?
              $r('app.float.font_size_text') : $r('app.float.font_size_input')
          )
          .enabled(false)
          .fontColor(Color.Black)
          .textAlign(TextAlign.End)
          .backgroundColor($r('app.color.input_back_color'))
      }
      .width(CommonConstants.FULL_PERCENT)
      .height($r('app.float.input_height'))
      .alignItems(HorizontalAlign.End)
      .margin({
        right: $r('app.float.input_margin_right'),
        top: $r('app.float.input_margin_top')
      })

      Column() {
        Text(this.resultFormat(this.calValue))
          .fontSize($r('app.float.font_size_text'))
          .fontColor($r('app.color.text_color'))
      }
      .width(CommonConstants.FULL_PERCENT)
      .height($r('app.float.text_height'))
      .alignItems(HorizontalAlign.End)
      .margin({
        right: $r('app.float.text_margin_right'),
        bottom: $r('app.float.text_margin_bottom')
      })

      Column() {
        Row() {
          ForEach(keysModel.getPressKeys(), (columnItem: Array<PressKeyItem>, columnItemIndex?: number) => {
            Column() {
              ForEach(columnItem, (keyItem: PressKeyItem, keyItemIndex?: number) => {
                Column() {
                  Column() {
                    if (keyItem.flag === 0) {
                      Image(keyItem.source !== undefined ? keyItem.source : '')
                        .width(keyItem.width)
                        .height(keyItem.height)
                    } else {
                      Text(keyItem.value)
                        .fontSize(
                          (keyItem.value === CommonConstants.DOTS) ?
                            $r('app.float.font_size_dot') : $r('app.float.font_size_text')
                        )
                        .width(keyItem.width)
                        .height(keyItem.height)
                    }
                  }
                  .width($r('app.float.key_width'))
                  .height(
                    ((columnItemIndex === (keysModel.getPressKeys().length - 1)) &&
                      (keyItemIndex === (columnItem.length - 1))) ?
                      $r('app.float.equals_height') : $r('app.float.key_height')
                  )
                  .borderWidth(1)
                  .borderColor($r('app.color.border_color'))
                  .borderRadius($r('app.float.border_radius'))
                  .backgroundColor(
                    ((columnItemIndex === (keysModel.getPressKeys().length - 1)) &&
                      (keyItemIndex === (columnItem.length - 1))) ?
                      $r('app.color.equals_back_color') : Color.White
                  )
                  .alignItems(HorizontalAlign.Center)
                  .justifyContent(FlexAlign.Center)
                  .onClick(() => {
                    if (keyItem.flag === 0) {
                      this.inputSymbol(keyItem.value);
                    } else {
                      this.inputNumber(keyItem.value);
                    }
                  })
                }
                .layoutWeight(
                  ((columnItemIndex === (keysModel.getPressKeys().length - 1)) &&
                    (keyItemIndex === (columnItem.length - 1))) ? CommonConstants.TWO : 1
                )
                .width(CommonConstants.FULL_PERCENT)
                .justifyContent(FlexAlign.Center)
              }, (keyItem: PressKeyItem) => JSON.stringify(keyItem))
            }
            .layoutWeight(1)
            .margin({
              top: $r('app.float.margin_top'),
              bottom: $r('app.float.margin_bottom')
            })
          }, (item: Array<Array<PressKeyItem>>) => JSON.stringify(item))
        }
        .height(CommonConstants.FULL_PERCENT)
        .alignItems(VerticalAlign.Top)
        .margin({
          left: $r('app.float.margin_left'),
          right: $r('app.float.margin_right')
        })
      }
      .layoutWeight(1)
      .width(CommonConstants.FULL_PERCENT)
      .backgroundColor($r('app.color.row_back_color'))
    }
    .height(CommonConstants.FULL_PERCENT)
    .backgroundColor($r('app.color.column_back_color'))
  }

  /**
   * Input Symbols.
   *
   * @param value Input Operators.
   */
  inputSymbol(value: string) {
    if (CheckEmptyUtil.isEmpty(value)) {
      return;
    }
    let len = this.expressions.length;
    switch (value) {
      case Symbol.CLEAN:
        this.expressions = [];
        this.calValue = '';
        break;
      case Symbol.DEL:
        this.inputDelete(len);
        break;
      case Symbol.EQU:
        if (len === 0) {
          return;
        }
        this.getResult().then((result: boolean) => {
          if (!result) {
            return;
          }
          this.inputValue = this.calValue;
          this.calValue = '';
          this.expressions = [];
          this.expressions.push(this.inputValue);
        })
        break;
      default:
        this.inputOperators(len, value);
        break;
    }
    this.formatInputValue();
  }

  /**
   * Enter numbers.
   *
   * @param value Enter numbers.
   */
  inputNumber(value: string) {
    if (CheckEmptyUtil.isEmpty(value)) {
      return;
    }
    let len = this.expressions.length;
    let last = len > 0 ? this.expressions[len - 1] : '';
    let secondLast = len > 1 ? this.expressions[len - CommonConstants.TWO] : undefined;
    if (!this.validateEnter(last, value)) {
      return;
    }
    if (!last) {
      this.expressions.push(value);
    } else if (!secondLast) {
      this.expressions[len - 1] += value;
    }
    if (secondLast && CalculateUtil.isSymbol(secondLast)) {
      this.expressions[len -1] += value;
    }
    if (secondLast && !CalculateUtil.isSymbol(secondLast)) {
      this.expressions.push(value);
    }
    this.formatInputValue();
    if (value !== CommonConstants.DOTS) {
      this.getResult();
    }
  }

  /**
   * Verify that you can enter.
   *
   * @param last Value of the last element.
   * @param value Current input value.
   * return Indicates whether to allow input.
   */
  validateEnter(last: string, value: string) {
    if (!last && value === CommonConstants.PERCENT_SIGN) {
      return false;
    }
    if ((last === CommonConstants.MIN) && (value === CommonConstants.PERCENT_SIGN)) {
      return false;
    }
    if (last.endsWith(CommonConstants.PERCENT_SIGN)) {
      return false;
    }
    if ((last.indexOf(CommonConstants.DOTS) !== -1) && (value === CommonConstants.DOTS)) {
      return false;
    }
    if ((last === '0') && (value !== CommonConstants.DOTS) &&
      (value !== CommonConstants.PERCENT_SIGN)) {
      return false;
    }
    return true;
  }

  /**
   * Delete Key Trigger.
   *
   * @param len Expression Length.
   */
  inputDelete(len: number) {
    if (len === 0) {
      return;
    }
    let last = this.expressions[len - 1];
    let lastLen = last.length;
    if (lastLen === 1) {
      this.expressions.pop();
      len = this.expressions.length;
    } else {
      this.expressions[len - 1] = last.slice(0, last.length - 1);
    }
    if (len === 0) {
      this.inputValue = '';
      this.calValue = '';
      return;
    }
    if (!CalculateUtil.isSymbol(this.expressions[len - 1])) {
      this.getResult();
    }
  }

  /**
   * Triggered when input is added, subtracted, multiplied, and divided.
   *
   * @param len Expression Length.
   * @param value Current Input Value.
   */
  inputOperators(len: number, value: string) {
    let last = len > 0 ? this.expressions[len - 1] : undefined;
    let secondLast = len > 1 ? this.expressions[len - CommonConstants.TWO] : undefined;
    if (!last && (value === Symbol.MIN)) {
      this.expressions.push(this.getSymbol(value));
      return;
    }
    if (!last) {
      return;
    }
    if (!CalculateUtil.isSymbol(last)) {
      this.expressions.push(this.getSymbol(value));
      return;
    }
    if ((value === Symbol.MIN) &&
      (last === CommonConstants.MIN || last === CommonConstants.ADD)) {
      this.expressions.pop();
      this.expressions.push(this.getSymbol(value));
      return;
    }
    if (!secondLast) {
      return;
    }
    if (value !== Symbol.MIN) {
      this.expressions.pop();
    }
    if (CalculateUtil.isSymbol(secondLast)) {
      this.expressions.pop();
    }
    this.expressions.push(this.getSymbol(value));
  }

  /**
   * Get Operator.
   *
   * @param value.
   * @return Operators.
   */
  getSymbol(value: string) {
    if (CheckEmptyUtil.isEmpty(value)) {
      return '';
    }
    let symbol = '';
    switch (value) {
      case Symbol.ADD:
        symbol = CommonConstants.ADD;
        break;
      case Symbol.MIN:
        symbol = CommonConstants.MIN;
        break;
      case Symbol.MUL:
        symbol = CommonConstants.MUL;
        break;
      case Symbol.DIV:
        symbol = CommonConstants.DIV;
        break;
      default:
        break;
    }
    return symbol;
  }

  /**
   * Make a deep copy of an expression.
   *
   * @return deep copy expression.
   */
  deepCopy(): Array<string> {
    let copyExpressions: Array<string> = Array.from(this.expressions);
    return copyExpressions;
  }

  /**
   * Obtaining Results.
   *
   * @return Whether the result is incorrect.
   */
  async getResult() {
    let calResult = CalculateUtil.parseExpression(this.deepCopy());
    if (calResult === 'NaN') {
      this.calValue = this.resourceToString($r('app.string.error'));
      return false;
    }
    this.calValue = calResult;
    return true;
  }

  /**
   * Number Formatting.
   *
   * @param value Formatting parameters.
   * @return Thousand percentile data.
   */
  resultFormat(value: string) {
    let reg = (value.indexOf('.') > -1) ? new RegExp("/(\d)(?=(\d{3})+\.)/g") : new RegExp("/(\d)(?=(?:\d{3})+$)/g");
    return value.replace(reg, '$1,');
  }

  /**
   * Convert a resource file to a string.
   *
   * @param resource Resource file.
   * @return Character string converted from the resource file.
   */
  resourceToString(resource: Resource): string {
    if (CheckEmptyUtil.isEmpty(resource)) {
      return '';
    }
    let result = '';
    try {
      result = getContext(this).resourceManager.getStringSync(resource.id);
    } catch (error) {
      Logger.error('[CalculateModel] getResourceString fail: ' + JSON.stringify(error))
    }
    return result;
  }

  /**
   * Thousands in the formatting result.
   */
  formatInputValue() {
    let deepExpressions: Array<string> = [];
    this.deepCopy().forEach((item: string, index: number) => {
      deepExpressions[index] = this.resultFormat(item);
    });
    this.inputValue = deepExpressions.join('');
  }
}