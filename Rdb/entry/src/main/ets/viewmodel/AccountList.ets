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

import AccountItem from './AccountItem';

export const PayList: Array<AccountItem> = [
  {
    icon: $rawfile('foods.png'),
    iconSelected: $rawfile('foods_selected.png'),
    accountType: 0,
    typeText: '吃饭'
  },
  {
    icon: $rawfile('snacks.png'),
    iconSelected: $rawfile('snacks_selected.png'),
    accountType: 0,
    typeText: '零食'
  },
  {
    icon: $rawfile('fuel.png'),
    iconSelected: $rawfile('fuel_selected.png'),
    accountType: 0,
    typeText: '汽车加油'
  },
  {
    icon: $rawfile('travel.png'),
    iconSelected: $rawfile('travel_selected.png'),
    accountType: 0,
    typeText: '旅游'
  },
  {
    icon: $rawfile('games.png'),
    iconSelected: $rawfile('games_selected.png'),
    accountType: 0,
    typeText: '娱乐'
  },
  {
    icon: $rawfile('pets.png'),
    iconSelected: $rawfile('pets_selected.png'),
    accountType: 0,
    typeText: '宠物'
  }
]

export const EarnList: Array<AccountItem> = [
  {
    icon: $rawfile('income.png'),
    iconSelected: $rawfile('income_selected.png'),
    accountType: 1,
    typeText: '工作收入'
  },
  {
    icon: $rawfile('invest.png'),
    iconSelected: $rawfile('invest_selected.png'),
    accountType: 1,
    typeText: '投资'
  }
]

export const ImageList: Record<string,Resource> = {
  '吃饭': $rawfile('foods.png'),
  '零食': $rawfile('snacks.png'),
  '汽车加油': $rawfile('fuel.png'),
  '旅游': $rawfile('travel.png'),
  '娱乐': $rawfile('games.png'),
  '宠物': $rawfile('pets.png'),
  '工作收入': $rawfile('income.png'),
  '投资': $rawfile('invest.png')
}