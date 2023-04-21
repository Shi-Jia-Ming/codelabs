# 一次开发，多端部署-音乐专辑（ArkTS）

### 简介
基于自适应和响应式布局，实现一次开发、多端部署音乐专辑页面。

手机效果图如下：

![](screenshots/device/AlbumSM.png)

折叠屏效果图如下：

![](screenshots/device/AlbumMD.png)

平板效果图如下：

![](screenshots/device/AlbumLG.png)

### 相关概念
- [自适应布局](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/ui-ts-layout-linear-0000001478061513-V3): 当外部容器大小发生变化时，元素可以根据相对关系自动变化以适应外部容器变化的布局能力。相对关系如占比、固定宽高比、显示优先级等。当前自适应布局能力有7种：拉伸能力、均分能力、占比能力、缩放能力、延伸能力、隐藏能力、折行能力。自适应布局能力可以实现界面显示随外部容器大小连续变化。
- [响应式布局](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/ui-ts-layout-grid-container-new-0000001427744624-V3): 当外部容器大小发生变化时，元素可以根据断点、栅格或特定的特征（如屏幕方向、窗口宽高等）自动变化以适应外部容器变化的布局能力。当前响应式布局能力有3种：断点、媒体查询、栅格布局。响应式布局可以实现界面随外部容器大小有级不连续变化，通常不同特征下的界面显示会有较大的差异。
- [GridRow](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-container-gridrow-0000001478181425-V3): 栅格容器组件，仅可以和栅格子组件(GridCol)在栅格布局场景中使用。
- [GridCol](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-container-gridcol-0000001427744832-V3): 栅格子组件，必须作为栅格容器组件(GridRow)的子组件使用。

### 相关权限

不涉及。

### 使用说明

1. 分别在手机、折叠屏、平板安装并打开应用，不同设备的应用页面通过响应式布局和自适应布局呈现不同的效果。
2. 点击右上角更多“：：”按钮，对于具备音频设备管理能力的设备，则显示“音频设备管理”菜单，否则不显示。
3. 其他按钮无实际点击事件或功能。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9及以上版本SDK。
3. 本示例需要使用DevEco Studio 3.1 Beta2及以上版本进行编译运行。