import { NewsListConstant } from '../common/constant/CommonConstant';
/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { NewsData } from '../common/bean/NewsData';
import { NewsSource, NewsContent, NewsTitle, NewsGrid } from '../common/constant/CommonConstant';

/**
 * The news list item component.
 */
@Component
export default struct NewsItem {
  private newsData: NewsData;

  build() {
    Column() {
      Row() {
        Image($r('app.media.news'))
          .width(NewsTitle.IMAGE_WIDTH)
          .height(NewsTitle.IMAGE_HEIGHT)
          .margin({
            top: NewsTitle.IMAGE_MARGIN_TOP,
            left: NewsTitle.IMAGE_MARGIN_LEFT
          })
          .objectFit(ImageFit.Fill)
        Text(this.newsData.title)
          .fontSize(NewsTitle.TEXT_FONT_SIZE)
          .fontColor($r('app.color.fontColor_text'))
          .height(NewsTitle.TEXT_HEIGHT)
          .width(NewsTitle.TEXT_WIDTH)
          .maxLines(NewsTitle.TEXT_MAX_LINES)
          .margin({ left: NewsTitle.TEXT_MARGIN_LEFT, top: NewsTitle.TEXT_MARGIN_TOP })
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .fontWeight(NewsTitle.TEXT_FONT_WEIGHT)
      }

      Text(this.newsData.content)
        .fontSize(NewsContent.FONT_SIZE)
        .fontColor($r('app.color.fontColor_text'))
        .height(NewsContent.HEIGHT)
        .width(NewsContent.WIDTH)
        .maxLines(NewsContent.MAX_LINES)
        .margin({ left: NewsContent.MARGIN_LEFT, top: NewsContent.MARGIN_TOP })
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      Grid() {
        ForEach(this.newsData.imagesUrl, itemImg => {
          GridItem() {
            Image(itemImg.url)
              .objectFit(ImageFit.Cover)
              .borderRadius(NewsGrid.IMAGE_BORDER_RADIUS)
          }
        }, (itemImg, index) => JSON.stringify(itemImg) + index.toString())
      }
      .columnsTemplate('1fr '.repeat(this.newsData.imagesUrl.length))
      .columnsGap(NewsGrid.COLUMNS_GAP)
      .rowsTemplate(NewsGrid.ROWS_TEMPLATE)
      .width(NewsGrid.WIDTH)
      .height(NewsGrid.HEIGHT)
      .margin({ left: NewsGrid.MARGIN_LEFT, top: NewsGrid.MARGIN_TOP,
        right: NewsGrid.MARGIN_RIGHT })

      Text(this.newsData.source)
        .fontSize(NewsSource.FONT_SIZE)
        .fontColor($r('app.color.fontColor_text2'))
        .height(NewsSource.HEIGHT)
        .width(NewsSource.WIDTH)
        .maxLines(NewsSource.MAX_LINES)
        .margin({ left: NewsSource.MARGIN_LEFT, top: NewsSource.MARGIN_TOP })
        .textOverflow({ overflow: TextOverflow.None })
    }
    .alignItems(HorizontalAlign.Start)
  }
}