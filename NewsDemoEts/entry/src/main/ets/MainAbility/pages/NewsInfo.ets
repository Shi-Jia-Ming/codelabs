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

export class NewsData {
  id: string; //id
  title: string; //标题
  createTime: string; //日期
  categoryName: string; //类别
  content: string; //内容文本
  imagesUrl: Array<NewsFile>; //图片
  videoUrl: string | Resource; //视频
  sourceId: string; //发布者id
  source: string; //发布者名称
  sourceIcon: string | Resource; //发布者头像
  url: string; //网址
  favorCount: number; //点赞数
  commentCount: number; //评论数

  constructor(id: string, title: string, createTime: string, categoryName: string, content: string, imagesUrl: Array<NewsFile>,
              videoUrl: string | Resource, sourceId: string, source: string, sourceIcon: string | Resource, url: string,
              favorCount: number, commentCount: number) {
    this.id = id;
    this.title = title;
    this.createTime = createTime;
    this.categoryName = categoryName;
    this.content = content;
    this.imagesUrl = imagesUrl;
    this.videoUrl = videoUrl;
    this.sourceId = sourceId;
    this.source = source;
    this.sourceIcon = sourceIcon;
    this.url = url;
    this.favorCount = favorCount;
    this.commentCount = commentCount;
  }
}

export class NewsFile {
  id: number;
  url: string;
  type: number;
  newsId: number

  constructor(id: number, url: string, type: number, newsId: number) {
    this.id = id;
    this.type = type;
    this.url = url;
    this.newsId = newsId
  }
}