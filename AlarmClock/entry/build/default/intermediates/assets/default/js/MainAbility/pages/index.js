var _bd36c6ddc4679e9c98f39e86a358b589;
/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
/******/ 	var __webpack_modules__ = ({

/***/ "../../../../../../HarmonyOS/gitee/codelabs_xllenga/AlarmClock/entry/src/main/ets/MainAbility/pages/detail.ets":
/*!*********************************************************************************************************************!*\
  !*** ../../../../../../HarmonyOS/gitee/codelabs_xllenga/AlarmClock/entry/src/main/ets/MainAbility/pages/detail.ets ***!
  \*********************************************************************************************************************/
/***/ (function(__unused_webpack_module, exports) {


var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
exports.ClockItem = exports.Detail = void 0;
class Detail extends View {
    constructor(compilerAssignedUniqueChildId, parent, params) {
        super(compilerAssignedUniqueChildId, parent);
        this.__showIndex = new SynchedPropertySimpleTwoWay(params.showIndex, this, "showIndex");
        this.__nowIndex = new SynchedPropertySimpleTwoWay(params.nowIndex, this, "nowIndex");
        this.__partitionIndex = new ObservedPropertySimple(1, this, "partitionIndex");
        this.partitions = ['上午', '下午'] // 时段
        ;
        this.__hourIndex = new ObservedPropertySimple(1, this, "hourIndex");
        this.hours = ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'] // 小时
        ;
        this.__minuteIndex = new ObservedPropertySimple(1, this, "minuteIndex");
        this.minutes = ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12',
            '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24',
            '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36',
            '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48',
            '49', '50', '51', '52', '53', '54', '55', '56', '57', '58', '59', '00',
        ] // 分钟
        ;
        this.__timedArray = new ObservedPropertyObject(['下午', '02', '02'] //闹钟时间，三个值分别为：上下午、小时、分钟
        , this, "timedArray");
        this.__clockItems = new SynchedPropertyObjectTwoWay(params.clockItems, this, "clockItems");
        this.__modifyMsg = new SynchedPropertyObjectTwoWay(params.modifyMsg, this, "modifyMsg");
        this.__clockName = new ObservedPropertySimple('闹钟' // 闹钟名，默认闹钟
        , this, "clockName");
        this.addProvidedVar("clockName", this.__clockName);
        this.__duration = new ObservedPropertySimple(5 // 响铃时长， 默认5分钟
        , this, "duration");
        this.addProvidedVar("duration", this.__duration);
        this.__intervalMinute = new ObservedPropertySimple(10 // 再响间隔分钟，默认10分钟
        , this, "intervalMinute");
        this.addProvidedVar("intervalMinute", this.__intervalMinute);
        this.__intervalTimes = new ObservedPropertySimple(3 // 再响间隔次数，默认3次
        // 闹钟名弹框
        , this, "intervalTimes");
        this.addProvidedVar("intervalTimes", this.__intervalTimes);
        this.dialogControllerName = new CustomDialogController({
            builder: () => {
                let jsDialog = new DialogName("1", this, { action: this.onAccept });
                jsDialog.setController(this.
                // 闹钟名弹框
                dialogControllerName);
                View.create(jsDialog);
            },
            autoCancel: true
        }, this);
        this.dialogControllerDuration = new CustomDialogController({
            builder: () => {
                let jsDialog = new DialogDuration("2", this, { action: this.onAccept });
                jsDialog.setController(this.
                // 响铃时长弹框
                dialogControllerDuration);
                View.create(jsDialog);
            },
            autoCancel: true
        }, this);
        this.dialogControllerInterval = new CustomDialogController({
            builder: () => {
                let jsDialog = new DialogInterval("3", this, { action: this.onAccept });
                jsDialog.setController(this.
                //再响时长弹框
                dialogControllerInterval);
                View.create(jsDialog);
            },
            autoCancel: true
        }, this);
        this.updateWithValueParams(params);
        this.declareWatch("nowIndex", this.resetValue);
    }
    updateWithValueParams(params) {
        if (params.partitionIndex !== undefined) {
            this.partitionIndex = params.partitionIndex;
        }
        if (params.partitions !== undefined) {
            this.partitions = params.partitions;
        }
        if (params.hourIndex !== undefined) {
            this.hourIndex = params.hourIndex;
        }
        if (params.hours !== undefined) {
            this.hours = params.hours;
        }
        if (params.minuteIndex !== undefined) {
            this.minuteIndex = params.minuteIndex;
        }
        if (params.minutes !== undefined) {
            this.minutes = params.minutes;
        }
        if (params.timedArray !== undefined) {
            this.timedArray = params.timedArray;
        }
        if (params.clockName !== undefined) {
            this.clockName = params.clockName;
        }
        if (params.duration !== undefined) {
            this.duration = params.duration;
        }
        if (params.intervalMinute !== undefined) {
            this.intervalMinute = params.intervalMinute;
        }
        if (params.intervalTimes !== undefined) {
            this.intervalTimes = params.intervalTimes;
        }
        if (params.dialogControllerName !== undefined) {
            this.dialogControllerName = params.dialogControllerName;
        }
        if (params.dialogControllerDuration !== undefined) {
            this.dialogControllerDuration = params.dialogControllerDuration;
        }
        if (params.dialogControllerInterval !== undefined) {
            this.dialogControllerInterval = params.dialogControllerInterval;
        }
    }
    aboutToBeDeleted() {
        this.__showIndex.aboutToBeDeleted();
        this.__nowIndex.aboutToBeDeleted();
        this.__partitionIndex.aboutToBeDeleted();
        this.__hourIndex.aboutToBeDeleted();
        this.__minuteIndex.aboutToBeDeleted();
        this.__timedArray.aboutToBeDeleted();
        this.__clockItems.aboutToBeDeleted();
        this.__modifyMsg.aboutToBeDeleted();
        this.__clockName.aboutToBeDeleted();
        this.__duration.aboutToBeDeleted();
        this.__intervalMinute.aboutToBeDeleted();
        this.__intervalTimes.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id());
    }
    get showIndex() {
        return this.__showIndex.get();
    }
    set showIndex(newValue) {
        this.__showIndex.set(newValue);
    }
    get nowIndex() {
        return this.__nowIndex.get();
    }
    set nowIndex(newValue) {
        this.__nowIndex.set(newValue);
    }
    get partitionIndex() {
        return this.__partitionIndex.get();
    }
    set partitionIndex(newValue) {
        this.__partitionIndex.set(newValue);
    }
    get hourIndex() {
        return this.__hourIndex.get();
    }
    set hourIndex(newValue) {
        this.__hourIndex.set(newValue);
    }
    get minuteIndex() {
        return this.__minuteIndex.get();
    }
    set minuteIndex(newValue) {
        this.__minuteIndex.set(newValue);
    }
    get timedArray() {
        return this.__timedArray.get();
    }
    set timedArray(newValue) {
        this.__timedArray.set(newValue);
    }
    get clockItems() {
        return this.__clockItems.get();
    }
    set clockItems(newValue) {
        this.__clockItems.set(newValue);
    }
    get modifyMsg() {
        return this.__modifyMsg.get();
    }
    set modifyMsg(newValue) {
        this.__modifyMsg.set(newValue);
    }
    get clockName() {
        return this.__clockName.get();
    }
    set clockName(newValue) {
        this.__clockName.set(newValue);
    }
    get duration() {
        return this.__duration.get();
    }
    set duration(newValue) {
        this.__duration.set(newValue);
    }
    get intervalMinute() {
        return this.__intervalMinute.get();
    }
    set intervalMinute(newValue) {
        this.__intervalMinute.set(newValue);
    }
    get intervalTimes() {
        return this.__intervalTimes.get();
    }
    set intervalTimes(newValue) {
        this.__intervalTimes.set(newValue);
    }
    onAccept() {
    }
    render() {
        Stack.create({ alignContent: Alignment.Bottom });
        Stack.width('100%');
        Stack.height('100%');
        Flex.create({ direction: FlexDirection.Column, alignItems: ItemAlign.Center });
        Flex.width('100%');
        Flex.height('100%');
        Stack.create({ alignContent: Alignment.End });
        Stack.margin({ top: 20, bottom: 15 });
        Stack.width('90%');
        Stack.height(50);
        Row.create();
        Row.height('100%');
        Row.width('100%');
        // 取消
        Image.create('images/cancel.png');
        // 取消
        Image.width(40);
        // 取消
        Image.aspectRatio(1.0);
        // 取消
        Image.onClick(() => {
            this.cancel();
        });
        // 描述
        Text.create(this.nowIndex == -1 ? '新建闹钟' : '修改闹钟');
        // 描述
        Text.fontSize(20);
        // 描述
        Text.margin({ left: 20 });
        // 描述
        Text.pop();
        Row.pop();
        // 确定
        Image.create('images/confirm.png');
        // 确定
        Image.width(40);
        // 确定
        Image.aspectRatio(1.0);
        // 确定
        Image.onClick(() => {
            this.confirm();
        });
        Stack.pop();
        Scroll.create();
        Scroll.flexGrow(1);
        Scroll.width('90%');
        Column.create();
        // 时间选择
        Row.create();
        // 时间选择
        Row.backgroundColor('#E2E2E2');
        // 时间选择
        Row.borderRadius(10);
        // 上午下午
        TextPicker.create({ range: this.partitions, selected: this.partitionIndex });
        // 上午下午
        TextPicker.width('33%');
        // 上午下午
        TextPicker.onChange((value, index) => {
            this.timedArray[0] = value;
            this.partitionIndex = index;
            console.info('Picker item changed, value: ' + value + ', index: ' + index);
        });
        // 上午下午
        TextPicker.pop();
        // 小时
        TextPicker.create({ range: this.hours, selected: this.hourIndex });
        // 小时
        TextPicker.width('33%');
        // 小时
        TextPicker.onChange((value, index) => {
            this.timedArray[1] = value;
            this.hourIndex = index;
            console.info('Picker item changed, value: ' + value + ', index: ' + index);
        });
        // 小时
        TextPicker.pop();
        // 分钟
        TextPicker.create({ range: this.minutes, selected: this.minuteIndex });
        // 分钟
        TextPicker.width('33%');
        // 分钟
        TextPicker.onChange((value, index) => {
            this.timedArray[2] = value;
            this.minuteIndex = index;
            console.info('Picker item changed, value: ' + value + ', index: ' + index);
        });
        // 分钟
        TextPicker.pop();
        // 时间选择
        Row.pop();
        // 信息
        Stack.create({ alignContent: Alignment.End });
        // 信息
        Stack.width('100%');
        // 信息
        Stack.height(30);
        // 信息
        Stack.margin({ top: 20, bottom: 10 });
        // 信息
        Stack.onClick(() => {
            this.dialogControllerName.open();
        });
        Row.create();
        Row.height('100%');
        Row.width('100%');
        Text.create('闹钟名');
        Text.fontSize(20);
        Text.pop();
        Row.pop();
        Text.create(this.clockName + ' >');
        Text.fontSize(15);
        Text.fontColor('#E2E2E2');
        Text.pop();
        // 信息
        Stack.pop();
        Divider.create();
        Divider.margin({ bottom: 10 });
        Stack.create({ alignContent: Alignment.End });
        Stack.width('100%');
        Stack.height(30);
        Stack.margin({ bottom: 10 });
        Stack.onClick(() => {
            this.dialogControllerDuration.open();
        });
        Row.create();
        Row.height('100%');
        Row.width('100%');
        Text.create('响铃时长');
        Text.fontSize(20);
        Text.pop();
        Row.pop();
        Text.create(this.duration.toFixed(0) + ' 分钟 >');
        Text.fontSize(15);
        Text.fontColor('#E2E2E2');
        Text.pop();
        Stack.pop();
        Divider.create();
        Divider.margin({ bottom: 10 });
        Stack.create({ alignContent: Alignment.End });
        Stack.width('100%');
        Stack.height(30);
        Stack.onClick(() => {
            this.dialogControllerInterval.open();
        });
        Row.create();
        Row.height('100%');
        Row.width('100%');
        Text.create('再响间隔');
        Text.fontSize(20);
        Text.pop();
        Row.pop();
        Text.create(this.intervalMinute.toFixed(0) + ' 分钟，' + this.intervalTimes.toFixed(0) + ' 次 >');
        Text.fontSize(15);
        Text.fontColor('#E2E2E2');
        Text.pop();
        Stack.pop();
        Column.pop();
        Scroll.pop();
        Flex.pop();
        // 删除按钮
        Text.create('删除');
        // 删除按钮
        Text.width('50%');
        // 删除按钮
        Text.height(45);
        // 删除按钮
        Text.textAlign(TextAlign.Center);
        // 删除按钮
        Text.fontSize(25);
        // 删除按钮
        Text.fontColor('#DE1A33');
        // 删除按钮
        Text.backgroundColor('#E2E2E2');
        // 删除按钮
        Text.borderRadius(20);
        // 删除按钮
        Text.margin({ bottom: 10 });
        // 删除按钮
        Text.onClick(() => {
            this.delete();
        });
        // 删除按钮
        Text.visibility(this.nowIndex == -1 ? Visibility.None : Visibility.Visible);
        // 删除按钮
        Text.pop();
        Stack.pop();
    }
    // 确定 '√'
    confirm() {
        // 新增
        if (this.nowIndex == -1) {
            // 判断当前闹钟时间是否存在
            let exist = false;
            this.clockItems.forEach(item => {
                if (item.partition == this.timedArray[0] && item.hour == this.timedArray[1] && item.minute == this.timedArray[2]) {
                    exist = true;
                    return;
                }
            });
            if (exist) {
                AlertDialog.show({ message: '该时间闹钟已添加！' });
            }
            else {
                this.modifyMsg = [0, this.clockItems.length, this.clockItems.length]; // 新增信息
                this.clockItems.push(new ClockItem(this.clockName, this.partitionIndex, this.timedArray[0], this.hourIndex, this.timedArray[1], this.minuteIndex, this.timedArray[2], this.duration, this.intervalMinute, this.intervalTimes, true));
                this.showIndex = true;
            }
        }
        else {
            // 修改
            this.modifyMsg = [1, this.nowIndex, this.clockItems[this.nowIndex].reminderId]; // 修改信息
            this.clockItems[this.nowIndex] = new ClockItem(this.clockName, this.partitionIndex, this.timedArray[0], this.hourIndex, this.timedArray[1], this.minuteIndex, this.timedArray[2], this.duration, this.intervalMinute, this.intervalTimes, true);
            this.showIndex = true;
        }
    }
    // 取消 '×'
    cancel() {
        this.showIndex = true;
    }
    // 删除
    delete() {
        this.modifyMsg = [2, this.nowIndex, this.clockItems[this.nowIndex].reminderId]; // 删除信息
        this.clockItems.splice(this.nowIndex, 1);
        this.timedArray = ['下午', '02', '02'];
        this.partitionIndex = 1;
        this.hourIndex = 1;
        this.minuteIndex = 1;
        this.clockName = '闹钟';
        this.duration = 5;
        this.intervalMinute = 10;
        this.intervalTimes = 3;
        this.showIndex = true;
    }
    // 进入此界面触发
    resetValue() {
        // 修改
        if (this.nowIndex != -1) {
            // 设置值 ClockItem
            let item = this.clockItems[this.nowIndex];
            this.timedArray = [item.partition, item.hour, item.minute];
            this.partitionIndex = item.partitionIndex;
            this.hourIndex = item.hourIndex;
            this.minuteIndex = item.minuteIndex;
            this.clockName = item.name;
            this.duration = item.duration;
            this.intervalMinute = item.intervalMinute;
            this.intervalTimes = item.intervalTimes;
        }
        else {
            // 重置值 ClockItem
            this.timedArray = ['下午', '02', '02'];
            this.partitionIndex = 1;
            this.hourIndex = 1;
            this.minuteIndex = 1;
            this.clockName = '闹钟';
            this.duration = 5;
            this.intervalMinute = 10;
            this.intervalTimes = 3;
        }
    }
}
exports.Detail = Detail;
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
let ClockItem = class ClockItem {
    constructor(name, partitionIndex, partition, hourIndex, hour, minuteIndex, minute, duration, intervalMinute, intervalTimes, open) {
        this.name = name;
        this.partitionIndex = partitionIndex;
        this.partition = partition;
        this.hourIndex = hourIndex;
        this.hour = hour;
        this.minuteIndex = minuteIndex;
        this.minute = minute;
        this.duration = duration;
        this.intervalMinute = intervalMinute;
        this.intervalTimes = intervalTimes;
        this.open = open;
    }
};
ClockItem = __decorate([
    Observed
], ClockItem);
exports.ClockItem = ClockItem;
class DialogName extends View {
    constructor(compilerAssignedUniqueChildId, parent, params) {
        super(compilerAssignedUniqueChildId, parent);
        this.__clockName = this.initializeConsume("clockName", "clockName");
        this.name = undefined;
        this.controller = undefined;
        this.action = undefined;
        this.updateWithValueParams(params);
    }
    updateWithValueParams(params) {
        if (params.name !== undefined) {
            this.name = params.name;
        }
        if (params.controller !== undefined) {
            this.controller = params.controller;
        }
        if (params.action !== undefined) {
            this.action = params.action;
        }
    }
    aboutToBeDeleted() {
        this.__clockName.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id());
    }
    get clockName() {
        return this.__clockName.get();
    }
    set clockName(newValue) {
        this.__clockName.set(newValue);
    }
    setController(ctr) {
        this.controller = ctr;
    }
    render() {
        Column.create();
        Column.width('100%');
        Text.create('闹钟名');
        Text.fontSize(20);
        Text.width('90%');
        Text.textAlign(TextAlign.Start);
        Text.margin({ top: 10 });
        Text.pop();
        TextArea.create({ text: this.clockName });
        TextArea.width('90%');
        TextArea.margin({ top: 20 });
        TextArea.onChange((value) => {
            this.name = value;
        });
        Divider.create();
        Divider.width('90%');
        Divider.margin({ top: 10 });
        Row.create();
        Row.margin({ top: 10, bottom: 20 });
        Text.create('取消');
        Text.fontSize(15);
        Text.width('50%');
        Text.textAlign(TextAlign.Center);
        Text.fontColor('#17A98E');
        Text.onClick(() => {
            this.controller.close();
        });
        Text.pop();
        Text.create('确定');
        Text.fontSize(15);
        Text.width('50%');
        Text.textAlign(TextAlign.Center);
        Text.fontColor('#17A98E');
        Text.onClick(() => {
            this.clockName = this.name;
            this.controller.close();
        });
        Text.pop();
        Row.pop();
        Column.pop();
    }
}
class DialogDuration extends View {
    constructor(compilerAssignedUniqueChildId, parent, params) {
        super(compilerAssignedUniqueChildId, parent);
        this.__duration = this.initializeConsume("duration", "duration");
        this.durations = [1, 5, 10, 15, 20, 30] //响铃时长，分钟
        ;
        this.controller = undefined;
        this.action = undefined;
        this.updateWithValueParams(params);
    }
    updateWithValueParams(params) {
        if (params.durations !== undefined) {
            this.durations = params.durations;
        }
        if (params.controller !== undefined) {
            this.controller = params.controller;
        }
        if (params.action !== undefined) {
            this.action = params.action;
        }
    }
    aboutToBeDeleted() {
        this.__duration.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id());
    }
    get duration() {
        return this.__duration.get();
    }
    set duration(newValue) {
        this.__duration.set(newValue);
    }
    setController(ctr) {
        this.controller = ctr;
    }
    render() {
        Column.create();
        Column.width('100%');
        Text.create('响铃时长');
        Text.fontSize(20);
        Text.width('90%');
        Text.textAlign(TextAlign.Start);
        Text.margin({ top: 10, bottom: 10 });
        Text.pop();
        ForEach.create("4", this, ObservedObject.GetRawObject(this.durations), item => {
            Stack.create({ alignContent: Alignment.End });
            Stack.width('90%');
            Row.create();
            Row.width('100%');
            Text.create(item + ' 分钟');
            Text.pop();
            Row.pop();
            Radio.create({ value: item, group: 'radioGroup' });
            Radio.checked(item == this.duration ? true : false);
            Radio.height(20);
            Radio.width(20);
            Radio.onChange((value) => {
                this.controller.close();
                this.duration = item;
            });
            Stack.pop();
            Divider.create();
            Divider.width('90%');
        });
        ForEach.pop();
        Row.create();
        Row.margin({ top: 10, bottom: 20 });
        Text.create('取消');
        Text.fontSize(15);
        Text.width('100%');
        Text.textAlign(TextAlign.Center);
        Text.fontColor('#17A98E');
        Text.onClick(() => {
            this.controller.close();
        });
        Text.pop();
        Row.pop();
        Column.pop();
    }
}
class DialogInterval extends View {
    constructor(compilerAssignedUniqueChildId, parent, params) {
        super(compilerAssignedUniqueChildId, parent);
        this.__intervalMinute = this.initializeConsume("intervalMinute", "intervalMinute");
        this.__intervalTimes = this.initializeConsume("intervalTimes", "intervalTimes");
        this.__intervalMinuteSelect = new ObservedPropertySimple(0 // 再响间隔分钟，界面选择值
        , this, "intervalMinuteSelect");
        this.__intervalTimesSelect = new ObservedPropertySimple(0 // 再响间隔次数，界面选择值
        , this, "intervalTimesSelect");
        this.controller = undefined;
        this.action = undefined;
        this.updateWithValueParams(params);
    }
    updateWithValueParams(params) {
        if (params.intervalMinuteSelect !== undefined) {
            this.intervalMinuteSelect = params.intervalMinuteSelect;
        }
        if (params.intervalTimesSelect !== undefined) {
            this.intervalTimesSelect = params.intervalTimesSelect;
        }
        if (params.controller !== undefined) {
            this.controller = params.controller;
        }
        if (params.action !== undefined) {
            this.action = params.action;
        }
    }
    aboutToBeDeleted() {
        this.__intervalMinute.aboutToBeDeleted();
        this.__intervalTimes.aboutToBeDeleted();
        this.__intervalMinuteSelect.aboutToBeDeleted();
        this.__intervalTimesSelect.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id());
    }
    get intervalMinute() {
        return this.__intervalMinute.get();
    }
    set intervalMinute(newValue) {
        this.__intervalMinute.set(newValue);
    }
    get intervalTimes() {
        return this.__intervalTimes.get();
    }
    set intervalTimes(newValue) {
        this.__intervalTimes.set(newValue);
    }
    get intervalMinuteSelect() {
        return this.__intervalMinuteSelect.get();
    }
    set intervalMinuteSelect(newValue) {
        this.__intervalMinuteSelect.set(newValue);
    }
    get intervalTimesSelect() {
        return this.__intervalTimesSelect.get();
    }
    set intervalTimesSelect(newValue) {
        this.__intervalTimesSelect.set(newValue);
    }
    setController(ctr) {
        this.controller = ctr;
    }
    render() {
        Column.create();
        Column.width('100%');
        Text.create('再响间隔');
        Text.fontSize(20);
        Text.width('90%');
        Text.textAlign(TextAlign.Start);
        Text.margin({ top: 10 });
        Text.pop();
        Text.create('响铃间隔时间（分钟）');
        Text.fontSize(10);
        Text.width('90%');
        Text.textAlign(TextAlign.Start);
        Text.margin({ top: 10 });
        Text.pop();
        Row.create();
        Row.padding({ top: 30 });
        Row.width('90%');
        Slider.create({
            value: this.intervalMinuteSelect,
            min: 5,
            max: 30,
            step: 5,
            style: SliderStyle.OutSet
        });
        Slider.blockColor(Color.Blue);
        Slider.trackColor(Color.Gray);
        Slider.selectedColor(Color.Blue);
        Slider.showSteps(true);
        Slider.showTips(true);
        Slider.onChange((value, mode) => {
            this.intervalMinuteSelect = value;
        });
        Text.create(this.intervalMinuteSelect.toFixed(0));
        Text.fontSize(16);
        Text.pop();
        Row.pop();
        Divider.create();
        Divider.width('90%');
        Divider.margin({ top: 10 });
        Text.create('重复响铃次数');
        Text.fontSize(10);
        Text.width('90%');
        Text.textAlign(TextAlign.Start);
        Text.margin({ top: 10 });
        Text.pop();
        Row.create();
        Row.padding({ top: 50 });
        Row.width('90%');
        Slider.create({
            value: this.intervalTimesSelect,
            min: 0,
            max: 10,
            step: 2,
            style: SliderStyle.OutSet
        });
        Slider.blockColor(Color.Blue);
        Slider.trackColor(Color.Gray);
        Slider.selectedColor(Color.Blue);
        Slider.showSteps(true);
        Slider.showTips(true);
        Slider.onChange((value, mode) => {
            this.intervalTimesSelect = value;
        });
        Text.create(this.intervalTimesSelect.toFixed(0));
        Text.fontSize(16);
        Text.pop();
        Row.pop();
        Row.create();
        Row.margin({ top: 10, bottom: 20 });
        Text.create('取消');
        Text.fontSize(15);
        Text.width('50%');
        Text.textAlign(TextAlign.Center);
        Text.fontColor('#17A98E');
        Text.onClick(() => {
            this.controller.close();
        });
        Text.pop();
        Text.create('确定');
        Text.fontSize(15);
        Text.width('50%');
        Text.textAlign(TextAlign.Center);
        Text.fontColor('#17A98E');
        Text.onClick(() => {
            this.intervalMinute = this.intervalMinuteSelect;
            this.intervalTimes = this.intervalTimesSelect;
            this.controller.close();
        });
        Text.pop();
        Row.pop();
        Column.pop();
    }
    aboutToAppear() {
        this.intervalMinuteSelect = this.intervalMinute; // 再响间隔分钟，界面选择值
        this.intervalTimesSelect = this.intervalTimes; // 再响间隔次数，界面选择值
    }
}


