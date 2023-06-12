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

export default {
  data: {
    selectId: 0,
    earphoneList: [
      {
        'id': 0,
        'type': '',
        'icon': 'common/images/ic_head_wearable.png',
        'description': '',
        'select': 'common/images/ic_head_wearable_select.png',
        'unselect': 'common/images/ic_head_wearable_unselect.png'
      },
      {
        'id': 1,
        'type': '',
        'icon': 'common/images/ic_in_ear.png',
        'description': '',
        'select': 'common/images/ic_in_ear_select.png',
        'unselect': 'common/images/ic_in_ear_unselect.png'
      },
      {
        'id': 2,
        'type': '',
        'icon': 'common/images/ic_half_ear.png',
        'description': '',
        'select': 'common/images/ic_half_ear_select.png',
        'unselect': 'common/images/ic_half_ear_unselect.png'
      },
      {
        'id': 3,
        'type': '',
        'icon': 'common/images/ic_necklace.png',
        'description': '',
        'select': 'common/images/ic_necklace_select.png',
        'unselect': 'common/images/ic_necklace_unselect.png'
      }
    ]
  },
  onInit() {
    this.earphoneList[0].type = this.$t('strings.head_wearable');
    this.earphoneList[1].type = this.$t('strings.in_ear');
    this.earphoneList[2].type = this.$t('strings.half_in_ear');
    this.earphoneList[3].type = this.$t('strings.necklace');
    this.earphoneList[0].description = this.$t('strings.head_wearable_description');
    this.earphoneList[1].description = this.$t('strings.in_ear_description');
    this.earphoneList[2].description = this.$t('strings.half_ear_description');
    this.earphoneList[3].description = this.$t('strings.necklace_description');
  },
  changePage(id) {
    this.selectId = id;
  }
}