# 使用DevEco Studio高效开发（ArkTS）

### 简介
本篇Codelab主要介绍使用DevEco Studio开发工具，高效开发登录应用的案例。效果如图所示：

![](screenshots/device/LoginDemo.gif)

### 相关概念

- [使用预览器查看应用/服务效果](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/previewer-0000001054328973-V3?catalogVersion=V3)：在HarmonyOS应用/服务开发过程中，DevEco Studio为开发者提供了UI界面预览功能，可以查看应用/服务的UI界面效果，方便开发者随时调整代码。
- [在Phone和Tablet中运行应用/服务](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/run_phone_tablat-0000001064774652-V3?catalogVersion=V3)：DevEco Studio为开发者提供本地真机运行HarmonyOS应用/服务功能，本地真机的界面渲染和操作体验更加流畅。
- [使用真机进行调试](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/ide_debug_device-0000001053822404-V3?catalogVersion=V3)：DevEco Studio提供了丰富的HarmonyOS应用/服务调试能力，支持JS、ArkTS、C/C++单语言调试和ArkTS/JS+C/C++跨语言调试能力。
- [HarmonyOS测试框架](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/harmonyos_jnit_jsunit-0000001092459608-V3?catalogVersion=V3#section7749201219561)：DevEco Studio支持应用/服务测试框架，包含HarmonyOS Test、HarmonyOS JUnit、OpenHarmony Test测试能力。

### 相关权限

不涉及

### 使用说明

1. 打开应用，进入登录页面。
2. 输入帐号和密码（任意字符），点击登录按钮跳转到应用首页。
3. 点击底部的Tabs，界面在“首页”和“我的”之间进行切换。
4. 在“我的”页面点击退出按钮退出到登录页面。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：华为手机或运行在DevEco Studio上的华为手机设备模拟器。
2. 本示例为Stage模型，支持API version 9及以上版本SDK。
3. 本示例需要使用DevEco Studio 3.1 Release及以上版本进行编译运行。