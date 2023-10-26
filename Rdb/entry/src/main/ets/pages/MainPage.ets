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

import AccountTable from '../common/database/tables/AccountTable';
import AccountData from '../viewmodel/AccountData';
import CommonConstants from '../common/constants/CommonConstants';
import { DialogComponent } from '../view/DialogComponent';
import { ImageList } from '../viewmodel/AccountList';
import Logger from '../common/utils/Logger';

@Entry
@Component
struct MainPage {
  @State accounts: Array<AccountData> = [];
  @State searchText: string = '';
  @State isEdit: boolean = false;
  @State isInsert: boolean = false;
  @State newAccount: AccountData = { id: 0, accountType: 0, typeText: '', amount: 0 };
  @State index: number = -1;
  private AccountTable = new AccountTable(() => {});
  private deleteList: Array<AccountData> = [];
  searchController: SearchController = new SearchController();
  dialogController: CustomDialogController = new CustomDialogController({
    builder: DialogComponent({
      isInsert: $isInsert,
      newAccount: $newAccount,
      confirm: (isInsert: boolean, newAccount: AccountData) => this.accept(isInsert, newAccount)
    }),
    customStyle: true,
    alignment: DialogAlignment.Bottom
  });

  accept(isInsert: boolean, newAccount: AccountData): void {
    if (isInsert) {
      Logger.info(`${CommonConstants.INDEX_TAG}`, `The account inserted is:  ${JSON.stringify(newAccount)}`);
      this.AccountTable.insertData(newAccount, (id: number) => {
        newAccount.id = id;
        this.accounts.push(newAccount);
      });
    } else {
      this.AccountTable.updateData(newAccount, () => {
      });
      let list = this.accounts;
      this.accounts = [];
      list[this.index] = newAccount;
      this.accounts = list;
      this.index = -1;
    }
  }

  aboutToAppear() {
    this.AccountTable.getRdbStore(() => {
      this.AccountTable.query(0, (result: AccountData[]) => {
        this.accounts = result;
      }, true);
    });
  }

  selectListItem(item: AccountData) {
    this.isInsert = false;
    this.index = this.accounts.indexOf(item);
    this.newAccount = {
      id: item.id,
      accountType: item.accountType,
      typeText: item.typeText,
      amount: item.amount
    };
  }

  deleteListItem() {
    for (let i = 0; i < this.deleteList.length; i++) {
      let index = this.accounts.indexOf(this.deleteList[i]);
      this.accounts.splice(index, 1);
      this.AccountTable.deleteData(this.deleteList[i], () => {
      });
    }
    this.deleteList = [];
    this.isEdit = false;
  }

