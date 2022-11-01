<div style="text-align: center;font-size: xxx-large" >hvigor-ohos-plugin</div>
<div style="text-align: center">A new hvigor plugin for OpenHarmonyOS application</div>

## hvigor-ohos-plugin介绍
***
- 基于hvigor构建工具开发的一个插件，利用hvigor的任务编排机制完成OpenHarmony应用构建任务流的执行，完成OpenHarmony hap/app包的构建打包，只服务于OpenHarmony应用开发

- 基于hvigor 的build-profile.json5扩展了相应的OpenHarmony应用的编译配置字段，用于定制OpenHarmony应用编译构建的相关任务

## 安装使用
***
- 安装相应的nodejs与npm
- 通过npm命令行安装hvigor 与 hvigor-ohos-plugin
```shell
  npm install @ohos/hvigor
  npm install @ohos/hvigor-ohos-plugin
```
- 在DevEco Studio内使用Hvigor
  工程级package.json内配置:
```json
  "dependencies": {
    "@ohos/hvigor": "1.0.6", 
    "@ohos/hvigor-ohos-plugin": "1.0.6"
  }
```
注：
hvigor-ohos-plugin是基于hvigor插件机制开发的一款插件，服务于OpenHarmonyOS应用构建工作流，完成HAP/APP打包。详细指导：
<a href = "https://developer.harmonyos.com/cn/docs/documentation/doc-guides/ohos-building-overview-0000001263360495" >DevEco Studio</a>

- 通过扩展hvigor -p参数完成OpenHarmony 应用或者服务的构建打包：

   Hvigor工程当前模块分为根项目 project，和子模块 module，不支持模块嵌套，支持目录嵌套(具体
  参考build-profile.json5说明)
  - 不指定: 则默认执行project和所有module的task,没有task则跳过
  - -m project：只在project级别模块中执行对应的task，没有对应task则报错
  - -m module：在所有module级别的模块中只执行对应的task
  ```shell
    hvigor clean -m project //clean project级别的build 目录
    hvigor assembleHap //执行project和module级别的打包hap的任务
  ```
  设置Hvigor运行时的额外参数，例如-p myprop=myvalue
  ```shell
     hvigor assembleApp -m project -p product=vip //指定打包时具体的product,默认为default 可不指定
     hvigor assembleHap -m module=entry //指定需要打包hap的具体模块,不指定时默认打所有产物为HAP的模块
  ```
  
## 约束
***
    node版本要求： v14.18.3以及以上版本

