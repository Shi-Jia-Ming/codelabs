/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
const videoItemData: any[] = [
  { 'id': '1', 'src':$rawfile('video2.mp4'), 'title':'创新 #HMS 奋发向上', 'likesCount':0, 'isLikes':false,'commentCount':102},
  { 'id': '2', 'src':$rawfile('video1.mp4'), 'title':'演讲 #HarmonyOS', 'likesCount':8654, 'isLikes':true,'commentCount':0},
  { 'id': '3', 'src':$rawfile('video2.mp4'), 'title':'创新 #HMS 奋发向上', 'likesCount':6954, 'isLikes':false, 'commentCount':13},
  { 'id': '4', 'src':$rawfile('video1.mp4'), 'title':'演讲 #HarmonyOS', 'likesCount':7562, 'isLikes':false, 'commentCount':42}
]

/**
 * 视频模型，@Observed与@ObjectLink配合使用实现 class修饰的模型数据改变触发UI更新
 *
 * @param id id
 * @param src 视频地址
 * @param title 标题
 * @param likesCount 点赞数量
 * @param isLikes 是否点赞
 * @param commentCount 评论数量
 */
@Observed export class VideoItem {
  id: string;
  src: Resource;
  title: string;
  likesCount: number;
  isLikes: boolean;
  commentCount: number;

  constructor(id:string ,src: Resource,title: string, likesCount: number,isLikes: boolean,commentCount: number) {
    this.id = id;
    this.src = src;
    this.title = title;
    this.likesCount = likesCount;
    this.isLikes = isLikes;
    this.commentCount = commentCount;
  }
}

export function initializeOnStartup(): Array<VideoItem> {
  let  videoDataArray: Array<VideoItem> = []
  videoItemData.forEach(item => {
    videoDataArray.push(new VideoItem(item.id, item.src,item.title,item.likesCount,item.isLikes,item.commentCount));
  })
  return videoDataArray;
}