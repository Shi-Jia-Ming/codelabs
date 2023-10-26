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

import image from '@ohos.multimedia.image';
import { IconStatus } from '../viewmodel/IconListViewModel';
import AdjustContentView from '../view/AdjustContentView';
import { cropIconChangeList, menuIconList } from '../viewmodel/IconListViewModel';
import Logger from '../utils/LoggerUtil';
import { RotateType, CropType, MainTabId } from '../viewmodel/OptionViewModel';
import { square, banner, rectangle } from '../utils/CropUtil';
import { encode } from '../utils/EncodeUtil';
import getPixelMap from '../utils/DecodeUtil';
import { CommonConstants } from '../common/constant/CommonConstants';

const TAG: string = 'imageEdit';

@Entry
@Component
struct HomePage {
  @Builder NavigationTitle() {
    Row() {
      Text($r('app.string.image_edit'))
        .fontColor(Color.White)
        .fontSize($r('app.float.title_font_size'))
    }
  }

  @Builder TabBuilderMenu(index: number, name: string | Resource) {
    Column() {
      Image(this.currentIndex === index ? this.menuIconChangeList[index]?.chosen :
        this.menuIconChangeList[index]?.normal)
        .width(CommonConstants.TAB_MENU_WIDTH)
        .height(CommonConstants.TAB_MENU_WIDTH)

      Text(name)
        .fontColor(this.currentIndex === index ? Color.Blue : Color.White)
        .fontSize($r('app.float.category_font_size'))
        .margin({ top: $r('app.float.category_margin_top') })
    }
    .width(CommonConstants.LAYOUT_FULL_SCREEN)
  }

  pageContent?: Object;
  @State currentIndex: number = 0;
  @State currentCropIndex: number = 0;
  @Provide pixelMap?: image.PixelMap = undefined;
  @State tempPixelMap?: image.PixelMap = undefined;
  originalPixelMap?: PixelMap;
  @Provide imageInfo: image.ImageInfo = {size: { height: 0, width: 0 } , density: 0};
  @Provide currentAdjustData: Array<number> = CommonConstants.ADJUST_SLIDER_VALUE.map((item: number) => item);
  menuIconChangeList = menuIconList;
  cropIconChange: Array<IconStatus> = cropIconChangeList;
  @Provide isPixelMapChange: boolean = false;

  async cropImage(proportion: CropType) {
     if (!this.pixelMap) {
       return;
     }
    const imageInfo = await this.pixelMap.getImageInfo();
    const size = imageInfo.size;
    const imageWidth = size?.width;
    const imageHeight = size?.height;
    switch (proportion) {
      case CropType.ORIGINAL_IMAGE:
        this.pixelInit();
        break;
      case CropType.SQUARE:
        if (this.pixelMap) {
          square(this.pixelMap, imageWidth, imageHeight).then(() => {
            this.flushPixelMapNew();
          });
        }
        break;
      case CropType.BANNER:
        if (this.pixelMap) {
          banner(this.pixelMap, imageWidth, imageHeight).then(() => {
            this.flushPixelMapNew();
          });
        }
        break;
      case CropType.RECTANGLE:
         if (this.pixelMap) {
           rectangle(this.pixelMap, imageWidth, imageHeight).then(() => {
             this.flushPixelMapNew();
           });
         }
        break;
      default:
        break;
    }
  }

  rotateImage(rotateType: RotateType) {
    if (rotateType === RotateType.CLOCKWISE) {
      if (!this.pixelMap) {
        return;
      }
      try {
        this.pixelMap.rotate(CommonConstants.CLOCK_WISE)
          .then(() => {
            this.flushPixelMapNew();
          })
      } catch (error) {
        Logger.error(TAG, `there is a error in rotate process with ${error?.code}`);
      }
    }
    if (rotateType === RotateType.ANTI_CLOCK) {
      if (!this.pixelMap) {
        return;
      }
      try {
        this.pixelMap.rotate(CommonConstants.ANTI_CLOCK)
          .then(() => {
            this.flushPixelMapNew();
          })
      } catch (error) {
        Logger.error(TAG, `there is a error in rotate process with ${error?.code}`);
      }
    }
  }

  flushPixelMap() {
    const temp = this.pixelMap;
    this.pixelMap = undefined;
    this.pixelMap = temp;
  }

  flushPixelMapNew() {
    this.isPixelMapChange = !this.isPixelMapChange;
  }

  pixelInit() {
    if (this.pageContent !== undefined){
      getPixelMap(this.pageContent).then((pixelMap?: image.PixelMap) => {
        if (pixelMap) {
          this.isPixelMapChange = !this.isPixelMapChange;
          this.pixelMap = pixelMap;
        }
        this.currentCropIndex = 0;
        this.currentAdjustData = CommonConstants.ADJUST_SLIDER_VALUE.map((item: number) => item);
      })
    }
  }

