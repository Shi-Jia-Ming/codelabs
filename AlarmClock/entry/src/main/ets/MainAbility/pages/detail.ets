@Component
export struct Detail {
  @Link showIndex: boolean //true主界面 false详情界面
  @Link @Watch('resetValue') nowIndex: number // 新增时值为-1，修改时值为当前数组索引
  @State partitionIndex: number = 1
  private partitions: string[] = ['上午', '下午'] // 时段
  @State hourIndex: number = 1
  private hours: string[] = ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'] // 小时
  @State minuteIndex: number = 1
  private minutes: string[] = ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12',
                               '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24',
                               '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36',
                               '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48',
                               '49', '50', '51', '52', '53', '54', '55', '56', '57', '58', '59', '00',
                              ] // 分钟
  @State timedArray: Array<string> = ['下午', '02', '02'] //闹钟时间，三个值分别为：上下午、小时、分钟
  @Link clockItems: Array<ClockItem> // 闹钟-定时数组
  @Link modifyMsg: Array<number> // 记录clockItems变化数据，三个数值，第一个：0新增、1修改、2删除；第二个：修改闹钟的index值；第三个：闹钟reminderId
  @Provide clockName: string = '闹钟' // 闹钟名，默认闹钟
  @Provide duration: number = 5 // 响铃时长， 默认5分钟
  @Provide intervalMinute: number = 10 // 再响间隔分钟，默认10分钟
  @Provide intervalTimes: number = 3 // 再响间隔次数，默认3次

  // 闹钟名弹框
  dialogControllerName : CustomDialogController = new CustomDialogController({
    builder: DialogName({action: this.onAccept}),
    autoCancel: true
  });
  // 响铃时长弹框
  dialogControllerDuration : CustomDialogController = new CustomDialogController({
    builder: DialogDuration({action: this.onAccept}),
    autoCancel: true
  });
  //再响时长弹框
  dialogControllerInterval : CustomDialogController = new CustomDialogController({
    builder: DialogInterval({action: this.onAccept}),
    autoCancel: true
  });

  onAccept() {
  }

  build() {
    Stack({alignContent: Alignment.Bottom}) {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center}) {
        Stack({alignContent: Alignment.End}) {
          Row() {
            // 取消
            Image('images/cancel.png')
              .width(40)
              .aspectRatio(1.0)
              .onClick(() => {
                this.cancel()
              })
            // 描述
            Text(this.nowIndex == -1 ? '新建闹钟' : '修改闹钟')
              .fontSize(20)
              .margin({left: 20})
          }
          .height('100%')
          .width('100%')
          // 确定
          Image('images/confirm.png')
            .width(40)
            .aspectRatio(1.0)
            .onClick(() => {
              this.confirm()
            })
        }
        .margin({top: 20, bottom: 15})
        .width('90%').height(50)

        Scroll() {
          Column() {
            // 时间选择
            Row() {
              // 上午下午
              TextPicker({range: this.partitions, selected: this.partitionIndex})
                .width('33%')
                .onChange((value: string, index: number) => {
                  this.timedArray[0] = value
                  this.partitionIndex = index
                  console.info('Picker item changed, value: ' + value + ', index: ' + index)
                })
              // 小时
              TextPicker({range: this.hours, selected: this.hourIndex})
                .width('33%')
                .onChange((value: string, index: number) => {
                  this.timedArray[1] = value
                  this.hourIndex = index
                  console.info('Picker item changed, value: ' + value + ', index: ' + index)
                })
              // 分钟
              TextPicker({range: this.minutes, selected: this.minuteIndex})
                .width('33%')
                .onChange((value: string, index: number) => {
                  this.timedArray[2] = value
                  this.minuteIndex = index
                  console.info('Picker item changed, value: ' + value + ', index: ' + index)
                })
            }
            .backgroundColor('#E2E2E2')
            .borderRadius(10)

            // 信息
            Stack({alignContent: Alignment.End}) {
              Row() {
                Text('闹钟名')
                  .fontSize(20)
              }
              .height('100%')
              .width('100%')
              Text(this.clockName + ' >')
                .fontSize(15)
                .fontColor('#E2E2E2')
            }
            .width('100%')
            .height(30)
            .margin({top: 20, bottom: 10})
            .onClick(() => {
              this.dialogControllerName.open()
            })

            Divider().margin({bottom: 10})

            Stack({alignContent: Alignment.End}) {
              Row() {
                Text('响铃时长')
                  .fontSize(20)
              }
              .height('100%')
              .width('100%')
              Text(this.duration.toFixed(0) + ' 分钟 >')
                .fontSize(15)
                .fontColor('#E2E2E2')
            }
            .width('100%')
            .height(30)
            .margin({bottom: 10})
            .onClick(() => {
              this.dialogControllerDuration.open()
            })

            Divider().margin({bottom: 10})

            Stack({alignContent: Alignment.End}) {
              Row() {
                Text('再响间隔')
                  .fontSize(20)
              }
              .height('100%')
              .width('100%')
              Text(this.intervalMinute.toFixed(0) + ' 分钟，' + this.intervalTimes.toFixed(0) + ' 次 >')
                .fontSize(15)
                .fontColor('#E2E2E2')
            }
            .width('100%')
            .height(30)
            .onClick(() => {
              this.dialogControllerInterval.open()
            })
          }
        }
        .flexGrow(1)
        .width('90%')
      }
      .width('100%')
      .height('100%')

      // 删除按钮
      Text('删除')
        .width('50%')
        .height(45)
        .textAlign(TextAlign.Center)
        .fontSize(25)
        .fontColor('#DE1A33')
        .backgroundColor('#E2E2E2')
        .borderRadius(20)
        .margin({bottom: 10})
        .onClick(() => {
          this.delete()
        })
       .visibility(this.nowIndex == -1 ? Visibility.None : Visibility.Visible)
    }
    .width('100%')
    .height('100%')
  }

  // 确定 '√'
  private confirm(): void{
    // 新增
    if(this.nowIndex == -1) {
      // 判断当前闹钟时间是否存在
      let exist = false
      this.clockItems.forEach(item => {
        if(item.partition == this.timedArray[0] && item.hour == this.timedArray[1] && item.minute == this.timedArray[2]) {
          exist = true
          return
        }
      })
      if(exist) {
        AlertDialog.show({ message: '该时间闹钟已添加！' })
      } else {
        this.modifyMsg = [0, this.clockItems.length, this.clockItems.length] // 新增信息
        this.clockItems.push(new ClockItem(this.clockName, this.partitionIndex, this.timedArray[0], this.hourIndex, this.timedArray[1],
          this.minuteIndex, this.timedArray[2], this.duration, this.intervalMinute, this.intervalTimes, true))
        this.showIndex = true
      }
    } else {
      // 修改
      this.modifyMsg = [1, this.nowIndex,this.clockItems[this.nowIndex].reminderId] // 修改信息
      this.clockItems[this.nowIndex] = new ClockItem(this.clockName, this.partitionIndex, this.timedArray[0], this.hourIndex, this.timedArray[1],
        this.minuteIndex, this.timedArray[2], this.duration, this.intervalMinute, this.intervalTimes, true)
      this.showIndex = true
    }

  }

  // 取消 '×'
  private cancel(): void{
    this.showIndex = true
  }

  // 删除
  private delete(): void{
    this.modifyMsg = [2, this.nowIndex, this.clockItems[this.nowIndex].reminderId] // 删除信息
    this.clockItems.splice(this.nowIndex, 1)
    this.timedArray = ['下午', '02', '02']
    this.partitionIndex = 1
    this.hourIndex = 1
    this.minuteIndex = 1
    this.clockName = '闹钟'
    this.duration = 5
    this.intervalMinute = 10
    this.intervalTimes = 3
    this.showIndex = true
  }

  // 进入此界面触发
  resetValue(): void{
    // 修改
    if (this.nowIndex != -1){
      // 设置值 ClockItem
      let item = this.clockItems[this.nowIndex]
      this.timedArray = [item.partition, item.hour, item.minute]
      this.partitionIndex = item.partitionIndex
      this.hourIndex = item.hourIndex
      this.minuteIndex = item.minuteIndex
      this.clockName = item.name
      this.duration = item.duration
      this.intervalMinute = item.intervalMinute
      this.intervalTimes = item.intervalTimes
    }else {
      // 重置值 ClockItem
      this.timedArray = ['下午', '02', '02']
      this.partitionIndex = 1
      this.hourIndex = 1
      this.minuteIndex = 1
      this.clockName = '闹钟'
      this.duration = 5
      this.intervalMinute = 10
      this.intervalTimes = 3
    }
  }
}

