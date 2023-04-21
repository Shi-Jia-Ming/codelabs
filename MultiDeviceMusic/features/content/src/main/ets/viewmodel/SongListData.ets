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

const songList = [
  { id: 1, title: '不知道', singer: '小碗你好', label: $r('app.media.ic_vip') },
  { id: 2, title: '歌名你好', singer: '张三-你好我好都好', label: $r('app.media.ic_SQ') },
  { id: 3, title: '还是歌名', singer: '不知道你是谁', label: $r('app.media.ic_SQ') },
  { id: 4, title: 'AIUHGVNHK', singer: 'Gwyu-Hjjiyabn', label: $r('app.media.ic_SQ') },
  { id: 5, title: '可可不喜欢', singer: '名佚', label: $r('app.media.ic_SQ') },
  { id: 6, title: '我是UOUYGBJ', singer: '我是小树', label: $r('app.media.ic_SQ') },
  { id: 7, title: '好好学习', singer: '全村最帅', label: $r('app.media.ic_SQ') },
  { id: 8, title: '安心安心', singer: '小安安', label: $r('app.media.ic_SQ') },
  { id: 9, title: 'HBNJGHJHB', singer: '我是小树', label: $r('app.media.ic_SQ') },
  { id: 10, title: '安心安心', singer: '小安安', label: $r('app.media.ic_SQ') },
  { id: 11, title: 'Notebook', singer: '小安安', label: $r('app.media.ic_SQ') },
  { id: 12, title: '不知道', singer: '小碗你好', label: $r('app.media.ic_vip') },
  { id: 13, title: '歌名你好', singer: '张三-你好我好都好', label: $r('app.media.ic_SQ') },
  { id: 14, title: '还是歌名', singer: '不知道你是谁', label: $r('app.media.ic_SQ') },
  { id: 15, title: 'AIUHGVNHK', singer: 'Gwyu-Hjjiyabn', label: $r('app.media.ic_SQ') },
  { id: 16, title: '可可不喜欢', singer: '名佚', label: $r('app.media.ic_SQ') },
  { id: 17, title: '我是UOUYGBJ', singer: '我是小树', label: $r('app.media.ic_SQ') },
  { id: 18, title: '好好学习', singer: '全村最帅', label: $r('app.media.ic_SQ') },
  { id: 19, title: '安心安心', singer: '小安安', label: $r('app.media.ic_SQ') },
  { id: 20, title: 'HBNJGHJHB', singer: '我是小树', label: $r('app.media.ic_SQ') },
  { id: 21, title: '安心安心', singer: '小安安', label: $r('app.media.ic_SQ') },
  { id: 23, title: 'Notebook', singer: '小安安', label: $r('app.media.ic_SQ') },
  { id: 24, title: '安心安心', singer: '小安安', label: $r('app.media.ic_SQ') },
  { id: 25, title: 'Notebook', singer: '小安安', label: $r('app.media.ic_SQ') }
]

const optionList : OptionItem[] = [
  { image: $r('app.media.ic_collect'), text: $r('app.string.collect') },
  { image: $r('app.media.ic_download'), text: $r('app.string.download') },
  { image: $r("app.media.ic_comments"), text: $r('app.string.comment') },
  { image: $r("app.media.ic_share"), text: $r('app.string.share') }
]

type OptionItem = {
  image: Resource;
  text: Resource;
}

export { songList, optionList, OptionItem }