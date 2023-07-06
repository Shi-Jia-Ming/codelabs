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

import app from '@system.app';
import worker from '@ohos.worker';
import promptAction from '@ohos.promptAction';
import { cropOriginal, cropSquareImage, cropRectangleImage, cropBannerImage,
  cropDrawImage, drawScreenSelection } from '../../model/cropModel';
import { CommonConstants } from '../../common/constant/commonConstants';
import { getImageFd, getImagePixelMap, packImage } from '../../common/utils/imageUtil';
import { adjustOpacity } from '../../common/utils/opacityUtil';
import { rotate } from '../../common/utils/rotateUtil';
import { MessageItem } from '../../common/bean/messageItem';
import Logger from '../../common/utils/logger';

export default {
  data: {
    cropImage: [],
    cropImageFill: [],
    adjustImage: [],
    adjustImageFill: [],
    adjustTypeText: [],
    cropClickIndex: 0,
    adjustTypeIndex: 0,
    canvasContext: null,
    canvasCropContext: null,
    // Original image object.Save width and height.
    originalImage: new Image(),
    imageFd: null,
    imagePixelMapAdjust: null,
    imagePixelMapLastAdjust: null,
    // Original image crop width and height.
    cropWidth: 0,
    cropHeight: 0,
    // Original image cropping offset.
    cropLeft: 0,
    cropTop: 0,
    // Width and height of the canvas.
    canvasWidth: CommonConstants.INIT_CANVAS_LENGTH,
    canvasHeight: CommonConstants.INIT_CANVAS_LENGTH,
    // Width and height of the canvas cropping frame
    cropDrawWidth: 0,
    cropDrawHeight: 0,
    // Canvas drawing origin coordinates.
    drawImageTop: 0,
    drawImageLeft: 0,
    // Width and height of the drawing on the canvas.
    drawHeight: 0,
    drawWidth: 0,
    // value of slider brightness.
    brightnessValue: CommonConstants.SLIDER_MAX_VALUE,
    // value  of slider opacity.
    opacityValue: CommonConstants.SLIDER_MAX_VALUE,
    // value of slider saturation.
    saturationValue: CommonConstants.SLIDER_MAX_VALUE,
    isCropShow: true,
    isAdjustShow: false,
    isRotateShow: false,
    workerInstance: null,
    // Show transition pop-up.
    postState: false
  },

  onInit() {
    this.initResources();
    this.postState = true;
    this.initCanvas().then(() => {
      this.postState = false;
    });
  },

  initResources() {
    this.cropImage = CommonConstants.CROP_IMAGE;
    this.cropImageFill = CommonConstants.CROP_IMAGE_FILL;
    this.adjustImage = CommonConstants.ADJUST_IMAGE;
    this.adjustImageFill = CommonConstants.ADJUST_IMAGE_FILL;
    this.adjustTypeText.push(this.$t('strings.luminance'));
    this.adjustTypeText.push(this.$t('strings.transparency'));
    this.adjustTypeText.push(this.$t('strings.saturation'));
  },

  /**
   * Canvas canvas initialization
   */
  async initCanvas() {
    this.originalImage = new Image();
    this.imageFd = await getImageFd(CommonConstants.IMAGE_NAME);
    this.imagePixelMapAdjust = await getImagePixelMap(this.imageFd);
    let imageInfo = await this.imagePixelMapAdjust.getImageInfo();
    this.originalImage.height = imageInfo.size.height;
    this.originalImage.width = imageInfo.size.width;
    const canvasOne = this.$element('canvasOne');
    this.canvasContext = canvasOne.getContext('2d');
    const canvasCrop = this.$element('canvasCrop');
    this.canvasCropContext = canvasCrop.getContext('2d');
    // Canvas width and height.
    this.canvasWidth = canvasOne.getBoundingClientRect().width;
    this.canvasHeight = canvasOne.getBoundingClientRect().height;
    this.adjustSize();
    this.drawToCanvas(this.imagePixelMapAdjust, this.drawImageLeft, this.drawImageTop,
      this.drawWidth, this.drawHeight);
  },

  /**
   * Adjust the image size to adapt to the screen.
   */
  adjustSize() {
    let aspectRatio = (this.originalImage.width / this.originalImage.height).toFixed(CommonConstants.SINGLE_DIGIT);
    // Size of the initial picture on the canvas.
    this.drawWidth = this.canvasWidth;
    this.drawHeight = parseFloat((this.drawWidth / parseFloat(aspectRatio)).toFixed(CommonConstants.SINGLE_DIGIT));
    if (this.drawHeight > this.canvasHeight) {
      this.drawHeight = this.canvasHeight;
      this.drawWidth = parseFloat((this.drawHeight * parseFloat(aspectRatio)).toFixed(CommonConstants.SINGLE_DIGIT));
    }
    // Top margin of the original image relative to the canvas,to be centered.
    this.drawImageLeft = (this.canvasWidth - this.drawWidth) / CommonConstants.HALF;
    this.drawImageTop = (this.canvasHeight - this.drawHeight) / CommonConstants.HALF;
    // Default cropping frame size of the initial image.
    this.cropDrawHeight = this.drawHeight;
    this.cropDrawWidth = this.drawWidth;
    // Initialize the original image size.
    this.cropWidth = this.originalImage.width;
    this.cropHeight = this.originalImage.height;
  },

  /**
   * Click the cropping type. Original image  1:1 / 16:9 / 4:3.
   *
   * @param clickIndex Clicked crop type.
   */
  cropClick(clickIndex) {
    this.cropClickIndex = clickIndex;
    switch (clickIndex) {
      case CommonConstants.CropType.ORIGINAL:
        cropOriginal(this);
        break;
      case CommonConstants.CropType.ONE_TO_ONE:
        cropSquareImage(this);
        break;
      case CommonConstants.CropType.SIXTEEN_TO_NINE:
        cropRectangleImage(this);
        break;
      case CommonConstants.CropType.FOUR_TO_THREE:
        cropBannerImage(this);
        break;
      default:
        break;
    }
    drawScreenSelection(this, this.canvasCropContext);
  },

  /**
   * Switch the editing type, crop, rotate, and adjust.
   *
   * @param type Editing type.
   */
  async changeEditType(type) {
    this.isCropShow = false;
    this.isAdjustShow = false;
    this.isRotateShow = false;
    switch (type) {
      case CommonConstants.EditType.CROP:
        this.isCropShow = true;
        break;
      case CommonConstants.EditType.ROTATE:
        this.isRotateShow = true;
        this.cropClickIndex = 0;
        await this.crop();
        break;
      case CommonConstants.EditType.ADJUST:
        this.isAdjustShow = true;
        this.cropClickIndex = 0;
        await this.crop();
        break;
      default:
        break;
    }
  },

  /**
   * After the crop box is selected, crop and adapt to the screen display.
   */
  async crop() {
    await cropDrawImage(this);
    this.adjustSize();
    this.canvasCropContext.clearRect(0, 0, this.canvasWidth, this.canvasHeight);
    this.drawToCanvas(this.imagePixelMapAdjust, this.drawImageLeft, this.drawImageTop, this.drawWidth, this.drawHeight);
    cropOriginal(this);
  },

  /**
   * Rotate by angle.
   *
   * @param angle The angle to be rotated.
   */
  onRotate(angle) {
    let that = this;
    this.postState = true;
    rotate(this.imagePixelMapAdjust, angle, () => {
      that.exchange();
    });
  },

  /**
   * Swap the width and height after rotation and re-drawing.
   */
  exchange() {
    if (this.cropDrawWidth !== this.cropDrawHeight) {
      // Exchange the crop box, drawing width and height.
      let tempWidth = this.cropDrawWidth;
      this.cropDrawWidth = this.cropDrawHeight;
      this.cropDrawHeight = tempWidth;
      this.drawWidth = this.cropDrawWidth;
      this.drawHeight = this.cropDrawHeight;
      // Exchange the width and height of the original image.
      let tempImageWidth = this.originalImage.width;
      this.originalImage.width = this.originalImage.height;
      this.originalImage.height = tempImageWidth;
      // Exchange the crop width and height of the original image.
      let tempCropWidth = this.cropWidth;
      this.cropWidth = this.cropHeight;
      this.cropHeight = tempCropWidth;
      // Get Offset.
      this.drawImageTop = (this.canvasHeight - this.cropDrawHeight) / 2;
      this.drawImageLeft = (this.canvasWidth - this.cropDrawWidth) / 2;
    }
    this.adjustSize();
    this.drawToCanvas(this.imagePixelMapAdjust, this.drawImageLeft, this.drawImageTop,
      this.drawWidth, this.drawHeight);
    this.postState = false;
  },

  /**
   * Switch the adjustment type, including brightness, transparency, and saturation.
   *
   * @param index AdjustType
   */
  changeAdjustType(index) {
    this.adjustTypeIndex = index;
  },

  /**
   * Brightness adjustment.
   *
   * @param event Adjusting events.
   */
  async setBrightnessValue(event) {
    let slidingBrightnessValue = event.value;
    let slidingMode = event.mode;
    if (slidingMode === CommonConstants.SLIDER_MODE_END || slidingMode === CommonConstants.SLIDER_MODE_CLICK) {
      this.postToWorker(CommonConstants.AdjustId.BRIGHTNESS, slidingBrightnessValue, CommonConstants.BRIGHTNESS_WORKER_FILE);
    }
  },

  /**
   * Transparency adjustment.
   *
   * @param event Adjusting events.
   */
  setOpacityValue(event) {
    let slidingOpacityValue = event.value;
    let slidingMode = event.mode;
    if ((slidingMode === CommonConstants.SLIDER_MODE_END) || (slidingMode === CommonConstants.SLIDER_MODE_CLICK)) {
      adjustOpacity(this.imagePixelMapAdjust, slidingOpacityValue).then(pixelMap => {
        this.imagePixelMapAdjust = pixelMap;
        this.drawToCanvas(this.imagePixelMapAdjust, this.drawImageLeft, this.drawImageTop,
          this.drawWidth, this.drawHeight);
        this.opacityValue = Math.floor(slidingOpacityValue);
      });
    }
  },

  /**
   * Saturation adjustment.
   *
   * @param Adjusting events.
   */
  async setSaturationValue(event) {
    let slidingSaturationValue = event.value;
    let slidingMode = event.mode;
    if (slidingMode === CommonConstants.SLIDER_MODE_END || slidingMode === CommonConstants.SLIDER_MODE_CLICK) {
      this.postToWorker(CommonConstants.AdjustId.SATURATION, slidingSaturationValue,
        CommonConstants.SATURATION_WORKER_FILE);
    }
  },

  /**
   * Sending a message to the worker thread.
   *
   * @param type Adjustment type.
   * @param value Adjusted value.
   * @param workerName File path where the worker thread is located.
   */
  postToWorker(type, value, workerName) {
    let sliderValue = (type === CommonConstants.AdjustId.BRIGHTNESS) ? this.brightnessValue : this.saturationValue;
    this.workerInstance = new worker.ThreadWorker(workerName);
    const bufferArray = new ArrayBuffer(this.imagePixelMapAdjust.getPixelBytesNumber());
    this.imagePixelMapAdjust.readPixelsToBuffer(bufferArray).then(() => {
      let message = new MessageItem(bufferArray, sliderValue, value);
      this.workerInstance.postMessage(message);
      this.postState = true;
      this.workerInstance.onmessage = this.updatePixelMap.bind(this);
      this.workerInstance.onexit = () => {
        if (type === CommonConstants.AdjustId.BRIGHTNESS) {
          this.brightnessValue = Math.floor(value);
        } else {
          this.saturationValue = Math.floor(value);
        }
      }
    });
  },

  /**
   * Callback method that receives a work thread message, updates data, re-draws, and destroys the work thread.
   *
   * @param event Events containing messages.
   */
  updatePixelMap(event) {
    this.imagePixelMapAdjust.writeBufferToPixels(event.data);
    this.drawToCanvas(this.imagePixelMapAdjust, this.drawImageLeft, this.drawImageTop,
      this.drawWidth, this.drawHeight);
    if (this.workerInstance) {
      this.workerInstance.terminate();
    }
    this.postState = false;
  },

  /**
   * Draw the canvas again according to the input parameter requirements.
   *
   * @param imagePixel ImagePixel to be drawn.
   * @param left Left margin relative to canvas.
   * @param top Top margin relative to canvas.
   * @param width Drawing width.
   * @param height Drawing height.
   */
  drawToCanvas(imagePixel, left, top, width, height) {
    this.canvasContext.clearRect(0, 0, this.canvasWidth, this.canvasHeight);
    this.canvasContext.drawImage(imagePixel, left, top, width, height);
  },

  /**
   * Reset image.
   */
  reset() {
    this.initCanvas();
    this.canvasCropContext.clearRect(0, 0, this.canvasWidth, this.canvasHeight);
    this.cropClickIndex = 0;
    this.brightnessValue = CommonConstants.SLIDER_MAX_VALUE;
    this.saturationValue = CommonConstants.SLIDER_MAX_VALUE;
    this.opacityValue = CommonConstants.SLIDER_MAX_VALUE;
  },

  /**
   * Save image.
   */
  async save() {
    this.crop();
    // this.drawToCanvas(this.imagePixelMapAdjust, this.drawImageLeft, this.drawImageTop, this.drawWidth, this.drawHeight);
    packImage(this.imagePixelMapAdjust).then(() => {
      promptAction.showToast({
        message: this.$t('strings.save_toast')
      })
    }).catch(err => {
      Logger.error(`ImagePackUtil err: ${err}`);
    });
  },
  showDialog() {
    this.$element('simpleDialog').show();
  },
  cancel() {
    this.$element('simpleDialog').close();
  },
  abandon() {
    this.$element('simpleDialog').close();
    app.terminate();
  }
};