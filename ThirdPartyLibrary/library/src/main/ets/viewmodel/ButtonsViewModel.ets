/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

class ButtonViewModel {
  fetchType(shape: string) {
    let ret: ButtonType;
    switch (shape) {
      case 'capsule':
        ret = ButtonType.Capsule;
        break
      case 'circle':
        ret = ButtonType.Circle;
        break
      case 'normal':
        ret = ButtonType.Normal;
        break
      default:
        ret = ButtonType.Capsule;
        break
    }
    return ret
  }

  fetchBackgroundColor(type: string) {
    let ret: Resource;
    switch (type) {
      case 'success':
        ret = $r('app.color.success');
        break
      case 'info':
        ret = $r('app.color.info');
        break
      case 'warning':
        ret = $r('app.color.warning');
        break
      case 'danger':
        ret = $r('app.color.danger');
        break
      case 'none':
        ret = $r('app.color.none');
        break
      default:
        ret = $r('app.color.normal');
        break
    }
    return ret
  }
}

let buttonViewModel = new ButtonViewModel();

export default buttonViewModel as ButtonViewModel