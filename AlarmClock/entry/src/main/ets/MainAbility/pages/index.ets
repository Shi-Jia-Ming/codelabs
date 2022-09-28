import reminderAgent from'@ohos.reminderAgent';
import notification from '@ohos.notification'
import {Detail, ClockItem} from './detail'
import dataStorage from '@ohos.data.storage'
import featureAbility from '@ohos.ability.featureAbility'
import display from '@ohos.display';

@Entry
@Component
struct Index {
  private times: Array<number> = [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 1, 2] //时间刻度值
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  @State canvasSize: number = 170 // canvas宽高
  @State canvasOnScreenRatio: number = 3 // 时钟画布是屏幕的几分之一，竖屏：宽度的1/3，此值为3。横屏：高度的1/4，此值为4
  private radius: number = 0 // 半径
  private sixtyParts = Math.PI * 2 / 60 // 60等分
  private twelveParts = Math.PI * 2 / 12 // 12等分
  @State screenWidth: number = 0 // 屏幕宽度
  @State screenHeight: number = 0 // 屏幕高度
  @State interval: any = -1 // 定时器
  @State showClock: boolean = true // true显示时钟 false显示时间
  @State showIndex: boolean = true // true主界面 false详情界面
  @State nowIndex: number = -1 // 新增时值为-1，修改时值为当前数组索引
  @State @Watch("resetAlarm") clockItems: Array<ClockItem> = [] // 闹钟-定时
  @State modifyMsg: Array<number> = [-1, -1, -1] // 记录clockItems变化数据，三个数值，第一个：0新增、1修改、2删除；第二个：修改闹钟的index值；第三个：闹钟reminderId

  aboutToAppear() {
    // 查询数据库定时数据
    this.getData()
    // 获取屏幕宽高
    display.getDefaultDisplay((err, data) => {
      if(data.densityPixels != 3) {
        this.canvasOnScreenRatio = 1
      }else {
        this.canvasOnScreenRatio = 2
      }
      this.screenWidth = data.width
      this.screenHeight = data.height
      // 设置canvas尺寸，竖屏取值为宽高最小值的1/2，横屏取值为宽高最小值的1/4
      this.canvasOnScreenRatio *= (this.screenWidth < this.screenHeight ? 2 : 4)
      this.canvasSize = px2vp(Math.min(this.screenWidth, this.screenHeight) / this.canvasOnScreenRatio)
      // 重置原点到canvas画布中间
      this.context.translate(this.canvasSize, this.canvasSize / 2)
    });
  }

  build() {
    Stack({alignContent: Alignment.Bottom}) {
      Column() {
        Column(){
          Text('闹钟')
            .fontSize(30)
            .margin({left: 20})
        }.height(80).width('100%').alignItems(HorizontalAlign.Start)
        Canvas(this.context)
          .height(this.canvasSize)
          .aspectRatio(2.0)
          .onReady(() =>{
            // 获取半径
            this.radius = this.canvasSize / 2.5 - 5
            var that = this
            // 避免时钟闪现，先画一遍
            that.draw()
            // 定时器
            this.interval = setInterval(function() {
              that.draw()
            }, 1000)
          })
          .onClick(() => {
            // 切换指针表盘和数字时钟
            this.showClock = !this.showClock
          })

        // 闹钟列表
        List({ space: 10, initialIndex: 0 }) {
          ForEach(this.clockItems.map((item, index) => {
            return { i: index, data: item }
          }),
            (item, index) => {
              ListItem() {
                Stack({alignContent: Alignment.End}) {
                  Column() {
                    Row() {
                      Text(item.data.partition).fontSize(15)
                      Text(item.data.hour+ ':' + item.data.minute).fontSize(25).margin({left: 10})
                    }
                    Row() {
                      Text(item.data.name).fontSize(15)
                      Text('不重复').fontSize(15).margin({left: 10})
                    }.margin({top: 5})
                  }
                  .width('100%')
                  .margin({left: 10})
                  .alignItems(HorizontalAlign.Start)
                  Toggle({ type: ToggleType.Switch, isOn: item.data.open })
                    .selectedColor(0x39a2db)
                    .switchPointColor(0xe5ffffff)
                    .onChange((isOn: boolean) => {
                      item.data.open = !item.data.open
                      console.info('Component status:' + isOn)
                      // 关闭、打开闹钟
                      this.modifyMsg = [item.data.open ? 0 : 2, index, item.data.reminderId]
                      this.resetAlarm()
                    })
                    .width(30)
                    .aspectRatio(1.0)
                }
                .width('90%')
                .height(60)
                .backgroundColor('#E2E2E2')
                .borderRadius(10)
              }.width('100%')
              .onClick(() => {
                this.nowIndex = index // 下标
                this.showIndex = false // 展示修改界面
              })
            },
            item => item.data.name.toString())
        }
        .listDirection(Axis.Vertical) // 排列方向
        .flexGrow(1)
        .margin({top: 10})
      }
      .width('100%')
      .height('100%')
      .visibility(this.showIndex ? Visibility.Visible : Visibility.Hidden)

      Column(){
        Detail({showIndex: $showIndex, clockItems: $clockItems, nowIndex: $nowIndex, modifyMsg: $modifyMsg})
      }.width('100%').height('100%')
      .visibility(this.showIndex ? Visibility.Hidden : Visibility.Visible)

      Image('images/add.png')
        .width(70)
        .aspectRatio(1.0)
        .margin({bottom: 10})
        .onClick(() => {
          this.nowIndex = -1 // 新增闹钟，值为-1
          this.showIndex = false // 展示新增闹钟界面
        }).visibility(this.showIndex ? Visibility.Visible : Visibility.Hidden)
    }
    .width('100%')
    .height('100%')
  }

