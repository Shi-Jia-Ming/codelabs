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

import { BusinessError } from '@ohos.base';
import fs from '@ohos.file.fs';
import image from '@ohos.multimedia.image';
import promptAction from '@ohos.promptAction';
import AppContext from '@ohos.app.ability.common';
import picker from '@ohos.file.picker';
import Logger from '../common/utils/Logger';
import { CommonConstants } from '../common/constants/CommonConstants';
import { AppendixBean, FileType } from '../common/bean/AppendixBean';
import { imageIndex } from '../viewmodel/AppendixIndexModel';

@Entry
@Component
struct MailHomePage {
  @StorageLink('recipient') recipient: string = '';
  @StorageLink('sender') sender: string = '';
  @StorageLink('subject') subject: string = '';
  @StorageLink('emailContent') emailContent: string = '';
  @StorageLink('isContinuation') isContinuation: string = CommonConstants.NO_CONTINUATION;
  @State crossEndPicture: PixelMap | undefined = undefined;
  @StorageLink('appendix') appendix: Array<AppendixBean> = [];
  private appContext: AppContext.UIAbilityContext = getContext(this) as AppContext.UIAbilityContext;
  private distributedPath: string = CommonConstants.MAIL_DISTRIBUTED_PATH;

  aboutToAppear() {
    if ((this.isContinuation === CommonConstants.CAN_CONTINUATION) && (this.appendix.length >= 1)) {
      this.readFile();
    }
  }

  build() {
    Column() {
      Navigation() {
        this.NavigationTitle()
        this.EmailContent()
      }
      .toolBar(this.NavigationToolbar())
      .hideTitleBar(true)
    }
    .width(CommonConstants.PERCENTAGE_MAX)
    .height(CommonConstants.PERCENTAGE_MAX)
    .backgroundColor($r('app.color.input_textarea_background'))
  }

  @Builder AddAppendix() {
    Menu() {
      MenuItem({startIcon: $r('app.media.ic_files_grid_txt'), content: $r('app.string.add_txt_file')})
        .onClick(() => {
          this.documentSelect(FileType.TXT);
        })

      MenuItem({startIcon: $r('app.media.ic_files_documents'), content: $r('app.string.add_doc_file')})
        .onClick(() => {
          this.documentSelect(FileType.DOC);
        })

      MenuItem({startIcon: $r('app.media.ic_files_pdf'), content: $r('app.string.add_pdf_file')})
        .onClick(() => {
          this.documentSelect(FileType.PDF);
        })

      MenuItem({startIcon: $r('app.media.ic_files_unknown'), content: $r('app.string.add_other_file')})
        .enabled(false)
    }
  }

  /**
   * Top navigation title bar.
   */
  @Builder NavigationTitle() {
    Row() {
      Row() {
        Image($r('app.media.ic_public_back'))
          .width($r('app.float.common_image_size'))
          .height($r('app.float.common_image_size'))
          .margin({
            right: $r('app.float.navigation_image_margin')
          })
          .onClick(() => {
            this.appContext.terminateSelf();
          })
        Text($r('app.string.new_email_text'))
          .fontColor($r('app.color.text_cursor_color'))
          .fontSize($r('app.float.email_title_size'))
          .fontWeight(FontWeight.Bold)
      }

      Image($r('app.media.ic_send'))
        .width($r('app.float.common_image_size'))
        .height($r('app.float.common_image_size'))
    }
    .width(CommonConstants.PERCENTAGE_MAX)
    .height($r('app.float.navigation_height'))
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({
      left: $r('app.float.common_padding_margin'),
      right: $r('app.float.common_padding_margin')
    })
  }

  /**
   * Bottom toolbar area.
   */
  @Builder NavigationToolbar() {
    Row({ space: CommonConstants.BOTTOM_IMAGE_SPACE }) {
      Image($r('app.media.ic_files_new_folder'))
        .width($r('app.float.common_image_size'))
        .height($r('app.float.common_image_size'))
        .bindMenu(this.AddAppendix)
      Image($r('app.media.ic_photo'))
        .enabled(false)
        .width($r('app.float.common_image_size'))
        .height($r('app.float.common_image_size'))
      Image($r('app.media.ic_at'))
        .width($r('app.float.common_image_size'))
        .height($r('app.float.common_image_size'))
      Image($r('app.media.ic_upload'))
        .width($r('app.float.common_image_size'))
        .height($r('app.float.common_image_size'))
    }
    .width(CommonConstants.PERCENTAGE_MAX)
    .height($r('app.float.navigation_height'))
    .padding({
      left: $r('app.float.common_padding_margin'),
      right: $r('app.float.common_padding_margin')
    })
    .border({
      width: {
        top: $r('app.float.border_divider_width')
      },
      color: $r('app.color.border_divider_color')
    })
  }

