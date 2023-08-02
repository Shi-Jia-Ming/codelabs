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

const ACTION_CALL_CARD1: string = 'call';
const ACTION_ROUTER_CARD1:string='router';
const MSG_SEND_METHOD_CARD1: string = 'CallSendMsgForm';
const ABILITY_NAME_CARD1 = 'EntryAbility';
const MSG_SEND_PLAY_CARD1 = 'play';
const MSG_SEND_PAUSE_CARD1 = 'pause';
const MSG_SEND_NEXT_CARD1 = 'next';
const MSG_SEND_LAST_CARD1 = 'last';

let storageCard1 = new LocalStorage();

@Entry(storageCard1)
@Component
struct Widget1Card {
  /**
   * The last image size.
   */
  readonly LAST_IMAGE_SIZE: string = '16%';

  /**
   * The next image size.
   */
  readonly NEXT_IMAGE_SIZE: string = '16%';

  /**
   * The play image size.
   */
  readonly PLAY_IMAGE_SIZE: string = '20%';

  /**
   * The last image margin left.
   */
  readonly LAST_IMAGE_MARGIN_LEFT: string = '13%';

  /**
   * The next image margin right.
   */
  readonly NEXT_IMAGE_MARGIN_RIGHT: string = '13%';

  /**
   * The row margin bottom.
   */
  readonly ROW_MARGIN_BOTTOM: string = '11%';

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
      'action': ACTION_ROUTER_CARD1,
      'abilityName': ABILITY_NAME_CARD1,
      'params': {
        'message': MSG_SEND_PLAY_CARD1
      }
    });
  }

  onCallOperation(sendMessage: string) {
    postCardAction(this, {
      'action': ACTION_CALL_CARD1,
      'abilityName': ABILITY_NAME_CARD1,
      'params': {
        'method': MSG_SEND_METHOD_CARD1,
        'message': sendMessage
      }
    });
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Stack({ alignContent: Alignment.Center }) {
        Text(this.musicName)
          .fontSize($r('app.float.font_size'))
          .fontWeight(FontWeight.Medium)
          .fontColor(Color.White)
      }
      .height(this.FULL_PERCENT)

      Row() {
        Image($r('app.media.ic_last'))
          .height(this.LAST_IMAGE_SIZE)
          .aspectRatio(1)
          .margin({ left: this.LAST_IMAGE_MARGIN_LEFT })
          .onClick(() => {
            let sendMessage = MSG_SEND_LAST_CARD1;
            this.onCallOperation(sendMessage);
          })

        Image(this.isPlay ? $r('app.media.ic_play_normal') : $r('app.media.ic_Pause_normal'))
          .height(this.PLAY_IMAGE_SIZE)
          .aspectRatio(1)
          .onClick(() => {
            let sendMessage = this.isPlay ? MSG_SEND_PAUSE_CARD1 : MSG_SEND_PLAY_CARD1;
            this.onCallOperation(sendMessage);
          })

        Image($r('app.media.ic_next'))
          .height(this.NEXT_IMAGE_SIZE)
          .aspectRatio(1)
          .margin({ right: this.NEXT_IMAGE_MARGIN_RIGHT })
          .onClick(() => {
            let sendMessage = MSG_SEND_NEXT_CARD1;
            this.onCallOperation(sendMessage);
          })
      }
      .width(this.FULL_PERCENT)
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({bottom:this.ROW_MARGIN_BOTTOM})
    }
    .height(this.FULL_PERCENT)
    .backgroundImage(this.musicCover)
    .backgroundImageSize({ width: this.FULL_PERCENT, height: this.FULL_PERCENT })
    .onClick(() => {
      this.routerToMainPage();
    })
  }
}