  // 开始绘制
  private draw(): void{
    // 清空绘制
    this.context.clearRect(-this.canvasSize, this.canvasSize / -2, this.canvasSize * 2, this.canvasSize)
    // 获取当前时间
    let date = new Date()
    if(this.showClock) {
      // 画表盘
      this.drawDials()
      // 画秒针
      this.drawSecond(date.getSeconds())
      // 画分针
      this.drawMinute(date.getMinutes(), date.getSeconds())
      // 画时针
      this.drawHour(date.getHours(), date.getMinutes())
    } else {
      this.drawTime(date.getHours().toString(), date.getMinutes().toString(), date.getSeconds().toString())
    }
  }

  // 画时间
  private drawTime(hour: string, minute: string, second: string): void{
    let time = this.fillZero(hour) + ':' + this.fillZero(minute) + ':' + this.fillZero(second)
    this.context.save()
    this.context.font = '100px'
    this.context.beginPath()
    this.context.textAlign = 'center'
    this.context.fillText(time, 0, 0)
    this.context.restore()
  }

  // 补零：HH:mm:ss
  private fillZero(val): string{
    var len = val.length;
    while(len < 2) {
      val = "0" + val;
      len++;
    }
    return val;
  }

  // 画表盘
  private drawDials(): void{
    // 画原点
    this.context.save()
    this.context.beginPath()
    this.context.arc(0, 0, 5, 0, Math.PI * 2)
    this.context.fill()
    this.context.stroke()
    this.context.restore()
    // 字体大小
    this.context.font = '20px'
    // 画圆
    this.context.save()
    this.context.lineWidth = 5
    this.context.beginPath()
    this.context.arc(0, 0, this.radius, 0, 2 * Math.PI)
    this.context.stroke()
    this.context.restore()

    // 画刻度
    for (let n = 1; n <= 60; n++) {
      // 从三点钟方向开始获取60个刻度的角度
      var theta = (n - 3) * (Math.PI * 2) / 60;
      this.context.save()
      // 刻度宽度为2
      this.context.lineWidth = 2
      this.context.beginPath()
      // 刻度起始位置
      var x_move = this.radius * Math.cos(theta);
      var y_move = this.radius * Math.sin(theta);
      // 非整点刻度结束位置
      var x_to = (this.radius - 5) * Math.cos(theta);
      var y_to = (this.radius - 5) * Math.sin(theta);
      // 整点刻度
      if((n-3) % 5 == 0) {
        //整点刻度宽度
        this.context.lineWidth = 3
        // 整点刻度结束位置
        x_to = (this.radius - 10) * Math.cos(theta);
        y_to = (this.radius - 10) * Math.sin(theta);
        // 整点时间位置
        var x_time = (this.radius - 25) * Math.cos(theta);
        var y_time = (this.radius - 25) * Math.sin(theta);
        // 绘制整点时间
        this.context.fillText(this.times[(n - 3) / 5] + '', x_time - 5, y_time + 3)
      }
      // 绘制刻度线
      this.context.moveTo(x_move, y_move)
      this.context.lineTo(x_to, y_to)
      this.context.stroke()
      this.context.restore()
    }
  }

