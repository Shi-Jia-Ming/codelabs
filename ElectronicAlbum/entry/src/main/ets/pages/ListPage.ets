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

import router from '@ohos.router';
import Constants from '../common/constants/Constants';
import Logger from '../common/utils/Logger';

@Entry
@Component
struct ListPage {
  photoArr: Array<Resource> = router.getParams()[`${Constants.PARAM_PHOTO_ARR_KEY}`];
  @State selectedIndex: SubscribedAbstractProperty<number> = AppStorage.SetAndLink(`${Constants.SELECTED_INDEX_KEY}`, 0);

  build() {
    Navigation() {
      Grid() {
        ForEach(this.photoArr, (img: Resource, index: number) => {
          GridItem() {
            Image(img)
              .height(Constants.FULL_PERCENT)
              .width(Constants.FULL_PERCENT)
              .objectFit(ImageFit.Cover)
              .onClick(() => {
                this.selectedIndex.set(index);
                router.pushUrl({
                  url: Constants.URL_DETAIL_LIST_PAGE,
                  params: {
                    photoArr: this.photoArr,
                  }
                }).catch((error) => {
                  Logger.error(Constants.TAG_LIST_PAGE, JSON.stringify(error));
                });
              })
          }
          .width(Constants.FULL_PERCENT)
          .aspectRatio(1)
        }, item => JSON.stringify(item))
      }
      .columnsTemplate(Constants.GRID_COLUMNS_TEMPLATE)
      .rowsGap(Constants.LIST_ITEM_SPACE)
      .columnsGap(Constants.LIST_ITEM_SPACE)
      .layoutWeight(1)
    }
    .title(Constants.PAGE_TITLE)
    .hideBackButton(false)
    .titleMode(NavigationTitleMode.Mini)
  }
}