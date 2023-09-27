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
import { fileSelect, fileUpload } from '../common/utils/FileUtil';
import { NewsFile, NewsData } from '../common/bean/NewsData';
import NewsViewModel from '../viewmodel/NewsViewModel';
import { showToast } from '../common/utils/ToastUtil';
import UploadingLayout from '../view/UploadingLayout';
import ResponseResult from '../common/bean/ResponseResult';
import { GlobalContext } from '../common/bean/GlobalContext';

/**
 * NewsEditPage.
 */
@Entry
@Component
struct NewsEditPage {
  title: string = '';
  content: string = '';
  @State imageUri: string = '';
  @State isUploading: boolean = false;

  selectImage() {
    fileSelect().then((uri: string) => {
      this.imageUri = uri || '';
    });
  }

  uploadNewsData() {
    if (this.title === '') {
      showToast($r('app.string.prompt_no_title'));
      return;
    }
    if (this.content === '') {
      showToast($r('app.string.prompt_no_content'));
      return;
    }
    if (this.imageUri === '') {
      showToast($r('app.string.prompt_no_file'));
      return;
    }
    this.isUploading = true;
    let serverData = fileUpload(getContext(this), this.imageUri);
    serverData.then((data: ResponseResult) => {
      let imageUrl = data.data;
      let newsFile = new NewsFile();
      newsFile.id = 0;
      newsFile.url = imageUrl;
      newsFile.type = 0;
      newsFile.newsId = 0;
      let newsData: NewsData = new NewsData();
      newsData.title = this.title;
      newsData.content = this.content;
      newsData.imagesUrl = [newsFile];
      NewsViewModel.uploadNews(newsData).then(() => {
        this.isUploading = false;
        GlobalContext.getContext().setObject('isBackRouter', true);
        router.back();
      }).catch(() => {
        this.isUploading = false;
        showToast($r('app.string.upload_error_message'));
      });
    }).catch(() => {
      this.isUploading = false;
      showToast($r('app.string.upload_error_message'));
    });
  }

  build() {
    Stack() {
      Navigation() {
        Column() {
          Column() {
            TextInput({ placeholder: $r('app.string.title_default_text') })
              .fontSize($r('app.float.title_font'))
              .placeholderFont({ size: $r('app.float.title_font') })
              .margin({ top: $r('app.float.common_padding') })
              .fontColor($r('app.color.title_color'))
              .backgroundColor(Color.White)
              .onChange((value: string) => {
                this.title = value;
              })
              .width(Constants.FULL_PERCENT)
              .height($r('app.float.input_height'))
            Divider()
              .opacity($r('app.float.divider_opacity'))
              .color($r('app.color.title_color'))
              .width(Constants.DIVIDER_WIDTH)
            TextArea({ placeholder: $r('app.string.content_default_text') })
              .placeholderFont({ size: $r('app.float.title_font') })
              .fontColor($r('app.color.title_color'))
              .height($r('app.float.area_height'))
              .fontSize($r('app.float.title_font'))
              .margin({ top: $r('app.float.normal_padding') })
              .backgroundColor(Color.White)
              .onChange((value: string) => {
                this.content = value;
              })
            Scroll() {
              Row() {
                Image(this.imageUri ? this.imageUri : $r('app.media.ic_add_pic'))
                  .width($r('app.float.img_size'))
                  .height($r('app.float.img_size'))
                  .objectFit(ImageFit.Cover)
                  .onClick(() => this.selectImage())
              }
              .padding($r('app.float.common_padding'))
            }
            .width(Constants.FULL_PERCENT)
            .scrollable(ScrollDirection.Horizontal)
            .align(Alignment.Start)
          }
          .borderRadius($r('app.float.edit_view_radius'))
          .backgroundColor(Color.White)
          .width(Constants.FULL_PERCENT)

          Button($r('app.string.release_btn'))
            .fontSize($r('app.float.title_font'))
            .height($r('app.float.release_btn_height'))
            .width($r('app.float.release_btn_width'))
            .margin({ bottom: $r('app.float.common_padding') })
            .onClick(() => this.uploadNewsData())
        }
        .padding({
          left: $r('app.float.common_padding'),
          right: $r('app.float.common_padding'),
          bottom: $r('app.float.common_padding')
        })
        .height(Constants.FULL_PERCENT)
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .height(Constants.FULL_PERCENT)
      .title(Constants.RELEASE_TITLE)
      .titleMode(NavigationTitleMode.Mini)
      .backgroundColor($r('app.color.listColor'))

      if (this.isUploading) {
        UploadingLayout()
      }
    }
  }
}