/***/ }),

/***/ "../../../../../../HarmonyOS/gitee/codelabs_xllenga/AlarmClock/entry/src/main/ets/MainAbility/pages/index.ets?entry":
/*!**************************************************************************************************************************!*\
  !*** ../../../../../../HarmonyOS/gitee/codelabs_xllenga/AlarmClock/entry/src/main/ets/MainAbility/pages/index.ets?entry ***!
  \**************************************************************************************************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {


var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
var _ohos_reminderAgent_1  = globalThis.requireNapi('reminderAgent') || (isSystemplugin('reminderAgent', 'ohos') ? globalThis.ohosplugin.reminderAgent : isSystemplugin('reminderAgent', 'system') ? globalThis.systemplugin.reminderAgent : undefined);
var _ohos_notification_1  = globalThis.requireNapi('notification') || (isSystemplugin('notification', 'ohos') ? globalThis.ohosplugin.notification : isSystemplugin('notification', 'system') ? globalThis.systemplugin.notification : undefined);
const detail_1 = __webpack_require__(/*! ./detail */ "../../../../../../HarmonyOS/gitee/codelabs_xllenga/AlarmClock/entry/src/main/ets/MainAbility/pages/detail.ets");
var _ohos_data_storage_1  = globalThis.requireNapi('data.storage') || (isSystemplugin('data.storage', 'ohos') ? globalThis.ohosplugin.data.storage : isSystemplugin('data.storage', 'system') ? globalThis.systemplugin.data.storage : undefined);
var _ohos_ability_featureAbility_1  = globalThis.requireNapi('ability.featureAbility') || (isSystemplugin('ability.featureAbility', 'ohos') ? globalThis.ohosplugin.ability.featureAbility : isSystemplugin('ability.featureAbility', 'system') ? globalThis.systemplugin.ability.featureAbility : undefined);
var _ohos_display_1  = globalThis.requireNapi('display') || (isSystemplugin('display', 'ohos') ? globalThis.ohosplugin.display : isSystemplugin('display', 'system') ? globalThis.systemplugin.display : undefined);
class Index extends View {
    constructor(compilerAssignedUniqueChildId, parent, params) {
        super(compilerAssignedUniqueChildId, parent);
        this.times = [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 1, 2] //时间刻度值
        ;
        this.settings = new RenderingContextSettings(true);
        this.context = new CanvasRenderingContext2D(this.settings);
        this.__canvasSize = new ObservedPropertySimple(170 // canvas宽高
        , this, "canvasSize");
        this.__canvasOnScreenRatio = new ObservedPropertySimple(3 // 时钟画布是屏幕的几分之一，竖屏：宽度的1/3，此值为3。横屏：高度的1/4，此值为4
        , this, "canvasOnScreenRatio");
        this.radius = 0 // 半径
        ;
        this.sixtyParts = Math.PI * 2 / 60 // 60等分
        ;
        this.twelveParts = Math.PI * 2 / 12 // 12等分
        ;
        this.__screenWidth = new ObservedPropertySimple(0 // 屏幕宽度
        , this, "screenWidth");
        this.__screenHeight = new ObservedPropertySimple(0 // 屏幕高度
        , this, "screenHeight");
        this.__interval = new ObservedPropertyObject(-1 // 定时器
        , this, "interval");
        this.__showClock = new ObservedPropertySimple(true // true显示时钟 false显示时间
        , this, "showClock");
        this.__showIndex = new ObservedPropertySimple(true // true主界面 false详情界面
        , this, "showIndex");
        this.__nowIndex = new ObservedPropertySimple(-1 // 新增时值为-1，修改时值为当前数组索引
        , this, "nowIndex");
        this.__clockItems = new ObservedPropertyObject([] // 闹钟-定时
        , this, "clockItems");
        this.__modifyMsg = new ObservedPropertyObject([-1, -1, -1] // 记录clockItems变化数据，三个数值，第一个：0新增、1修改、2删除；第二个：修改闹钟的index值；第三个：闹钟reminderId
        , this, "modifyMsg");
        this.updateWithValueParams(params);
        this.declareWatch("clockItems", this.resetAlarm);
    }
    updateWithValueParams(params) {
        if (params.times !== undefined) {
            this.times = params.times;
        }
        if (params.settings !== undefined) {
            this.settings = params.settings;
        }
        if (params.context !== undefined) {
            this.context = params.context;
        }
        if (params.canvasSize !== undefined) {
            this.canvasSize = params.canvasSize;
        }
        if (params.canvasOnScreenRatio !== undefined) {
            this.canvasOnScreenRatio = params.canvasOnScreenRatio;
        }
        if (params.radius !== undefined) {
            this.radius = params.radius;
        }
        if (params.sixtyParts !== undefined) {
            this.sixtyParts = params.sixtyParts;
        }
        if (params.twelveParts !== undefined) {
            this.twelveParts = params.twelveParts;
        }
        if (params.screenWidth !== undefined) {
            this.screenWidth = params.screenWidth;
        }
        if (params.screenHeight !== undefined) {
            this.screenHeight = params.screenHeight;
        }
        if (params.interval !== undefined) {
            this.interval = params.interval;
        }
        if (params.showClock !== undefined) {
            this.showClock = params.showClock;
        }
        if (params.showIndex !== undefined) {
            this.showIndex = params.showIndex;
        }
        if (params.nowIndex !== undefined) {
            this.nowIndex = params.nowIndex;
        }
        if (params.clockItems !== undefined) {
            this.clockItems = params.clockItems;
        }
        if (params.modifyMsg !== undefined) {
            this.modifyMsg = params.modifyMsg;
        }
    }
    aboutToBeDeleted() {
        this.__canvasSize.aboutToBeDeleted();
        this.__canvasOnScreenRatio.aboutToBeDeleted();
        this.__screenWidth.aboutToBeDeleted();
        this.__screenHeight.aboutToBeDeleted();
        this.__interval.aboutToBeDeleted();
        this.__showClock.aboutToBeDeleted();
        this.__showIndex.aboutToBeDeleted();
        this.__nowIndex.aboutToBeDeleted();
        this.__clockItems.aboutToBeDeleted();
        this.__modifyMsg.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id());
    }
    get canvasSize() {
        return this.__canvasSize.get();
    }
    set canvasSize(newValue) {
        this.__canvasSize.set(newValue);
    }
    get canvasOnScreenRatio() {
        return this.__canvasOnScreenRatio.get();
    }
    set canvasOnScreenRatio(newValue) {
        this.__canvasOnScreenRatio.set(newValue);
    }
    get screenWidth() {
        return this.__screenWidth.get();
    }
    set screenWidth(newValue) {
        this.__screenWidth.set(newValue);
    }
    get screenHeight() {
        return this.__screenHeight.get();
    }
    set screenHeight(newValue) {
        this.__screenHeight.set(newValue);
    }
    get interval() {
        return this.__interval.get();
    }
    set interval(newValue) {
        this.__interval.set(newValue);
    }
    get showClock() {
        return this.__showClock.get();
    }
    set showClock(newValue) {
        this.__showClock.set(newValue);
    }
    get showIndex() {
        return this.__showIndex.get();
    }
    set showIndex(newValue) {
        this.__showIndex.set(newValue);
    }
    get nowIndex() {
        return this.__nowIndex.get();
    }
    set nowIndex(newValue) {
        this.__nowIndex.set(newValue);
    }
    get clockItems() {
        return this.__clockItems.get();
    }
    set clockItems(newValue) {
        this.__clockItems.set(newValue);
    }
    get modifyMsg() {
        return this.__modifyMsg.get();
    }
    set modifyMsg(newValue) {
        this.__modifyMsg.set(newValue);
    }
    aboutToAppear() {
        // 查询数据库定时数据
        this.getData();
        // 获取屏幕宽高
        _ohos_display_1.getDefaultDisplay((err, data) => {
            if (data.densityPixels != 3) {
                this.canvasOnScreenRatio = 1;
            }
            else {
                this.canvasOnScreenRatio = 2;
            }
            this.screenWidth = data.width;
            this.screenHeight = data.height;
            // 设置canvas尺寸，竖屏取值为宽高最小值的1/2，横屏取值为宽高最小值的1/4
            this.canvasOnScreenRatio *= (this.screenWidth < this.screenHeight ? 2 : 4);
            this.canvasSize = px2vp(Math.min(this.screenWidth, this.screenHeight) / this.canvasOnScreenRatio);
            // 重置原点到canvas画布中间
            this.context.translate(this.canvasSize, this.canvasSize / 2);
        });
    }
    render() {
        Stack.create({ alignContent: Alignment.Bottom });
        Stack.width('100%');
        Stack.height('100%');
        Column.create();
        Column.width('100%');
        Column.height('100%');
        Column.visibility(this.showIndex ? Visibility.Visible : Visibility.Hidden);
        Column.create();
        Column.height(80);
        Column.width('100%');
        Column.alignItems(HorizontalAlign.Start);
        Text.create('闹钟');
        Text.fontSize(30);
        Text.margin({ left: 20 });
        Text.pop();
        Column.pop();
        Canvas.create(this.context);
        Canvas.height(this.canvasSize);
        Canvas.aspectRatio(2.0);
        Canvas.onReady(() => {
            // 获取半径
            this.radius = this.canvasSize / 2.5 - 5;
            var that = this;
            // 避免时钟闪现，先画一遍
            that.draw();
            // 定时器
            this.interval = setInterval(function () {
                that.draw();
            }, 1000);
        });
        Canvas.onClick(() => {
            // 切换指针表盘和数字时钟
            this.showClock = !this.showClock;
        });
        Canvas.pop();
        // 闹钟列表
        List.create({ space: 10, initialIndex: 0 });
        // 闹钟列表
        List.listDirection(Axis.Vertical);
        // 闹钟列表
        List.flexGrow(1);
        // 闹钟列表
        List.margin({ top: 10 });
        ForEach.create("2", this, ObservedObject.GetRawObject(this.clockItems.map((item, index) => {
            return { i: index, data: item };
        })), (item, index) => {
            ListItem.create();
            ListItem.width('100%');
            ListItem.onClick(() => {
                this.nowIndex = index; // 下标
                this.showIndex = false; // 展示修改界面
            });
            Stack.create({ alignContent: Alignment.End });
            Stack.width('90%');
            Stack.height(60);
            Stack.backgroundColor('#E2E2E2');
            Stack.borderRadius(10);
            Column.create();
            Column.width('100%');
            Column.margin({ left: 10 });
            Column.alignItems(HorizontalAlign.Start);
            Row.create();
            Text.create(item.data.partition);
            Text.fontSize(15);
            Text.pop();
            Text.create(item.data.hour + ':' + item.data.minute);
            Text.fontSize(25);
            Text.margin({ left: 10 });
            Text.pop();
            Row.pop();
            Row.create();
            Row.margin({ top: 5 });
            Text.create(item.data.name);
            Text.fontSize(15);
            Text.pop();
            Text.create('不重复');
            Text.fontSize(15);
            Text.margin({ left: 10 });
            Text.pop();
            Row.pop();
            Column.pop();
            Toggle.create({ type: ToggleType.Switch, isOn: item.data.open });
            Toggle.selectedColor(0x39a2db);
            Toggle.switchPointColor(0xe5ffffff);
            Toggle.onChange((isOn) => {
                item.data.open = !item.data.open;
                console.info('Component status:' + isOn);
                // 关闭、打开闹钟
                this.modifyMsg = [item.data.open ? 0 : 2, index, item.data.reminderId];
                this.resetAlarm();
            });
            Toggle.width(30);
            Toggle.aspectRatio(1.0);
            Toggle.pop();
            Stack.pop();
            ListItem.pop();
        }, item => item.data.name.toString());
        ForEach.pop();
        // 闹钟列表
        List.pop();
        Column.pop();
        Column.create();
        Column.width('100%');
        Column.height('100%');
        Column.visibility(this.showIndex ? Visibility.Hidden : Visibility.Visible);
        let earlierCreatedChild_3 = this.findChildById("3");
        if (earlierCreatedChild_3 == undefined) {
            View.create(new detail_1.Detail("3", this, { showIndex: this.__showIndex, clockItems: this.__clockItems, nowIndex: this.__nowIndex, modifyMsg: this.__modifyMsg }));
        }
        else {
            earlierCreatedChild_3.updateWithValueParams({});
            View.create(earlierCreatedChild_3);
        }
        Column.pop();
        Image.create('images/add.png');
        Image.width(70);
        Image.aspectRatio(1.0);
        Image.margin({ bottom: 10 });
        Image.onClick(() => {
            this.nowIndex = -1; // 新增闹钟，值为-1
            this.showIndex = false; // 展示新增闹钟界面
        });
        Image.visibility(this.showIndex ? Visibility.Visible : Visibility.Hidden);
        Stack.pop();
    }
    // 开始绘制
    draw() {
        // 清空绘制
        this.context.clearRect(-this.canvasSize, this.canvasSize / -2, this.canvasSize * 2, this.canvasSize);
        // 获取当前时间
        let date = new Date();
        if (this.showClock) {
            // 画表盘
            this.drawDials();
            // 画秒针
            this.drawSecond(date.getSeconds());
            // 画分针
            this.drawMinute(date.getMinutes(), date.getSeconds());
            // 画时针
            this.drawHour(date.getHours(), date.getMinutes());
        }
        else {
            this.drawTime(date.getHours().toString(), date.getMinutes().toString(), date.getSeconds().toString());
        }
    }
    // 画时间
    drawTime(hour, minute, second) {
        let time = this.fillZero(hour) + ':' + this.fillZero(minute) + ':' + this.fillZero(second);
        this.context.save();
        this.context.font = '100px';
        this.context.beginPath();
        this.context.textAlign = 'center';
        this.context.fillText(time, 0, 0);
        this.context.restore();
    }
    // 补零：HH:mm:ss
    fillZero(val) {
        var len = val.length;
        while (len < 2) {
            val = "0" + val;
            len++;
        }
        return val;
    }
    // 画表盘
    drawDials() {
        // 画原点
        this.context.save();
        this.context.beginPath();
        this.context.arc(0, 0, 5, 0, Math.PI * 2);
        this.context.fill();
        this.context.stroke();
        this.context.restore();
        // 字体大小
        this.context.font = '20px';
        // 画圆
        this.context.save();
        this.context.lineWidth = 5;
        this.context.beginPath();
        this.context.arc(0, 0, this.radius, 0, 2 * Math.PI);
        this.context.stroke();
        this.context.restore();
        // 画刻度
        for (let n = 1; n <= 60; n++) {
            // 从三点钟方向开始获取60个刻度的角度
            var theta = (n - 3) * (Math.PI * 2) / 60;
            this.context.save();
            // 刻度宽度为2
            this.context.lineWidth = 2;
            this.context.beginPath();
            // 刻度起始位置
            var x_move = this.radius * Math.cos(theta);
            var y_move = this.radius * Math.sin(theta);
            // 非整点刻度结束位置
            var x_to = (this.radius - 5) * Math.cos(theta);
            var y_to = (this.radius - 5) * Math.sin(theta);
            // 整点刻度
            if ((n - 3) % 5 == 0) {
                //整点刻度宽度
                this.context.lineWidth = 3;
                // 整点刻度结束位置
                x_to = (this.radius - 10) * Math.cos(theta);
                y_to = (this.radius - 10) * Math.sin(theta);
                // 整点时间位置
                var x_time = (this.radius - 25) * Math.cos(theta);
                var y_time = (this.radius - 25) * Math.sin(theta);
                // 绘制整点时间
                this.context.fillText(this.times[(n - 3) / 5] + '', x_time - 5, y_time + 3);
            }
            // 绘制刻度线
            this.context.moveTo(x_move, y_move);
            this.context.lineTo(x_to, y_to);
            this.context.stroke();
            this.context.restore();
        }
    }
    // 画秒针
    drawSecond(second) {
        this.context.save();
        this.context.fillStyle = 'red';
        var theta = (second - 15) * 2 * Math.PI / 60;
        this.context.rotate(theta);
        this.context.beginPath();
        this.context.moveTo(-15, -3);
        this.context.lineTo(-15, 3);
        this.context.lineTo(this.radius * 0.9, 1);
        this.context.lineTo(this.radius * 0.9, -1);
        this.context.fill();
        this.context.restore();
    }
    // 画分针
    drawMinute(minute, second) {
        this.context.save();
        var theta = ((minute + second / 60 - 15) * 2 * Math.PI / 60);
        this.context.rotate(theta);
        this.context.beginPath();
        this.context.moveTo(-15, -4);
        this.context.lineTo(-15, 4);
        this.context.lineTo(this.radius * 0.8, 1);
        this.context.lineTo(this.radius * 0.8, -1);
        this.context.fill();
        this.context.restore();
    }
    // 画时针
    drawHour(hour, minute) {
        this.context.save();
        var theta = ((hour + minute / 60 - 3) * 2 * Math.PI / 12);
        this.context.rotate(theta);
        this.context.beginPath();
        this.context.moveTo(-15, -5);
        this.context.lineTo(-15, 5);
        this.context.lineTo(this.radius * 0.5, 1);
        this.context.lineTo(this.radius * 0.5, -1);
        this.context.fill();
        this.context.restore();
    }
    // 监听闹钟数据变化
    resetAlarm() {
        let opeNum = this.modifyMsg[0];
        let index = this.modifyMsg[1];
        let reminderId = this.modifyMsg[2];
        if (opeNum == 0) {
            // 新增
            _ohos_reminderAgent_1.publishReminder(this.addAlarm(this.clockItems[index], index), (err, reminderId) => {
                this.clockItems[index].reminderId = reminderId; // 设置reminderId
                this.saveData();
            });
        }
        else if (opeNum == 1) {
            // 修改，先停止原先的闹钟再开启修改后的
            _ohos_reminderAgent_1.cancelReminder(reminderId);
            _ohos_reminderAgent_1.publishReminder(this.addAlarm(this.clockItems[index], index), (err, reminderId) => {
                this.clockItems[index].reminderId = reminderId; // 设置reminderId
                this.saveData();
            });
        }
        else if (opeNum == 2) {
            // 删除
            _ohos_reminderAgent_1.cancelReminder(reminderId);
            this.saveData();
        }
    }
    // 根据闹钟数据，新增闹钟
    addAlarm(item, index) {
        return {
            reminderType: _ohos_reminderAgent_1.ReminderType.REMINDER_TYPE_ALARM,
            hour: item.partition == '上午' ? parseInt(item.hour) : ((parseInt(item.hour) + 12) == 24 ? 0 : parseInt(item.hour) + 12),
            minute: parseInt(item.minute),
            daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
            actionButton: [
                {
                    title: "close",
                    type: _ohos_reminderAgent_1.ActionButtonType.ACTION_BUTTON_TYPE_CLOSE
                },
                {
                    title: "snooze",
                    type: _ohos_reminderAgent_1.ActionButtonType.ACTION_BUTTON_TYPE_SNOOZE
                },
            ],
            ringDuration: item.duration * 60,
            snoozeTimes: item.intervalTimes,
            timeInterval: item.intervalMinute,
            title: item.name,
            content: item.partition + item.hour + ':' + item.minute,
            expiredContent: "this reminder has expired",
            snoozeContent: "remind later",
            notificationId: index,
            slotType: _ohos_notification_1.SlotType.SOCIAL_COMMUNICATION
        };
    }
    // 保存闹钟数据
    saveData() {
        _ohos_ability_featureAbility_1.getContext().getFilesDir((err, path) => {
            // 获取数据目录
            let storage = _ohos_data_storage_1.getStorageSync(path + '/mystore');
            // 将闹钟数据转换成字符串保存
            storage.putSync('clockData', JSON.stringify(this.clockItems));
            // 刷新数据
            storage.flushSync();
        });
    }
    // 查询闹钟数据
    getData() {
        _ohos_ability_featureAbility_1.getContext().getFilesDir((err, path) => {
            // 获取数据目录
            let storage = _ohos_data_storage_1.getStorageSync(path + '/mystore');
            // 查询闹钟数据，无数据返回''
            this.clockItems = JSON.parse(storage.getSync('clockData', '').toString());
        });
    }
}
loadDocument(new Index("1", undefined, {}));


/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		var commonCachedModule = globalThis["__common_module_cache___bd36c6ddc4679e9c98f39e86a358b589"] ? globalThis["__common_module_cache___bd36c6ddc4679e9c98f39e86a358b589"][moduleId]: null;
/******/ 		if (commonCachedModule) { return commonCachedModule.exports; }
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		if (globalThis["__common_module_cache___bd36c6ddc4679e9c98f39e86a358b589"] && moduleId.indexOf("?name=") < 0 && Object.keys(globalThis["__common_module_cache___bd36c6ddc4679e9c98f39e86a358b589"]).indexOf(moduleId) >= 0) {
/******/ 		  globalThis["__common_module_cache___bd36c6ddc4679e9c98f39e86a358b589"][moduleId] = module;
/******/ 		}
/******/ 		__webpack_modules__[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module is referenced by other modules so it can't be inlined
/******/ 	var __webpack_exports__ = __webpack_require__("../../../../../../HarmonyOS/gitee/codelabs_xllenga/AlarmClock/entry/src/main/ets/MainAbility/pages/index.ets?entry");
/******/ 	_bd36c6ddc4679e9c98f39e86a358b589 = __webpack_exports__;
/******/ 	
/******/ })()
;
//# sourceMappingURL=index.js.map