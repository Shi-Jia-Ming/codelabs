# 动效示例（ArkTS）
### 简介
利用ArkTS为组件的属性添加过渡的动态效果，提升用户体验。

本篇codeLab实现如下功能
- 点击动画触发按钮，动画图标会由中心旋转而出，再次点击中心按钮，动画图标将由四周缩回。
- 点击单个图标会触发图标的缩放、旋转、透明度变化的动画效果。
- 调节滑动条会控制动画图标的数量，最少三个，最多六个。

最终效果图如下:
![image](screenshots/animation.gif)

### 相关概念 

[显式动画](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-explicit-animation-0000001281480722)：提供全局animateTo显式动画接口来指定有闭包代码导致的状态变化插入过渡动画效果。
[属性动画](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-animatorproperty-0000001333321185)：组件的通用属性发生变化时，可以创建属性动画进行渐变，提升用户体验。
[Slider](https://developer.harmonyos.com/cn/docs/documentation/doc-references/ts-basic-components-slider-0000001281201142):  滑动条组件，用来快速调节设置值，如音量、亮度等。

### 约束与限制
1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9及以上版本SDK。
3. 本示例需要使用DevEco Studio 3.1 Canary1及以上版本进行编译运行。