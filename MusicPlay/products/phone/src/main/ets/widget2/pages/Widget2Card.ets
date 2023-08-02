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

const ACTION_CALL_CARD2: string = 'call';
const ACTION_ROUTER_CARD2: string = 'router';
const MSG_SEND_METHOD_CARD2: string = 'CallSendMsgForm';
const ABILITY_NAME_CARD2 = 'EntryAbility';
const MSG_SEND_PLAY_CARD2 = 'play';
const MSG_SEND_PAUSE_CARD2 = 'pause';
const MSG_SEND_NEXT_CARD2 = 'next';
const MSG_SEND_LAST_CARD2 = 'last';

let storageCard2 = new LocalStorage();

@Entry(storageCard2)
@Component
struct Widget2Card {
  /**
   * The text margin bottom.
   */
  readonly TEXT_MARGIN_BOTTOM: string = '9.5%';

  /**
   * The last image size.
   */
  readonly LAST_IMAGE_SIZE: string = '19%';

  /**
   * The next image size.
   */
  readonly NEXT_IMAGE_SIZE: string = '19%';

  /**
   * The play image size.
   */
  readonly PLAY_IMAGE_SIZE: string = '24%';

  /**
   * The last image margin left.
   */
  readonly LAST_IMAGE_MARGIN_LEFT: string = '6%';

  /**
   * The next image margin right.
   */
  readonly NEXT_IMAGE_MARGIN_RIGHT: string = '6%';

  /**
   * The column width.
   */
  readonly COLUMN_WIDTH: string = '40%';

  /**
   * The column height.
   */
  readonly COLUMN_HEIGHT: string = '84%';

  /**
   * The column margin left.
   */
  readonly COLUMN_MARGIN_LEFT: string = '4%';

  /**
   * The list space.
   */
  readonly LIST_SPACE: string = '5%';

  /**
   * The item image right.
   */
  readonly ITEM_IMAGE_RIGHT: string = '40%';

  /**
   * The item image margin top.
   */
  readonly ITEM_IMAGE_MARGIN_TOP: string = '9%';

  /**
   * The item column width.
   */
  readonly ITEM_COLUMN_WIDTH: string = '24%';

  /**
   * The item column height.
   */
  readonly ITEM_COLUMN_HEIGHT: string = '40%';

  /**
   * The item image margin left.
   */
  readonly ITEM_IMAGE_MARGIN_LEFT: string = '2.5%';

  /**
   * The row margin bottom.
   */
  readonly ROW_MARGIN_BOTTOM: string = '6%';

  /**
   * The item text margin bottom.
   */
  readonly ITEM_TEXT_MARGIN_BOTTOM: string = '9%';

  /**
   * The full percent.
   */
  readonly FULL_PERCENT: string = '100%';

  @LocalStorageProp('isPlay') isPlay: boolean = false;
  @LocalStorageProp('musicName') musicName: string = '独立民谣';
  @LocalStorageProp('musicCover') musicCover: Resource = $r('app.media.ic_avatar1');
  @LocalStorageProp('musicSinger') musicSinger: string = 'Katy Perry';

  routerToMainPage() {
    postCardAction(this, {
      'action': ACTION_ROUTER_CARD2,
      'abilityName': ABILITY_NAME_CARD2,
      'params': {
        'message': MSG_SEND_PLAY_CARD2
      }
    });
  }

  onCallOperation(sendMessage: string) {
    postCardAction(this, {
      'action': ACTION_CALL_CARD2,
      'abilityName': ABILITY_NAME_CARD2,
      'params': {
        'method': MSG_SEND_METHOD_CARD2,
        'message': sendMessage
      }
    });
  }

  private listItems = [
    {
      imageLeft: $r('app.media.ic_leku'),
      textLeft: '乐库',
      imageRight: $r('app.media.ic_Favorites_on'),
      textRight: '我喜欢'
    },
    {
      imageLeft: $r('app.media.ic_Featured'),
      textLeft: '每日推荐',
      imageRight: $r('app.media.ic_Rankings'),
      textRight: '排行榜'
    }
  ]

