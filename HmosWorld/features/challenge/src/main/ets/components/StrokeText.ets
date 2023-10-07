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
import { ChallengeConstants } from '../constants/ChallengeConstants';

@Component
export default struct StrokeText {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  private textColor: string = '';
  private textStr: string = '';
  @State canvasWidth: number = 0;
  @State canvasHeight: number = 0;

  build() {
    Column() {
      Canvas(this.context)
        .onReady(() => {
          let ctx = this.context;
          this.context.textBaseline = 'top';
          ctx.font = ChallengeConstants.MAP_ICON_FONT_STYLE;
          ctx.fillStyle = this.textColor;
          ctx.strokeStyle = Color.White;
          ctx.lineWidth = 1;
          this.canvasWidth = this.context.measureText(this.textStr).width;
          this.canvasHeight = this.context.measureText(this.textStr).height;
          ctx.strokeText(this.textStr, 0, 0);
          ctx.fillText(this.textStr, 0, 0);
        })
    }
    .width(this.canvasWidth)
    .height(this.canvasHeight)
    .margin({ top: $r('app.float.map_text_margin_top') })
  }
}