  @Builder EmailContent() {
    Column() {
      // Recipient
      Row() {
        Text($r('app.string.recipient_text'))
          .fontColor($r('app.color.content_text_color'))
          .fontSize($r('app.float.text_font_size'))
          .focusable(true)
        TextInput({ text: this.recipient })
          .type(InputType.Email)
          .width(CommonConstants.PERCENTAGE_MAX)
          .backgroundColor($r('app.color.input_textarea_background'))
          .caretColor($r('app.color.text_cursor_color'))
          .onChange((recipientName: string) => {
            this.recipient = recipientName;
            AppStorage.Set('recipient', recipientName);
          })
      }
      .width(CommonConstants.PERCENTAGE_MAX)
      .height($r('app.float.content_box_height'))
      .border({
        width: { bottom: $r('app.float.border_divider_width') },
        color: $r('app.color.border_divider_color')
      })

      // Sender
      Row() {
        Text($r('app.string.sender_text'))
          .fontColor($r('app.color.content_text_color'))
          .fontSize($r('app.float.text_font_size'))
        TextInput({ text: this.sender })
          .type(InputType.Email)
          .width(CommonConstants.PERCENTAGE_MAX)
          .backgroundColor($r('app.color.input_textarea_background'))
          .caretColor($r('app.color.text_cursor_color'))
          .onChange((senderName: string) => {
            this.sender = senderName;
            AppStorage.Set('sender', senderName);
          })
      }
      .width(CommonConstants.PERCENTAGE_MAX)
      .height($r('app.float.content_box_height'))
      .border({
        width: { bottom: $r('app.float.border_divider_width') },
        color: $r('app.color.border_divider_color')
      })

      // Subject
      Row() {
        Text($r('app.string.subject_text'))
          .fontColor($r('app.color.content_text_color'))
          .fontSize($r('app.float.text_font_size'))
        TextInput({ text: this.subject })
          .width(CommonConstants.PERCENTAGE_MAX)
          .backgroundColor($r('app.color.input_textarea_background'))
          .caretColor($r('app.color.text_cursor_color'))
          .onChange((subjectInfo: string) => {
            this.subject = subjectInfo;
            AppStorage.Set('subject', subjectInfo);
          })
      }
      .width(CommonConstants.PERCENTAGE_MAX)
      .height($r('app.float.content_box_height'))
      .border({
        width: { bottom: $r('app.float.border_divider_width') },
        color: $r('app.color.border_divider_color')
      })

      // Appendix
      if (this.appendix.length > 0) {
        Row() {
          Text($r('app.string.appendix_text'))
            .fontColor($r('app.color.content_text_color'))
            .fontSize($r('app.float.text_font_size'))
          List({ space: CommonConstants.APPENDIX_LIST_SPACE }) {
            ForEach(this.appendix, (item: AppendixBean) => {
              ListItem() {
                Row() {
                  Image(imageIndex[item.iconIndex].icon)
                    .width($r('app.float.appendix_list_item_width'))
                    .aspectRatio(1)
                    .margin({ right: $r('app.float.appendix_list_item_margin_right')})
                  Text(item.fileName)
                    .fontSize($r('app.float.appendix_file_name_font_size'))
                }
              }
            })
          }
          .listDirection(Axis.Horizontal)
          .alignListItem(ListItemAlign.Center)
          .divider({
            strokeWidth: 1,
            color: Color.Grey,
            startMargin: CommonConstants.APPENDIX_LIST_START_MARGIN,
            endMargin: CommonConstants.APPENDIX_LIST_END_MARGIN
          })
          .scrollBar(BarState.Off)
        }
        .width(CommonConstants.PERCENTAGE_MAX)
        .height($r('app.float.content_box_height'))
        .border({
          width: { bottom: $r('app.float.border_divider_width') },
          color: $r('app.color.border_divider_color')
        })
      }

      // Message content area.
      Row() {
        TextArea({ text: this.emailContent })
          .height($r('app.float.text_area_height'))
          .backgroundColor($r('app.color.input_textarea_background'))
          .caretColor($r('app.color.text_cursor_color'))
          .onChange((emailContent: string) => {
            this.emailContent = emailContent;
            AppStorage.Set('emailContent', emailContent);
          })
      }
      .width(CommonConstants.PERCENTAGE_MAX)
      .margin({
        top: $r('app.float.text_image_margin'),
        bottom: $r('app.float.text_image_margin')
      })

      // Image display area.
      Row() {
        if (this.crossEndPicture) {
          Image(this.crossEndPicture)
            .height($r('app.float.photo_picture_height'))
            .objectFit(ImageFit.ScaleDown)
            .borderRadius($r('app.float.photo_picture_radius'))
        }
      }
      .width(CommonConstants.PERCENTAGE_MAX)
      .justifyContent(FlexAlign.Start)
    }
    .width(CommonConstants.PERCENTAGE_MAX)
    .height(CommonConstants.PERCENTAGE_MAX)
    .padding({
      left: $r('app.float.common_padding_margin'),
      right: $r('app.float.common_padding_margin')
    })
    .margin({ top: $r('app.float.email_content_margin') })
  }

