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
 * Common constants for all features.
 */
export class CommonConstants {
  /**
   * Full percent.
   */
  static readonly FULL_PERCENT: string = '100%';

  /**
   * Operator Collection.
   */
  static readonly OPERATORS: string = '+-×÷';

  /**
   * Operators with high precedence.
   */
  static readonly OPERATORS_PRIORITY: string = '×÷';

  /**
   * Addition.
   */
  static readonly ADD: string = '+';

  /**
   * Minus.
   */
  static readonly MIN: string = '-';

  /**
   * Multiplication.
   */
  static readonly MUL: string = '×';

  /**
   * Division.
   */
  static readonly DIV: string = '÷';

  /**
   * Percent sign.
   */
  static readonly PERCENT_SIGN: string = '%';

  /**
   * Decimal point.
   */
  static readonly DOTS: string = '.';

  /**
   * Number two.
   */
  static readonly TWO: number = 2;

  /**
   * Digit ten.
   */
  static readonly TEN: number = 10;

  /**
   * One hundred.
   */
  static readonly ONE_HUNDRED: string = '100';

  /**
   * Display Maximum Length of Large Fonts.
   */
  static readonly INPUT_LENGTH_MAX: number = 9;

  /**
   * Subscript is two.
   */
  static readonly INDEX_TWO: number = 2;

  /**
   * Maximum length of a single digit.
   */
  static readonly NUM_MAX_LEN: number = 16;

  /**
   * Letter e.
   */
  static readonly E: string = 'e';

  /**
   * String Zero.
   */
  static readonly ZERO: string = '0'

  /**
   * zero point.
   */
  static readonly ZERO_DOTS: string = '0.'
}

/**
 * Symbol value.
 */
export enum Symbol {
  ADD = 'add',
  MIN = 'min',
  MUL = 'mul',
  DIV = 'div',
  CLEAN = 'clean',
  DEL = 'del',
  EQU = 'equ'
}

/**
 * Operator Precedence Enumeration.
 */
export enum Priority {
  HIGH = 2,
  MEDIUM = 1,
  LOW = 0
}

/**
 * Enumerated value: addition, subtraction, multiplication, and division.
 */
export enum SymbolicEnumeration {
  ADD = '+',
  MIN = '-',
  MUL = '×',
  DIV = '÷'
}
