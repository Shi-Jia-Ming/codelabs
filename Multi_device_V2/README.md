# 一次开发，多端部署-视频应用（ArkTS）

### 简介
基于“一次开发，多端部署”能力实现的一个视频播放类应用主页面。

手机效果图如下：

![](screenshots/device/Home_SM.png)

折叠屏效果图如下：

![](screenshots/device/Home_MD.png)

平板效果图如下：

![](screenshots/device/Home_LG.png)

### 相关概念
-   [一次开发，多端部署](https://developer.harmonyos.com/cn/docs/documentation/doc-guides/harmonyos-features-0000000000011907#section35241557442)：指一套代码工程，一次开发上架，多端按需部署，目标是支撑开发者高效地开发支持多种终端设备形态的应用。
-   自适应布局：当外部容器大小发生变化时，元素可以根据相对关系自动变化以适应外部容器变化的布局能力。相对关系如占比、固定宽高比、显示优先级等。当前自适应布局有4种：[线性布局](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/arkts-layout-development-linear-0000001504125349-V3?catalogVersion=V3)、[层叠布局](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/arkts-layout-development-stack-layout-0000001454605342-V3?catalogVersion=V3)、[弹性布局](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/arkts-layout-development-flex-layout-0000001504525013-V3?catalogVersion=V3)、[相对布局](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/arkts-layout-development-relative-layout-0000001455042516-V3?catalogVersion=V3)。自适应布局能力可以实现界面显示随外部容器大小连续变化。
-    响应式布局：当外部容器大小发生变化时，元素可以根据断点、栅格或特定的特征（如屏幕方向、窗口宽高等）自动变化以适应外部容器变化的布局能力。当前响应式布局能力有2种：[媒体查询](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/arkts-layout-development-media-query-0000001454445606-V3?catalogVersion=V3)、[栅格布局](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/arkts-layout-development-grid-layout-0000001454765270-V3?catalogVersion=V3)。
-   [GridRow](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-container-gridrow-0000001478181425-V3)：栅格容器组件，仅可以和栅格子组件（GridCol）在栅格布局场景中使用。
-   [GridCol](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-container-gridcol-0000001427744832-V3)：栅格子组件，必须作为栅格容器组件（GridRow）的子组件使用。

### 相关权限

不涉及

### 使用说明

1. 在手机、折叠屏和平板上安装应用，打开会显示不同形态的用户界面。

### 约束与限制
1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9。
3. 本示例需要使用DevEco Studio 3.1 Release版本进行编译运行。