/**
 * 闹钟-定时类
 * @param name 闹钟名
 * @param partitionIndex 上午、下午下标
 * @param partition 上午、下午
 * @param hourIndex 时下标
 * @param hour 时
 * @param minuteIndex 分下标
 * @param minute 分
 * @param duration 响铃时长
 * @param intervalMinute 再响间隔时间（分钟）
 * @param intervalTimes 再响间隔次数
 * @param open 是否开启 true false
 * @param reminderId 闹钟的reminderId
 */
@Observed export class ClockItem {
  name: string
  partitionIndex: number
  partition: string
  hourIndex: number
  hour: string
  minuteIndex: number
  minute: string
  duration: number
  intervalMinute: number
  intervalTimes: number
  open: boolean
  reminderId: number

  constructor(name: string, partitionIndex: number, partition: string,
              hourIndex: number, hour: string, minuteIndex: number, minute: string,
              duration: number, intervalMinute: number, intervalTimes: number, open: boolean) {
    this.name = name
    this.partitionIndex = partitionIndex
    this.partition = partition
    this.hourIndex = hourIndex
    this.hour = hour
    this.minuteIndex = minuteIndex
    this.minute = minute
    this.duration = duration
    this.intervalMinute = intervalMinute
    this.intervalTimes = intervalTimes
    this.open = open
  }
}

