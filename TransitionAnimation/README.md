# 转场动画的使用（ArkTS）

### 简介

在本教程中，我们将会通过一个简单的样例，学习如何基于ArkTS的声明式开发范式开发转场动画。其中包含页面间转场、组件内转场以及共享元素转场。

![image](screenshots/device/1.gif)

### 相关概念

- [页面间转场](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-page-transition-animation-0000001477981233-V3?catalogVersion=V3) ：页面转场通过在全局pageTransition方法内配置页面入场组件和页面退场组件来自定义页面转场动效。
- [组件内转场](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-transition-animation-component-0000001427902496-V3?catalogVersion=V3) ：组件转场主要通过transition属性进行配置转场参数，在组件插入和删除时进行过渡动效，主要用于容器组件子组件插入删除时提升用户体验（需要配合animateTo才能生效，动效时长、曲线、延时跟随animateTo中的配置）。

- [共享元素转场](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-transition-animation-shared-elements-0000001428061776-V3?catalogVersion=V3) ：通过修改共享元素的sharedTransition属性设置元素在不同页面之间过渡动效。例如，如果两个页面使用相同的图片（但位置和大小不同），图片就会在这两个页面之间流畅地平移和缩放。

### 相关权限

不涉及

### 使用说明

1. 在Index页面，点击**页面间转场：底部滑入**按钮，BottomTransition页面以底部切入的动画形式切入，并显示图片内容。
2. 在Index页面，点击**页面间转场：自定义1**按钮，CustomTransition页面以自定义1的动画形式切入，并显示图片内容。
3. 在Index页面，点击**页面间转场：自定义2**按钮，FullCustomTransition页面以自定义1的动画形式切入，并显示图片内容。
4. 在Index页面，点击**组件内转场**按钮，在ComponentTransition页面点击**Toggle**按钮，页面内元素以动画形式切入。
5. 在Index页面，点击**共享元素转场**按钮，在ShareItem页面点击图片，SharePage页面从原图位置放大显示，点击返回按钮，SharePage从原图位置消失。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9。
3. 本示例需要使用DevEco Studio 3.1 Release版本进行编译运行。