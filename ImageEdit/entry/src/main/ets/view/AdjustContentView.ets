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

import worker, { MessageEvents} from '@ohos.worker';
import { adjustIconList, IconStatus } from '../viewmodel/IconListViewModel';
import { adjustOpacity } from '../utils/OpacityUtil';
import { CommonConstants } from '../common/constant/CommonConstants';
import { AdjustId } from '../viewmodel/OptionViewModel';
import { MessageItem } from '../viewmodel/MessageItem'
import image from '@ohos.multimedia.image';

@Component
export default struct AdjustContentView {
  @Builder TabBuilder(index: number, name: string | Resource) {
    Column() {
      Image(this.currentAdjustIndex === index ? this.AdjustIconList[index]?.chosen : this.AdjustIconList[index]?.normal)
        .width($r('app.float.adjust_icon_width'))
        .height($r('app.float.adjust_icon_height'))

      Text(name)
        .fontColor(this.currentAdjustIndex === index ? Color.Blue : Color.White)
        .fontSize($r('app.float.adjust_font_size'))
        .margin({ top: $r('app.float.adjust_margin_top') })
    }
    .width(CommonConstants.LAYOUT_FULL_SCREEN)
  }

  @State currentAdjustIndex: number = 0;
  @Consume currentAdjustData: Array<number>;
  AdjustIconList: Array<IconStatus> = adjustIconList;

  build() {
    Tabs({ barPosition: BarPosition.End }) {
      TabContent() {
        SliderCustom({
          currentIndex: AdjustId.BRIGHTNESS.valueOf(),
          min: CommonConstants.SLIDER_MIN.valueOf(),
          max: CommonConstants.SLIDER_MAX.valueOf(),
          currentAdjustData: $currentAdjustData
        })
      }
      .tabBar(this.TabBuilder(AdjustId.BRIGHTNESS, $r('app.string.brightness')))

      TabContent() {
        SliderCustom({
          currentIndex: AdjustId.TRANSPARENCY.valueOf(),
          min: CommonConstants.SLIDER_MIN.valueOf(),
          max: CommonConstants.SLIDER_MAX.valueOf(),
          currentAdjustData: $currentAdjustData
        })
      }
      .tabBar(this.TabBuilder(AdjustId.TRANSPARENCY, $r('app.string.transparency')))

      TabContent() {
        SliderCustom({
          currentIndex: AdjustId.SATURATION.valueOf(),
          min: CommonConstants.SLIDER_MIN.valueOf(),
          max: CommonConstants.SLIDER_MAX.valueOf(),
          currentAdjustData: $currentAdjustData
        })
      }
      .tabBar(this.TabBuilder(AdjustId.SATURATION, $r('app.string.saturation')))
    }
    .margin({ bottom: $r('app.float.adjust_margin_bottom') })
    .onChange((index: number) => {
      this.currentAdjustIndex = index;
    })
  }
}

@Component
struct SliderCustom {
  @Prop currentIndex: number;
  @Link currentAdjustData: number[];
  @Prop min: number;
  @Prop max: number;
  @Consume pixelMap?: PixelMap;
  @Consume isPixelMapChange: boolean;
  private pixelMapTemp?: PixelMap;
  private postState: boolean = true;
  private workerInstance?: worker.ThreadWorker;
  saturationLastSlider: number = CommonConstants.SLIDER_MAX;
  brightnessLastSlider: number = CommonConstants.SLIDER_MAX;
  deviceListDialogController: CustomDialogController = new CustomDialogController({
    builder: Dialog(),
    alignment: DialogAlignment.Center,
    autoCancel: false,
    customStyle: true
  });

  build() {
    Column() {
      Text(`${this.currentAdjustData[this.currentIndex]}`)
        .fontColor(Color.White)
        .margin({ top: $r('app.float.slider_margin_top') })
        .fontSize($r('app.float.slider_font_size'))
      Row() {
        Slider({
          value: this.currentAdjustData[this.currentIndex],
          step: CommonConstants.SLIDER_STEP,
          min: this.min,
          max: this.max
        })
          .trackColor(Color.White)
          .width(CommonConstants.SLIDER_WIDTH)
          .showSteps(true)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.sliderChange(value, mode);
          })
      }
      .width(CommonConstants.LAYOUT_FULL_SCREEN)
      .justifyContent(FlexAlign.Center)
    }
  }

  sliderChange(value: number, mode: SliderChangeMode) {
    if (mode === SliderChangeMode.End || mode === CommonConstants.SLIDER_CLICK_MODE) {
      this.currentAdjustData[this.currentIndex] = Math.round(value);
      switch (this.currentIndex) {
        case AdjustId.BRIGHTNESS:
          this.postToWorker(AdjustId.BRIGHTNESS, value, CommonConstants.BRIGHTNESS_WORKER_FILE);
          break;
        case AdjustId.TRANSPARENCY:
          if (this.pixelMap) {
            adjustOpacity(this.pixelMap, Math.round(value))
              .then((pixelMap?: PixelMap) => {
                if(pixelMap) {
                  this.pixelMap = pixelMap;
                  this.isPixelMapChange = !this.isPixelMapChange;
                }
              });
          }
          break;
        case AdjustId.SATURATION:
          this.postToWorker(AdjustId.SATURATION, value, CommonConstants.SATURATION_WORKER_FILE);
          break;
        default:
          break;
      }
    }
  }

  postToWorker(type: AdjustId, value: number, workerName: string) {
    if (!this.pixelMap) {
      return;
    }
    let sliderValue = type === AdjustId.BRIGHTNESS ? this.brightnessLastSlider : this.saturationLastSlider;
    let workerInstance = new worker.ThreadWorker(workerName);
    const bufferArray = new ArrayBuffer(this.pixelMap.getPixelBytesNumber());
    this.pixelMap.readPixelsToBuffer(bufferArray).then(() => {
      let message = new MessageItem(bufferArray, sliderValue, value);
      workerInstance.postMessage(message);
      if (this.postState) {
        this.deviceListDialogController.open();
      }
      this.postState = false;
      workerInstance.onmessage = (event: MessageEvents) => {
       this.updatePixelMap(event);
      }
      if (type === AdjustId.BRIGHTNESS) {
        this.brightnessLastSlider = Math.round(value);
      } else {
        this.saturationLastSlider = Math.round(value);
      }
      workerInstance.onexit = () => {
        if (workerInstance !== undefined) {
          workerInstance.terminate();
        }
      }
    });
  }

  updatePixelMap(event: MessageEvents) {
    const newPixel: image.PixelMap | undefined = this.pixelMap;
    if (newPixel !== undefined) {
      newPixel.writeBufferToPixels(event.data);
    }
    this.pixelMap = newPixel;
    this.isPixelMapChange = !this.isPixelMapChange;
    this.deviceListDialogController.close();
    this.postState = true;
  }
}

@CustomDialog
export struct Dialog {
  controller?: CustomDialogController;

  build() {
    Column() {
      LoadingProgress()
        .color(Color.White)
        .width(CommonConstants.LOADING_WH)
        .height(CommonConstants.LOADING_WH)
    }
  }
}
