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
import libHello from "libhello.so"

@Entry
@Component
struct Index {
  private textInputController1: TextInputController = new TextInputController()
  private textInputController2: TextInputController = new TextInputController()
  private tittle: string = '调用C标准库示例'
  private message: string = '计算两个给定数平方和的平方根√(x²+y²)'
  private tipsNum1: string = '请输入第一个数：'
  private tipsNum2: string = '请输入第二个数：'
  private tipsResult: string = '结果：'
  private buttonSubmit: string = '计算'
  @State result: string = '0'
  @State num1: number = 0.0
  @State num2: number = 0.0

  build() {
    Column() {
      Row(){
        Text(this.tittle).height('100%').align(Alignment.Center).fontSize(30).fontWeight(600)
      }.height(150).width('100%').justifyContent(FlexAlign.Center)
      Row(){
        Text(this.message).height('100%').align(Alignment.Center).fontSize(18).fontWeight(500)
      }.height(60).width('100%').justifyContent(FlexAlign.Center)
      Row(){
        Text(this.tipsNum1).fontColor(Color.Black).fontSize(14).width('35%').height('100%').margin({left:30})
        TextInput({ placeholder: '请输入第一个数字：', controller:this.textInputController1}).type(InputType.Number)
          .height('100%').width('50%').margin({left:5,right:10})
          .onChange(value =>{this.num1 = parseFloat(value)})
      }.height(50).width('100%').justifyContent(FlexAlign.Start)
      Row(){
        Text(this.tipsNum2).fontColor(Color.Black).fontSize(14).width('35%').height('100%').margin({left:30})
        TextInput({ placeholder: '请输入第二个数字：', controller:this.textInputController2}).type(InputType.Number)
          .height('100%').width('50%').margin({left:5,right:10})
          .onChange(value =>{this.num2 = parseFloat(value)})
      }.height(50).width('100%').margin({top:20})
      Row(){
        Text(this.tipsResult).fontColor(Color.Black).fontSize(24).width('40%').height('100%').margin({left:30})
        Text(this.result).fontColor(Color.Black).fontSize(30).width('50%').height('100%').margin({left:5,right:10})
          .textOverflow({ overflow: TextOverflow.Clip })
      }.height(150).width('100%').justifyContent(FlexAlign.Start).touchable(false)
      Row(){
        Button(this.buttonSubmit)
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .margin({top:5})
          .height(60)
          .width(150)
          .onClick(() => {
            let resultTemp = libHello.hyPot(this.num1,this.num2)
            this.result = resultTemp.toFixed(2).toString()
          })
      }.height(80).width('100%').justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}