// 闹钟名弹框
@CustomDialog
struct DialogName {
  @Consume clockName: string
  name: string
  controller: CustomDialogController;
  action: () => void;

  build() {
    Column(){
      Text('闹钟名').fontSize(20).width('90%').textAlign(TextAlign.Start).margin({top: 10})
      TextArea({text: this.clockName})
        .width('90%').margin({top: 20})
        .onChange((value: string) => {
          this.name = value
        })
      Divider().width('90%').margin({top: 10})
      Row() {
        Text('取消').fontSize(15).width('50%').textAlign(TextAlign.Center).fontColor('#17A98E')
        .onClick(() => {
          this.controller.close();
        })
        Text('确定').fontSize(15).width('50%').textAlign(TextAlign.Center).fontColor('#17A98E')
          .onClick(() => {
            this.clockName = this.name
            this.controller.close();
          })
      }.margin({top: 10, bottom: 20})
    }.width('100%')
  }
}

// 响铃时长弹框
@CustomDialog
struct DialogDuration {
  @Consume duration: number
  private durations: Array<number> = [1, 5, 10, 15, 20, 30] //响铃时长，分钟
  controller: CustomDialogController;
  action: () => void;

  build() {
    Column(){
      Text('响铃时长').fontSize(20).width('90%').textAlign(TextAlign.Start).margin({top: 10, bottom: 10})
      ForEach(this.durations, item => {
        Stack({alignContent: Alignment.End}) {
          Row() {
            Text(item + ' 分钟')
          }.width('100%')
          Radio({ value: item, group: 'radioGroup' }).checked(item == this.duration ? true: false)
            .height(20)
            .width(20)
            .onChange((value: boolean) => {
              this.controller.close();
              this.duration = item
            })
        }.width('90%')
        Divider().width('90%')
      })
      Row() {
        Text('取消').fontSize(15).width('100%').textAlign(TextAlign.Center).fontColor('#17A98E')
          .onClick(() => {
            this.controller.close();
          })
      }.margin({top: 10, bottom: 20})
    }.width('100%')
  }
}

// 再响间隔弹框
@CustomDialog
struct DialogInterval {
  @Consume intervalMinute: number // 再响间隔分钟，默认10分钟
  @Consume intervalTimes: number // 再响间隔次数，默认3次
  @State intervalMinuteSelect: number = 0 // 再响间隔分钟，界面选择值
  @State intervalTimesSelect: number = 0 // 再响间隔次数，界面选择值
  controller: CustomDialogController;
  action: () => void;

  build() {
    Column(){
      Text('再响间隔').fontSize(20).width('90%').textAlign(TextAlign.Start).margin({top: 10})
      Text('响铃间隔时间（分钟）').fontSize(10).width('90%').textAlign(TextAlign.Start).margin({top: 10})
      Row() {
        Slider({
          value: this.intervalMinuteSelect,
          min: 5,
          max: 30,
          step: 5,
          style: SliderStyle.OutSet
        })
          .blockColor(Color.Blue)
          .trackColor(Color.Gray)
          .selectedColor(Color.Blue)
          .showSteps(true)
          .showTips(true)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.intervalMinuteSelect = value
          })
        Text(this.intervalMinuteSelect.toFixed(0)).fontSize(16)
      }
      .padding({ top: 30 })
      .width('90%')
      Divider().width('90%').margin({top: 10})
      Text('重复响铃次数').fontSize(10).width('90%').textAlign(TextAlign.Start).margin({top: 10})
      Row() {
        Slider({
          value: this.intervalTimesSelect,
          min: 0,
          max: 10,
          step: 2,
          style: SliderStyle.OutSet
        })
          .blockColor(Color.Blue)
          .trackColor(Color.Gray)
          .selectedColor(Color.Blue)
          .showSteps(true)
          .showTips(true)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.intervalTimesSelect = value
          })
        Text(this.intervalTimesSelect.toFixed(0)).fontSize(16)
      }
      .padding({ top: 50 })
      .width('90%')
      Row() {
        Text('取消').fontSize(15).width('50%').textAlign(TextAlign.Center).fontColor('#17A98E')
          .onClick(() => {
            this.controller.close();
          })
        Text('确定').fontSize(15).width('50%').textAlign(TextAlign.Center).fontColor('#17A98E')
          .onClick(() => {
            this.intervalMinute = this.intervalMinuteSelect
            this.intervalTimes = this.intervalTimesSelect
            this.controller.close();
          })
      }.margin({top: 10, bottom: 20})
    }.width('100%')
  }
  aboutToAppear(): void{
    this.intervalMinuteSelect = this.intervalMinute // 再响间隔分钟，界面选择值
    this.intervalTimesSelect = this.intervalTimes // 再响间隔次数，界面选择值
  }
}