  aboutToAppear() {
    this.pageContent = this;
    this.pixelInit();
  }

  @Builder TitleNavigation() {
    Row({ space: CommonConstants.TITLE_SPACE }) {
      Button() {
        Image($r('app.media.ic_reset'))
          .width($r('app.float.title_image_width'))
          .height($r('app.float.title_image_height'))
      }
      .height(CommonConstants.LAYOUT_FULL_SCREEN)
      .type(ButtonType.Normal)
      .aspectRatio(1)
      .backgroundColor(Color.Transparent)
      .onClick(() => {
        this.pixelInit();
      })

      Button() {
        Image($r('app.media.ic_save'))
          .width($r('app.float.title_image_width'))
          .height($r('app.float.title_image_height'))
      }
      .height(CommonConstants.LAYOUT_FULL_SCREEN)
      .type(ButtonType.Normal)
      .aspectRatio(1)
      .backgroundColor(Color.Transparent)
      .onClick(() => {
        AlertDialog.show({
          title: $r('app.string.save_image'),
          message: $r('app.string.confirm_save'),
          alignment: DialogAlignment.Center,
          primaryButton: {
            value: $r('app.string.save'),
            action: () => {
              if (this.pixelMap) {
                encode(this, this.pixelMap);
              }
            }
          },
          secondaryButton: {
            value: $r('app.string.cancel'),
            action: () => {
              Logger.info(TAG, `cancel`);
            }
          }
        })
      })
    }
  }

  build() {
    Navigation() {
      Stack() {
        Column() {
          Column() {
            if (this.isPixelMapChange) {
              Image(this.pixelMap ? this.pixelMap : '')
                .objectFit(ImageFit.Contain)
            } else {
              Image(this.pixelMap ? this.pixelMap : '')
                .objectFit(ImageFit.Contain)
            }
          }
          .width(CommonConstants.LAYOUT_FULL_SCREEN)
          .height(CommonConstants.IMAGE_SHOW_HEIGHT)

          Column() {
            Tabs({ barPosition: BarPosition.End }) {
              TabContent() {
                Row() {
                  ForEach(this.cropIconChange, (item: IconStatus, index?: number | undefined) => {
                    Image(this.currentCropIndex === index ? item?.chosen : item?.normal)
                      .width($r('app.float.crop_image_width'))
                      .height($r('app.float.crop_image_height'))
                      .onClick(() => {
                        if (index) {
                          this.currentCropIndex = index;
                          this.cropImage(index);
                        }
                      })
                  }, (item: IconStatus) => JSON.stringify(item))
                }
                .width(CommonConstants.LAYOUT_FULL_SCREEN)
                .height(CommonConstants.LAYOUT_FULL_SCREEN)
                .justifyContent(FlexAlign.SpaceAround)
              }
              .tabBar(this.TabBuilderMenu(MainTabId.CROP, $r('app.string.crop')))

              TabContent() {
                Row() {
                  Image($r('app.media.ic_clockwise'))
                    .width($r('app.float.rotate_image_width'))
                    .height($r('app.float.rotate_image_height'))
                    .margin({ right: CommonConstants.EDIT_PAGE_HEIGHT })
                    .onClick(() => {
                      this.rotateImage(RotateType.CLOCKWISE);
                    })
                  Image($r('app.media.ic_anti_clockwise'))
                    .width($r('app.float.rotate_image_width'))
                    .height($r('app.float.rotate_image_height'))
                    .onClick(async () => {
                      this.rotateImage(RotateType.ANTI_CLOCK);
                    })
                }
                .justifyContent(FlexAlign.Center)
                .width(CommonConstants.LAYOUT_FULL_SCREEN)
                .height(CommonConstants.LAYOUT_FULL_SCREEN)
              }
              .tabBar(this.TabBuilderMenu(MainTabId.ROTATE, $r('app.string.rotate')))

              TabContent() {
                AdjustContentView()
              }
              .tabBar(this.TabBuilderMenu(MainTabId.ADJUST, $r('app.string.adjust')))
            }
            .scrollable(false)
            .onChange((index: number) => {
              this.currentIndex = index;
            })
          }
          .width(CommonConstants.LAYOUT_FULL_SCREEN)
          .height(CommonConstants.EDIT_PAGE_HEIGHT)
          .backgroundColor(Color.Black)
        }
        .width(CommonConstants.LAYOUT_FULL_SCREEN)
        .height(CommonConstants.LAYOUT_FULL_SCREEN)
        .backgroundColor(Color.Black)
      }
    }
    .titleMode(NavigationTitleMode.Mini)
    .backgroundColor(Color.Black)
    .title(this.NavigationTitle())
    .hideBackButton(true)
    .menus(this.TitleNavigation())
  }
}