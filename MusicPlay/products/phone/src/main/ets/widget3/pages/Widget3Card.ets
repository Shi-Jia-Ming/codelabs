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

const ACTION_CALL_CARD3: string = 'call';
const ACTION_ROUTER_CARD3:string='router';
const MSG_SEND_METHOD_CARD3: string = 'CallSendMsgForm';
const ABILITY_NAME_CARD3 = 'EntryAbility';
const MSG_SEND_PLAY_CARD3 = 'play';
const MSG_SEND_PAUSE_CARD3 = 'pause';
const MSG_SEND_NEXT_CARD3 = 'next';
const MSG_SEND_LAST_CARD3 = 'last';
const MSG_SEND_INDEX_CARD3 = 'index';

let storageCard3 = new LocalStorage();

@Entry(storageCard3)
@Component
struct Widget3Card {
  /**
   * The row margin.
   */
  readonly ROW_MARGIN: string = '3.5%';

  /**
   * The image height.
   */
  readonly IMAGE_HEIGHT: string = '36.6%';

  /**
   * The sub text margin top.
   */
  readonly SUB_TEXT_MARGIN_TOP: string = '0.5%';

  /**
   * The sub text margin bottom.
   */
  readonly SUB_TEXT_MARGIN_BOTTOM: string = '15%';

  /**
   * The list component padding left and padding right.
   */
  readonly LIST_PADDING: string = '27%';

  /**
   * The next image height.
   */
  readonly NEXT_IMAGE_HEIGHT: string = '7%';

  /**
   * The  play image height.
   */
  readonly PLAY_IMAGE_HEIGHT: string = '8.7%';

  /**
   * The column margin left.
   */
  readonly COLUMN_MARGIN_LEFT: string = '4%';

  /**
   * The divider height.
   */
  readonly LIST_MARGIN_HEIGHT: string = '1%';

  /**
   * The list item margin left.
   */
  readonly ITEM_MARGIN_LEFT: string = '3.5%';

  /**
   * The list item margin top.
   */
  readonly ITEM_MARGIN_TOP: string = '6%';

  /**
   * The list item image height.
   */
  readonly ITEM_IMAGE_HEIGHT: string = '20%';

  /**
   * The list item column margin left.
   */
  readonly ITEM_COLUMN_MARGIN_LEFT: string = '3.5%';

  /**
   * The font weight.
   */
  readonly FONT_WEIGHT: number = 500;

  /**
   * The full percent.
   */
  readonly FULL_PERCENT: string = '100%';

  @LocalStorageProp('isPlay') isPlay: boolean = false;
  @LocalStorageProp('musicName') musicName: string = '独立民谣';
  @LocalStorageProp('musicCover') musicCover: Resource = $r('app.media.ic_avatar1');
  @LocalStorageProp('musicSinger') musicSinger: string = 'Katy Perry';
  @LocalStorageProp('cardSongList') listItems: Array<{}> = [
    {
      title: '不知道', label: $r('app.media.ic_avatar6'), singer: '小碗你好', index: 0
    },
    {
      title: '可可不喜欢', label: $r('app.media.ic_avatar15'), singer: 'HARIKIRI', index: 1
    },
    {
      title: '好好学习', label: $r('app.media.ic_avatar17'), singer: 'Laurel', index: 2
    }
  ];

  routerToMainPage() {
    postCardAction(this, {
      'action': ACTION_ROUTER_CARD3,
      'abilityName': ABILITY_NAME_CARD3,
      'params': {
        'message': MSG_SEND_PLAY_CARD3
      }
    });
  }

  onCallOperation(sendMessage: string) {
    postCardAction(this, {
      'action': ACTION_CALL_CARD3,
      'abilityName': ABILITY_NAME_CARD3,
      'params': {
        'method': MSG_SEND_METHOD_CARD3,
        'message': sendMessage
      }
    });
  }

  onCallOperationByIndex(sendMessage: string, musicIndex: number) {
    postCardAction(this, {
      'action': ACTION_CALL_CARD3,
      'abilityName': ABILITY_NAME_CARD3,
      'params': {
        'method': MSG_SEND_METHOD_CARD3,
        'message': sendMessage,
        'musicIndex': musicIndex
      }
    });
  }