  /**
   * Rendering pictures.
   *
   * @param buffer Returned image stream of cross-end photographing.
   */
  createPicture(buffer: ArrayBuffer): void {
    let imageSource = image.createImageSource(buffer);
    imageSource.createPixelMap().then((pixelMap) => {
      this.crossEndPicture = pixelMap;
    })
  }

  /**
   * Reading image streams from distributed file systems.
   */
  readFile(): void {
    this.appendix.forEach((item: AppendixBean) => {
      let filePath: string = this.distributedPath + item.fileName;
      let savePath: string = getContext().filesDir + '/' + item.fileName;
      let saveFile = fs.openSync(savePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let file = fs.openSync(filePath, fs.OpenMode.READ_WRITE);
      let buf: ArrayBuffer = new ArrayBuffer(CommonConstants.FILE_BUFFER_SIZE);
      let readSize = 0;
      let readLen = fs.readSync(file.fd, buf, { offset: readSize });
      while (readLen > 0) {
        readSize += readLen;
        fs.writeSync(saveFile.fd, buf);
        readLen = fs.readSync(file.fd, buf, { offset: readSize });
      }
      fs.closeSync(file);
      fs.closeSync(saveFile);
    });
  }

  /**
   * Add appendix from file manager.
   *
   * @param fileType
   */
  documentSelect(fileType: number): void {
    try {
      let DocumentSelectOptions = new picker.DocumentSelectOptions();
      let documentPicker = new picker.DocumentViewPicker();
      documentPicker.select(DocumentSelectOptions).then((DocumentSelectResult: Array<string>) => {
        for (let documentSelectResultElement of DocumentSelectResult) {
          let buf = new ArrayBuffer(CommonConstants.FILE_BUFFER_SIZE);
          let readSize = 0;
          let file = fs.openSync(documentSelectResultElement, fs.OpenMode.READ_ONLY);
          let readLen = fs.readSync(file.fd, buf, { offset: readSize });
          // File name is not supported chinese name.
          let fileName = file.name;
          if (!fileName.endsWith(imageIndex[fileType].fileType) ||
            new RegExp("\[\\u4E00-\\u9FA5]|[\\uFE30-\\uFFA0]", "gi").test(fileName)) {
            promptAction.showToast({
              message: $r('app.string.alert_message_chinese')
            })
            return;
          }
          let destination = fs.openSync(getContext()
            .filesDir + '/' + fileName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          let destinationDistribute = fs.openSync(getContext()
            .distributedFilesDir + '/' + fileName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          while (readLen > 0) {
            readSize += readLen;
            fs.writeSync(destination.fd, buf);
            fs.writeSync(destinationDistribute.fd, buf);
            console.info(destinationDistribute.path);
            readLen = fs.readSync(file.fd, buf, { offset: readSize });
          }
          fs.closeSync(file);
          fs.closeSync(destination);
          fs.closeSync(destinationDistribute);
          this.appendix.push({ iconIndex: fileType, fileName: fileName });
        }
        Logger.info(`DocumentViewPicker.select successfully, DocumentSelectResult uri: ${JSON.stringify(DocumentSelectResult)}`);
      }).catch((err: BusinessError) => {
        Logger.error(`DocumentViewPicker.select failed with err: ${JSON.stringify(err)}`);
      });
    } catch (error) {
      let err: BusinessError = error as BusinessError;
      Logger.error(`DocumentViewPicker failed with err: ${JSON.stringify(err)}`);
    }
  }
}