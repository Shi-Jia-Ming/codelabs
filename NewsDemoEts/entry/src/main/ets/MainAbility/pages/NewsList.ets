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

import { NewsData } from '../pages/NewsInfo'
import { DefaultServer } from '..//pages/DefaultData'
import { HttpRequestGet } from '../date/DataHelper'
import { getDisplayWidth } from '../date/DataUtils'
import prompt from '@ohos.prompt';

@Entry
@Component
struct NewsList {
  @Watch('changeCategory') @State currentIndex: number = 0 // 新闻分类，默认0 查询全部
  @State barWidth: number = 0;
  @State fontColor: string = 'rgba(0, 0, 0, 0.4)'
  @State selectedFontColor: string = 'rgba(10, 30, 255, 1)'
  private controller: TabsController = new TabsController()
  @State tabData: Array<any> = [] //数据
  @State tabBars: Array<any> = [{ "id": 0, "name": "全部" }] // 新闻分类
  @State currentPage: number = 1;
  @State pageSize: number = 10;
  @State type: number = 0;
  private totalPage: number;
  // 当前列表首部的索引
  private startIndex = 0
  // 当前列表尾部的索引
  private endIndex = 0
  // 按下的y坐标
  private downY = 0
  // 上一次移动的y坐标
  private lastMoveY = 0
  // 列表y坐标偏移量
  @State offsetY: number = 0
  // 下拉刷新文字：下拉刷新、松开刷新、正在刷新、刷新成功
  @State pullDownRefreshText: string = '下拉刷新'
  // 下拉刷新图标：与文字对应
  @State pullDownRefreshImage: Resource = $r("app.media.ic_pull_down_refresh")
  // 是否正在刷新
  private isRefreshing: boolean = false
  // 是否可以刷新：未达到刷新条件，收缩回去
  private isCanRefresh = false
  // 是否已经进入了下拉刷新操作
  private isPullRefreshOperation = false
  // 下拉刷新布局高度
  private pullDownRefreshHeight = 70
  // 上拉加载
  @State pullUpLoadText: string = '加载中...'
  // 上拉加载图标
  @State pullUpLoadImage: Resource = $r("app.media.ic_pull_up_load")
  // 是否加载中
  private isLoading: boolean = false
  // 是否可以上拉加载
  private isCanLoadMore = false
  // 上拉加载布局默认高度
  private pullUpLoadHeight = 70
  // 上拉加载的布局是否显示
  @State isVisiblePullUpLoad: boolean = false // 上拉加载的布局是否显示
  @State isVisiblePullDown: boolean = false // 下拉刷新的布局是否显示
  // 自定义下拉刷新布局
  @Builder PullDownRefreshLayout() {
    Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Image(this.pullDownRefreshImage)
        .width(18)
        .height(18)

      Text(this.pullDownRefreshText)
        .margin({ left: 7, bottom: 1 })
        .fontSize(17)
    }
    .width('100%')
    .height(this.pullDownRefreshHeight)
    .visibility(this.isVisiblePullDown ? Visibility.Visible : Visibility.None)
  }

  // 自定义上拉加载布局
  @Builder PullUpLoadLayout() {
    Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Image(this.pullUpLoadImage)
        .width(18)
        .height(18)

      Text(this.pullUpLoadText)
        .margin({ left: 7, bottom: 1 })
        .fontSize(17)
    }
    .width('100%')
    .height(this.pullUpLoadHeight)
    .backgroundColor('#f4f4f4')
    .visibility(this.isVisiblePullUpLoad ? Visibility.Visible : Visibility.None)
  }

  @Builder TabBuilder(index: number) {
    Column() {
      Text(this.tabBars[index].name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(15)
    }.height(40)
  }

  changeCategory() {
    this.getTabData(1)
  }

  private async getTabData(type) {
    var url = DefaultServer.server + "/" + DefaultServer.getNewsList
    var params = [{
                    "key": "currentPage",
                    "value": this.currentPage
                  },
                  {
                    "key": "pageSize",
                    "value": this.pageSize
                  },
                  {
                    "key": "type",
                    "value": this.currentIndex
                  }
    ]
    var data = await  HttpRequestGet(url, params)
    this.totalPage = data.data.pageSize
    if (type == 1) {
      this.tabData = data.data.pageData
    } else {
      this.tabData = this.tabData.concat(data.data.pageData)
    }
  }

  aboutToAppear() {
    // 请求新闻类别
    this.loadNewsTypes()
    // 请求新闻数据
    this.getTabData(1);
    // 获取屏幕宽度并计算tabBar的宽度
    this.getBarWidth()
  }

  async getBarWidth() {
    let promise = await getDisplayWidth();

    this.barWidth = vp2px(promise.valueOf()) * 0.8
  }
  // 刷新测试数据
  private refreshData() {
    this.currentPage = this.currentPage + 1
    if (this.currentPage > this.pageSize) {
      prompt.showToast({ message: "没有更多数据了" })
      this.currentPage = this.currentPage - 1
    }
    this.getTabData(1);
  }

  // 加载更多测试数据
  private loadMoreData() {
    this.currentPage = this.currentPage + 1
    if (this.currentPage > this.pageSize) {
      prompt.showToast({ message: "没有更多数据了" })
      this.currentPage = this.currentPage - 1
    }
    this.getTabData(2);
  }
  // 加载新闻类型
  private async loadNewsTypes() {
    var url = DefaultServer.server + "/" + DefaultServer.getNewsType
    var data = await HttpRequestGet(url, null)
    this.tabBars = this.tabBars.concat(data.data)
  }

build() {
  Column() {
    Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
      ForEach(this.tabBars, tabsItem => {
        TabContent() {
          // 下拉刷新布局
          List() {
            ListItem() {
              this.PullDownRefreshLayout()
            }

            ForEach(this.tabData, item => {
              ListItem() {
                Column() {
                  NewsItem({ newsData: item })
                }
              }
            }, item => item.id)
            // 加载更多布局
            ListItem() {
              this.PullUpLoadLayout()
            }
          }
          .backgroundColor(Color.White) // 背景
          .divider({ color: '#e2e2e2', strokeWidth: 1 }) // 分割线
          .edgeEffect(EdgeEffect.None) // 去掉回弹效果
          .offset({ x: 0, y: `${this.offsetY}px` }) // touch事件计算的偏移量单位是px，记得加上单位
          .onScrollIndex((start, end) => { // 监听当前列表首位索引
            console.info(`${start}=start============end=${end}`)
            this.startIndex = start
            this.endIndex = end
          })
        }.tabBar(this.TabBuilder(tabsItem.id))
      }, item => item.id)
    }
    .onChange((index: number) => {
      this.currentIndex = index
      this.currentPage = 1
    })
    .vertical(false)
    .barHeight(30)
    .margin(10)
    .barMode(BarMode.Scrollable)
    .barWidth(this.barWidth)
  }
  .backgroundColor('#f4f4f4')
  .alignItems(HorizontalAlign.Start)
  .onTouch((event) => this.listTouchEvent(event)) // 父容器设置touch事件，当列表无数据也可以下拉刷新
}

  // 触摸事件
  listTouchEvent(event: TouchEvent) {
    switch (event.type) {
      case TouchType.Down: // 手指按下
      // 记录按下的y坐标
        this.downY = event.touches[0].y
        this.lastMoveY = event.touches[0].y
        break
      case TouchType.Move: // 手指移动
      // 下拉刷新中 或 加载更多中，不进入处理逻辑
        if (this.isRefreshing || this.isLoading) {
          console.info('========Move刷新中，返回=========')
          return
        }
      // 判断手势
        let isDownPull = event.touches[0].y - this.lastMoveY > 0
      // 下拉手势 或 已经进入了下拉刷新操作
        if ((isDownPull || this.isPullRefreshOperation) && !this.isCanLoadMore) {
          this.touchMovePullRefresh(event)
        } else {
          this.touchMoveLoadMore(event)
        }
        this.lastMoveY = event.touches[0].y
        break
      case TouchType.Up: // 手指抬起
      case TouchType.Cancel: // 触摸意外中断：来电界面
      // 刷新中 或 加载更多中，不进入处理逻辑
        if (this.isRefreshing || this.isLoading) {
          console.info('========Up刷新中，返回=========')
          return
        }
        if (this.isPullRefreshOperation) {
          // 下拉刷新
          this.touchUpPullRefresh()
        } else {
          // 上拉加载
          this.touchUpLoadMore()
        }
        break
    }
  }

  //============================================下拉刷新==================================================
  // 手指移动，处理下拉刷新
  touchMovePullRefresh(event: TouchEvent) {
    // 当首部索引位于0
    if (this.startIndex == 0) {
      this.isPullRefreshOperation = true
      // 下拉刷新布局高度
      var height = vp2px(this.pullDownRefreshHeight)
      // 滑动的偏移量
      this.offsetY = event.touches[0].y - this.downY

      // 偏移量大于下拉刷新布局高度，达到刷新条件
      if (this.offsetY >= height) {
        // 状态1：松开刷新
        this.pullRefreshState(1)
        // 偏移量的值缓慢增加
        this.offsetY = height + this.offsetY * 0.15
      } else {
        // 状态0：下拉刷新
        this.pullRefreshState(0)
      }

      if (this.offsetY < 0) {
        this.offsetY = 0
        this.isPullRefreshOperation = false
      }
    }
  }

  // 手指抬起，处理下拉刷新
  touchUpPullRefresh() {
    // 是否可以刷新
    if (this.isCanRefresh) {
      console.info('======执行下拉刷新========')
      // 偏移量为下拉刷新布局高度
      this.offsetY = vp2px(this.pullDownRefreshHeight)
      // 状态2：正在刷新
      this.pullRefreshState(2)

      // 模拟耗时操作，实际应用中不需要此定时器，数据请求完成后隐藏下拉刷新布局即可
      setTimeout(() => {
        // 请求数据
        this.refreshData()
        //  关闭下拉刷新
        this.closeRefresh()
      }, 2000)

    } else {
      console.info('======关闭下拉刷新！未达到条件========')
      // 关闭刷新
      this.closeRefresh()
    }
  }

  // 下拉刷新状态
  // 0下拉刷新、1松开刷新、2正在刷新、3刷新成功
  pullRefreshState(state: number) {
    switch (state) {
      case 0:
      // 初始状态
        this.pullDownRefreshText = '下拉刷新'
        this.pullDownRefreshImage = $r("app.media.ic_pull_down_refresh")
        this.isCanRefresh = false
        this.isRefreshing = false
        this.isVisiblePullDown = true
        break;
      case 1:
        this.pullDownRefreshText = '松开刷新'
        this.pullDownRefreshImage = $r("app.media.ic_pull_up_refresh")
        this.isCanRefresh = true
        this.isRefreshing = false
        break;
      case 2:
        this.offsetY = vp2px(this.pullDownRefreshHeight)
        this.pullDownRefreshText = '正在刷新'
        this.pullDownRefreshImage = $r("app.media.ic_pull_up_load")
        this.isCanRefresh = true
        this.isRefreshing = true
        break;
      case 3:
        this.pullDownRefreshText = '刷新成功'
        this.pullDownRefreshImage = $r("app.media.ic_succeed_refresh")
        this.isCanRefresh = true
        this.isRefreshing = true
        break;
    }
  }

  // 关闭刷新
  closeRefresh() {
    // 如果允许刷新，延迟进入，为了显示刷新中
    setTimeout(() => {
      var delay = 50
      if (this.isCanRefresh) {
        // 状态3：刷新成功
        this.pullRefreshState(3)
        // 为了显示刷新成功，延迟执行收缩动画
        delay = 500
      }
      animateTo({
        duration: 150, // 动画时长
        delay: delay, // 延迟时长
        onFinish: () => {
          // 状态0：下拉刷新
          this.pullRefreshState(0)
          this.isPullRefreshOperation = false
          this.isVisiblePullDown = false
        }
      }, () => {
        this.offsetY = 0
      })
    }, this.isCanRefresh ? 500 : 0)
  }

  //============================================加载更多==================================================
  // 手指移动，处理加载更多
  touchMoveLoadMore(event: TouchEvent) {
    // 因为加载更多是在列表后面新增一个item，当一屏能够展示全部列表，endIndex 为 length+1
    if (this.endIndex == this.tabData.length - 1 || this.endIndex == this.tabData.length) {
      // 滑动的偏移量
      this.offsetY = event.touches[0].y - this.downY
      if (Math.abs(this.offsetY) > vp2px(this.pullUpLoadHeight) / 2) {
        // 可以刷新了
        this.isCanLoadMore = true
        // 显示加载更多布局
        this.isVisiblePullUpLoad = true
        // 偏移量缓慢增加
        this.offsetY = -vp2px(this.pullUpLoadHeight) + this.offsetY * 0.1
      }
    }
  }

  // 手指抬起，处理加载更多
  touchUpLoadMore() {
    animateTo({
      duration: 200, // 动画时长
    }, () => {
      // 偏移量设置为0
      this.offsetY = 0
    })
    if (this.isCanLoadMore) {
      console.info('======执行加载更多========')
      // 加载中...
      this.isLoading = true
      // 模拟耗时操作
      setTimeout(() => {
        this.closeLoadMore()
        this.loadMoreData()
      }, 2000)
    } else {
      console.info('======关闭加载更多！未达到条件========')
      this.closeLoadMore()
    }
  }

  // 关闭加载更多
  closeLoadMore() {
    this.isCanLoadMore = false
    this.isLoading = false
    this.isVisiblePullUpLoad = false
  }
}