  build() {
    Column() {
      Row() {
        Image(this.musicCover)
          .aspectRatio(1)
          .height(this.IMAGE_HEIGHT)
          .borderRadius($r('app.float.cover_image_border_radius'))

        Column() {
          Text(this.musicName)
            .width(this.FULL_PERCENT)
            .fontSize($r('app.float.text_title_font_size'))
            .fontColor($r('app.color.item_text'))
            .textAlign(TextAlign.Start)
            .fontWeight(this.FONT_WEIGHT)

          Text(this.musicSinger)
            .width(this.FULL_PERCENT)
            .fontSize($r('app.float.text_item_font_size'))
            .fontColor($r('app.color.subtitle_text'))
            .textAlign(TextAlign.Start)
            .fontWeight(this.FONT_WEIGHT)
            .margin({
              top: this.SUB_TEXT_MARGIN_TOP,
              bottom: this.SUB_TEXT_MARGIN_BOTTOM
            })

          Row() {
            Image($r('app.media.ic_last_grey'))
              .height($r('app.float.image_option'))
              .aspectRatio(1)
              .objectFit(ImageFit.Fill)
              .onClick(() => {
                let sendMessage = MSG_SEND_LAST_CARD3;
                this.onCallOperation(sendMessage);
              })

            Image(this.isPlay ? $r('app.media.ic_play_normal_grey') : $r('app.media.ic_Pause_normal_grey'))
              .height($r('app.float.image_option_play'))
              .aspectRatio(1)
              .objectFit(ImageFit.Fill)
              .onClick(() => {
                let sendMessage = this.isPlay ? MSG_SEND_PAUSE_CARD3 : MSG_SEND_PLAY_CARD3;
                this.onCallOperation(sendMessage);
              })

            Image($r('app.media.ic_next_grey'))
              .height($r('app.float.image_option'))
              .aspectRatio(1)
              .objectFit(ImageFit.Fill)
              .onClick(() => {
                let sendMessage = MSG_SEND_NEXT_CARD3;
                this.onCallOperation(sendMessage);
              })
          }
          .width(this.FULL_PERCENT)
          .justifyContent(FlexAlign.SpaceBetween)
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Start)
        .margin({ left: this.COLUMN_MARGIN_LEFT })
      }
      .margin(this.ROW_MARGIN)

      Row() {
        List({ space: this.ITEM_MARGIN_TOP }) {
          ForEach(this.listItems, (item) => {
            ListItem() {
              Row() {
                Image(item.label)
                  .height(this.FULL_PERCENT)
                  .aspectRatio(1)
                  .borderRadius($r('app.float.item_image_border_radius'))

                Column() {
                  Text(item.title)
                    .width(this.FULL_PERCENT)
                    .fontSize($r('app.float.text_font_size'))
                    .fontColor($r('app.color.item_text'))
                    .textAlign(TextAlign.Start)
                    .fontWeight(this.FONT_WEIGHT)

                  Text(item.singer)
                    .width(this.FULL_PERCENT)
                    .fontSize($r('app.float.sub_text_font_size'))
                    .fontColor($r('app.color.subtitle_text'))
                    .textAlign(TextAlign.Start)
                    .fontWeight(this.FONT_WEIGHT)
                }
                .margin({ left: this.ITEM_COLUMN_MARGIN_LEFT })
              }
              .margin({ left: this.ITEM_MARGIN_LEFT })
              .onClick(() => {
                this.onCallOperationByIndex(MSG_SEND_INDEX_CARD3, item.index);
              })
            }
            .height(this.LIST_PADDING)
          }, (item, index) => JSON.stringify(item) + index)
        }
        .padding({
          top: this.LIST_MARGIN_HEIGHT,
          bottom: this.LIST_MARGIN_HEIGHT
        })
        .backgroundColor($r('app.color.list_background'))
      }
      .layoutWeight(1)
      .backgroundColor($r('app.color.list_background'))
    }
    .width(this.FULL_PERCENT)
    .height(this.FULL_PERCENT)
    .backgroundColor($r('app.color.card3_background'))
    .onClick(() => {
      this.routerToMainPage();
    })
  }
}