  build() {
    Stack() {
      Column() {
        Row() {
          Text($r('app.string.MainAbility_label'))
            .height($r('app.float.component_size_SP'))
            .fontSize($r('app.float.font_size_L'))
            .margin({ left: $r('app.float.font_size_L') })

          Image($rawfile('ic_public_edit.svg'))
            .width($r('app.float.component_size_S'))
            .aspectRatio(CommonConstants.FULL_SIZE)
            .margin({ right: $r('app.float.font_size_L') })
            .onClick(() => {
              this.isEdit = true;
            })
        }
        .width(CommonConstants.FULL_WIDTH)
        .justifyContent(FlexAlign.SpaceBetween)
        .margin({ top: $r('app.float.edge_size_M'), bottom: $r('app.float.edge_size_MM') })

        Row() {
          Search({
            value: this.searchText,
            placeholder: CommonConstants.SEARCH_TEXT,
            controller: this.searchController
          })
            .width(CommonConstants.FULL_WIDTH)
            .borderRadius($r('app.float.radius_size_M'))
            .borderWidth($r('app.float.border_size_S'))
            .borderColor($r('app.color.border_color'))
            .placeholderFont({ size: $r('app.float.font_size_M') })
            .textFont({ size: $r('app.float.font_size_M') })
            .backgroundColor(Color.White)
            .onChange((searchValue: string) => {
              this.searchText = searchValue;
            })
            .onSubmit((searchValue: string) => {
              if (searchValue === '') {
                this.AccountTable.query(0, (result: AccountData[]) => {
                  this.accounts = result;
                }, true);
              } else {
                this.AccountTable.query(Number(searchValue), (result: AccountData[]) => {
                  this.accounts = result;
                }, false);
              }
            })
        }
        .width(CommonConstants.FULL_WIDTH)
        .padding({ left: $r('app.float.edge_size_M'), right: $r('app.float.edge_size_M') })
        .margin({ top: $r('app.float.edge_size_S'), bottom: $r('app.float.edge_size_S') })

        Row() {
          List({ space: CommonConstants.FULL_SIZE }) {
            ForEach(this.accounts, (item: AccountData) => {
              ListItem() {
                Row() {
                  Image(ImageList[item.typeText])
                    .width($r('app.float.component_size_M'))
                    .aspectRatio(CommonConstants.FULL_SIZE)
                    .margin({ right: $r('app.float.edge_size_MP') })

                  Text(item.typeText)
                    .height($r('app.float.component_size_SM'))
                    .fontSize($r('app.float.font_size_M'))

                  Blank()
                    .layoutWeight(1)

                  if (!this.isEdit) {
                    Text(item.accountType === 0 ? '-' + item.amount.toString() : '+' + item.amount.toString())
                      .fontSize($r('app.float.font_size_M'))
                      .fontColor(item.accountType === 0 ? $r('app.color.pay_color') : $r('app.color.main_color'))
                      .align(Alignment.End)
                      .flexGrow(CommonConstants.FULL_SIZE)
                  } else {
                    Row() {
                      Toggle({ type: ToggleType.Checkbox })
                        .onChange((isOn) => {
                          if (isOn) {
                            this.deleteList.push(item);
                          } else {
                            let index = this.deleteList.indexOf(item);
                            this.deleteList.splice(index, 1);
                          }
                        })
                    }
                    .align(Alignment.End)
                    .flexGrow(CommonConstants.FULL_SIZE)
                    .justifyContent(FlexAlign.End)
                  }

                }
                .width(CommonConstants.FULL_WIDTH)
                .padding({ left: $r('app.float.edge_size_M'), right: $r('app.float.edge_size_M') })
              }
              .width(CommonConstants.FULL_WIDTH)
              .height($r('app.float.component_size_LM'))
              .onClick(() => {
                this.selectListItem(item);
                this.dialogController.open();
              })
            })
          }
          .width(CommonConstants.FULL_WIDTH)
          .borderRadius($r('app.float.radius_size_L'))
          .backgroundColor(Color.White)
        }
        .width(CommonConstants.FULL_WIDTH)
        .padding({ left: $r('app.float.edge_size_M'), right: $r('app.float.edge_size_M') })
        .margin({ top: $r('app.float.edge_size_SM') })

      }
      .width(CommonConstants.FULL_WIDTH)
      .height(CommonConstants.FULL_HEIGHT)

      if (!this.isEdit) {
        Button() {
          Image($rawfile('add.png'))
        }
        .width($r('app.float.component_size_MP'))
        .height($r('app.float.component_size_MP'))
        .position({ x: CommonConstants.EDIT_POSITION_X, y: CommonConstants.EDIT_POSITION_Y })
        .onClick(() => {
          this.isInsert = true;
          this.newAccount = { id: 0, accountType: 0, typeText: '', amount: 0 };
          this.dialogController.open();
        })
      }

      if (this.isEdit) {
        Button() {
          Image($rawfile('delete.png'))
        }
        .width($r('app.float.component_size_MP'))
        .height($r('app.float.component_size_MP'))
        .backgroundColor($r('app.color.background_color'))
        .markAnchor({ x: $r('app.float.mark_anchor'), y: CommonConstants.MINIMUM_SIZE })
        .position({ x: CommonConstants.DELETE_POSITION_X, y: CommonConstants.DELETE_POSITION_Y })
        .onClick(() => {
          this.deleteListItem();
        })
      }
    }
    .width(CommonConstants.FULL_WIDTH)
    .height(CommonConstants.FULL_HEIGHT)
    .backgroundColor($r('app.color.background_color'))
  }
}