//新闻列表item
@Component
export struct NewsItem {
  private newsData: NewsData
  private screenWidth: number = AppStorage.Get<number>('screenWidth')
  private textLines: number = 0
  private fontSize_Source = 12
  private fontSize_title = 15

  build() {
    Column() {
      Row() {
        //只有一张图片时的样式
        if (this.newsData.imagesUrl.length === 1) {
          Column() {
            Text(this.newsData.title)
              .fontSize(this.fontSize_title)
              .maxLines(3)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
            Blank()
            if (this.textLines <= 2) {
              Flex({ justifyContent: FlexAlign.SpaceBetween }) {
                Row() {
                  Text(this.newsData.source)
                    .fontSize(this.fontSize_Source)
                    .fontColor($r("app.color.fontColor_text2"))
                  Text(this.newsData.createTime)
                    .fontSize(this.fontSize_Source)
                    .fontColor($r("app.color.fontColor_text2"))
                    .margin({ left: 10 })
                }
              }
              .height(17)
            }
          }
          .alignItems(HorizontalAlign.Start)
          .width('67%').height(75)
          .margin({ right: '3%' })

          Image(this.newsData.imagesUrl[0].url)
            .objectFit(ImageFit.Cover)
            .width('30%').height(75)
            .borderRadius(8)
        } else {
          Text(this.newsData.title)
            .fontSize(this.fontSize_title)
            .maxLines(3)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
      }
      .alignItems(VerticalAlign.Top)
      .margin({ bottom: 10 })
      //2、3张图片时的样式
      if (this.newsData.imagesUrl.length > 1) {
        Grid() {
          ForEach(this.newsData.imagesUrl, itemImg => {
            GridItem() {
              Image(itemImg.url)
                .objectFit(ImageFit.Cover)
                .width('100%').height('100%')
                .borderRadius(8)
            }
          }, itemImg => this.newsData.imagesUrl.indexOf(itemImg.id).toString())
        }
        .width('100%')
        .aspectRatio(4)
        .columnsTemplate('1fr '.repeat(this.newsData.imagesUrl.length))
        .columnsGap(5)
        .rowsTemplate('1fr')
        .margin({ bottom: 10 })
      }
      if (this.textLines > 2 || this.newsData.imagesUrl.length > 1) {
        Flex({ justifyContent: FlexAlign.SpaceBetween }) {
          Row() {
            Text(this.newsData.source)
              .fontSize(this.fontSize_Source)
              .fontColor($r("app.color.fontColor_text2"))
            Text(this.newsData.createTime)
              .fontSize(this.fontSize_Source)
              .fontColor($r("app.color.fontColor_text2"))
              .margin({ left: 10 })
          }
        }
        .height(17)
        .margin({ bottom: 15 })
      }
      Divider().width('100%').strokeWidth(1).color('#10000000')
    }
    .alignItems(HorizontalAlign.Start)
    .margin({ top: 5 })
    .padding({ left: '3%', right: '3%' })
  }
}