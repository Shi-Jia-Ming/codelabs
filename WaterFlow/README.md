# WaterFlow容器的使用（ArkTS）

### 简介

基于WaterFlow容器，实现瀑布流布局。

![waterflow](./screenshots/device/waterflow.gif)

### 相关概念

- [WaterFlow](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-container-waterflow-0000001582933637-V3?catalogVersion=V3)：瀑布流容器，由“行”和“列”分割的单元格所组成，通过容器自身的排列规则，将不同大小的“项目”自上而下，如瀑布般紧密布局。
- [FlowItem](https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/ts-container-flowitem-0000001532454252-V3)：瀑布流容器的子组件。
- [LazyForEach](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/arkts-rendering-control-lazyforeach-0000001524417213-V3)：LazyForEach从提供的数据源中按需迭代数据，并在每次迭代过程中创建相应的组件。当LazyForEach在滚动容器中使用了，框架会根据滚动容器可视区域按需创建组件，当组件划出可视区域外时，框架会进行组件销毁回收以降低内存占用。

### 相关权限

不涉及

### 使用说明

1. 启动应用，上下滑动瀑布流展示区域，展示瀑布流布局。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9。
3. 本示例需要使用DevEco Studio 3.1 Release版本进行编译运行。