  build() {
    Row() {
      Stack({ alignContent: Alignment.Bottom }) {
        Stack({ alignContent: Alignment.Center }) {
          Text(this.musicName)
            .fontSize($r('app.float.font_size'))
            .fontWeight(FontWeight.Medium)
            .fontColor(Color.White)
        }
        .width(this.FULL_PERCENT)
        .height(this.FULL_PERCENT)

        Row() {
          Image($r('app.media.ic_last'))
            .height(this.LAST_IMAGE_SIZE)
            .aspectRatio(1)
            .margin({ left: this.LAST_IMAGE_MARGIN_LEFT })
            .onClick(() => {
              let sendMessage = MSG_SEND_LAST_CARD2;
              this.onCallOperation(sendMessage);
            })

          Image(this.isPlay ? $r('app.media.ic_play_normal') : $r('app.media.ic_Pause_normal'))
            .height(this.PLAY_IMAGE_SIZE)
            .aspectRatio(1)
            .onClick(() => {
              let sendMessage = this.isPlay ? MSG_SEND_PAUSE_CARD2 : MSG_SEND_PLAY_CARD2;
              this.onCallOperation(sendMessage);
            })

          Image($r('app.media.ic_next'))
            .height(this.NEXT_IMAGE_SIZE)
            .aspectRatio(1)
            .margin({ right: this.NEXT_IMAGE_MARGIN_RIGHT })
            .onClick(() => {
              let sendMessage = MSG_SEND_NEXT_CARD2;
              this.onCallOperation(sendMessage);
            })
        }
        .width(this.FULL_PERCENT)
        .justifyContent(FlexAlign.SpaceBetween)
        .margin({ bottom: this.ROW_MARGIN_BOTTOM })
      }
      .width(this.COLUMN_WIDTH)
      .height(this.COLUMN_HEIGHT)
      .backgroundImage(this.musicCover)
      .backgroundImageSize({ width: this.FULL_PERCENT, height: this.FULL_PERCENT })
      .borderRadius($r('app.float.operate_border_radius'))
      .margin({ left: this.COLUMN_MARGIN_LEFT })

      List({ space: this.LIST_SPACE }) {
        ForEach(this.listItems, (item) => {
          ListItem() {
            Row() {
              Flex({
                direction: FlexDirection.Column,
                justifyContent: FlexAlign.SpaceBetween,
                alignItems: ItemAlign.Center
              }) {
                Image(item.imageLeft)
                  .height(this.ITEM_IMAGE_RIGHT)
                  .aspectRatio(1)
                  .margin({
                    top: this.ITEM_IMAGE_MARGIN_TOP
                  })

                Text(item.textLeft)
                  .opacity($r('app.float.text_opacity'))
                  .fontSize($r('app.float.text_font_size'))
                  .fontColor($r('app.color.item_text'))
                  .textAlign(TextAlign.Center)
                  .margin({ bottom: this.ITEM_TEXT_MARGIN_BOTTOM })
              }
              .width(this.ITEM_COLUMN_WIDTH)
              .height(this.ITEM_COLUMN_HEIGHT)
              .backgroundColor(Color.White)
              .borderRadius($r('app.float.operate_border_radius'))
              .margin({ left: this.ITEM_IMAGE_MARGIN_LEFT })

              Flex({
                direction: FlexDirection.Column,
                justifyContent: FlexAlign.SpaceBetween,
                alignItems: ItemAlign.Center
              }) {
                Image(item.imageRight)
                  .height(this.ITEM_IMAGE_RIGHT)
                  .aspectRatio(1)
                  .margin({
                    top: this.ITEM_IMAGE_MARGIN_TOP
                  })

                Text(item.textRight)
                  .opacity($r('app.float.text_opacity'))
                  .fontSize($r('app.float.text_font_size'))
                  .fontColor($r('app.color.item_text'))
                  .textAlign(TextAlign.Center)
                  .margin({ bottom: this.ITEM_TEXT_MARGIN_BOTTOM })
              }
              .width(this.ITEM_COLUMN_WIDTH)
              .height(this.ITEM_COLUMN_HEIGHT)
              .backgroundColor(Color.White)
              .borderRadius($r('app.float.operate_border_radius'))
              .margin({ left: this.ITEM_IMAGE_MARGIN_LEFT })
            }
          }
        }, (item, index) => JSON.stringify(item) + index)
      }
    }
    .width(this.FULL_PERCENT)
    .height(this.FULL_PERCENT)
    .backgroundColor($r('app.color.card2_background'))
    .onClick(() => {
      this.routerToMainPage();
    })
  }
}