  // 画秒针
  private drawSecond(second: number): void{
    this.context.save()
    this.context.fillStyle = 'red'
    var theta = (second - 15) * 2 * Math.PI / 60;
    this.context.rotate(theta)
    this.context.beginPath()
    this.context.moveTo(-15, -3);
    this.context.lineTo(-15, 3);
    this.context.lineTo(this.radius * 0.9, 1);
    this.context.lineTo(this.radius * 0.9, -1);
    this.context.fill();
    this.context.restore();
  }

  // 画分针
  private drawMinute(minute: number, second: number): void{
    this.context.save()
    var theta = ((minute + second / 60 - 15) * 2 * Math.PI / 60)
    this.context.rotate(theta)
    this.context.beginPath()
    this.context.moveTo(-15, -4);
    this.context.lineTo(-15, 4);
    this.context.lineTo(this.radius * 0.8, 1);
    this.context.lineTo(this.radius * 0.8, -1);
    this.context.fill();
    this.context.restore();
  }

  // 画时针
  private drawHour(hour:number, minute: number): void{
    this.context.save()
    var theta = ((hour + minute / 60 - 3) * 2 * Math.PI / 12)
    this.context.rotate(theta)
    this.context.beginPath()
    this.context.moveTo(-15, -5);
    this.context.lineTo(-15, 5);
    this.context.lineTo(this.radius * 0.5, 1);
    this.context.lineTo(this.radius * 0.5, -1);
    this.context.fill();
    this.context.restore();
  }

  // 监听闹钟数据变化
  private resetAlarm(): void{
    let opeNum = this.modifyMsg[0]
    let index = this.modifyMsg[1]
    let reminderId = this.modifyMsg[2]
    if(opeNum == 0) {
      // 新增
      reminderAgent.publishReminder(this.addAlarm(this.clockItems[index], index), (err, reminderId) =>{
        this.clockItems[index].reminderId = reminderId // 设置reminderId
        this.saveData()
      });
    } else if(opeNum == 1) {
      // 修改，先停止原先的闹钟再开启修改后的
      reminderAgent.cancelReminder(reminderId)
      reminderAgent.publishReminder(this.addAlarm(this.clockItems[index], index), (err, reminderId) =>{
        this.clockItems[index].reminderId = reminderId // 设置reminderId
        this.saveData()
      });
    } else if(opeNum == 2) {
      // 删除
      reminderAgent.cancelReminder(reminderId)
      this.saveData()
    }
  }

  // 根据闹钟数据，新增闹钟
  private addAlarm(item: ClockItem, index: number): reminderAgent.ReminderRequestAlarm{
    return {
      reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
      hour: item.partition == '上午' ? parseInt(item.hour) : ((parseInt(item.hour) + 12) == 24 ? 0 : parseInt(item.hour) + 12), // 小时
      minute: parseInt(item.minute), // 分钟
      daysOfWeek: [1, 2, 3, 4, 5, 6, 7], // 星期几
      actionButton: [
        {
          title: "close",
          type: reminderAgent.ActionButtonType.ACTION_BUTTON_TYPE_CLOSE
        },
        {
          title: "snooze",
          type: reminderAgent.ActionButtonType.ACTION_BUTTON_TYPE_SNOOZE
        },
      ],
      ringDuration: item.duration * 60, // 响铃时长
      snoozeTimes: item.intervalTimes, // 延迟提醒次数
      timeInterval: item.intervalMinute, // 延迟提醒间隔 最小五分钟
      title: item.name,
      content: item.partition + item.hour + ':' + item.minute,
      expiredContent: "this reminder has expired",
      snoozeContent: "remind later",
      notificationId: index,
      slotType: notification.SlotType.SOCIAL_COMMUNICATION
    }
  }

  // 保存闹钟数据
  private saveData() {
    featureAbility.getContext().getFilesDir((err, path) => {
      // 获取数据目录
      let storage = dataStorage.getStorageSync(path + '/mystore')
      // 将闹钟数据转换成字符串保存
      storage.putSync('clockData', JSON.stringify(this.clockItems))
      // 刷新数据
      storage.flushSync()
    });
  }

  // 查询闹钟数据
  private getData() {
    featureAbility.getContext().getFilesDir((err, path) => {
      // 获取数据目录
      let storage = dataStorage.getStorageSync(path + '/mystore')
      // 查询闹钟数据，无数据返回''
      this.clockItems = JSON.parse(storage.getSync('clockData', '').toString())
    })
  }
}