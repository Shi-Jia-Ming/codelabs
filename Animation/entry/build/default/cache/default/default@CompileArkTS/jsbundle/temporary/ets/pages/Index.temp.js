var _ed5f3d8eeddb64db6d429a154213e514;
/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
/******/ 	var __webpack_modules__ = ({

/***/ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/common/bean/IconItem.ets":
/*!***********************************************************************************************************!*\
  !*** ../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/common/bean/IconItem.ets ***!
  \***********************************************************************************************************/
/***/ ((__unused_webpack_module, exports) => {


Object.defineProperty(exports, "__esModule", ({ value: true }));
let __generate__Id = 0;
function generateId() {
    return "IconItem_" + ++__generate__Id;
}
/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class IconItem {
    constructor(index, image, clicked) {
        this.index = 0;
        this.clicked = false;
        this.image = { "id": 16777238, "type": 20000, params: [], "bundleName": "com.example.animation", "moduleName": "entry" };
        this.index = index;
        this.image = image;
        this.clicked = clicked;
    }
}
exports["default"] = IconItem;


/***/ }),

/***/ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/common/bean/Point.ets":
/*!********************************************************************************************************!*\
  !*** ../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/common/bean/Point.ets ***!
  \********************************************************************************************************/
/***/ ((__unused_webpack_module, exports) => {


Object.defineProperty(exports, "__esModule", ({ value: true }));
let __generate__Id = 0;
function generateId() {
    return "Point_" + ++__generate__Id;
}
/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class Point {
    constructor(x, y) {
        this.x = 0;
        this.y = 0;
        this.x = x;
        this.y = y;
    }
}
exports["default"] = Point;


/***/ }),

/***/ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/common/constants/Const.ets":
/*!*************************************************************************************************************!*\
  !*** ../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/common/constants/Const.ets ***!
  \*************************************************************************************************************/
/***/ ((__unused_webpack_module, exports) => {


Object.defineProperty(exports, "__esModule", ({ value: true }));
let __generate__Id = 0;
function generateId() {
    return "Const_" + ++__generate__Id;
}
/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
const IMAGE_ARR = [
    { "id": 16777238, "type": 20000, params: [], "bundleName": "com.example.animation", "moduleName": "entry" },
    { "id": 16777239, "type": 20000, params: [], "bundleName": "com.example.animation", "moduleName": "entry" },
    { "id": 16777240, "type": 20000, params: [], "bundleName": "com.example.animation", "moduleName": "entry" },
    { "id": 16777241, "type": 20000, params: [], "bundleName": "com.example.animation", "moduleName": "entry" },
    { "id": 16777242, "type": 20000, params: [], "bundleName": "com.example.animation", "moduleName": "entry" },
    { "id": 16777243, "type": 20000, params: [], "bundleName": "com.example.animation", "moduleName": "entry" }
];
class Common {
}
exports["default"] = Common;
Common.IMAGE_RESOURCE = IMAGE_ARR;
Common.IMAGES_TOTAL = IMAGE_ARR.length;
Common.IMAGES_MIN = 3;
Common.ROTATE_ANGLE_360 = 360;
Common.DELAY_10 = 10;
Common.DEFAULT_FULL_WIDTH = '100%';
Common.DEFAULT_FULL_HEIGHT = '100%';
Common.ICON_WIDTH = 58;
Common.ICON_HEIGHT = 58;
Common.CONTROLLER_WIDTH = '97vp';
Common.CONTROLLER_HEIGHT = '336vp';
Common.FONT_WEIGHT_500 = 500;
Common.OPACITY_06 = 0.6;
Common.OFFSET_RADIUS = 145;
Common.INIT_SCALE = 0.75;
Common.DURATION_500 = 500;
Common.TEMPO = 0.68;
Common.SCALE_RATIO = 1.25;
Common.DURATION_1000 = 1000;


/***/ }),

/***/ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/pages/Index.ets?entry":
/*!********************************************************************************************************!*\
  !*** ../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/pages/Index.ets?entry ***!
  \********************************************************************************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {


var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
let __generate__Id = 0;
function generateId() {
    return "Index_" + ++__generate__Id;
}
/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
const AnimationWidgets_1 = __webpack_require__(/*! ../view/AnimationWidgets */ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/view/AnimationWidgets.ets");
const CountController_1 = __webpack_require__(/*! ../view/CountController */ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/view/CountController.ets");
const Const_1 = __importDefault(__webpack_require__(/*! ../common/constants/Const */ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/common/constants/Const.ets"));
const AxisModel_1 = __webpack_require__(/*! ../viewmodel/AxisModel */ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/viewmodel/AxisModel.ets");
const IconsModel_1 = __webpack_require__(/*! ../viewmodel/IconsModel */ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/viewmodel/IconsModel.ets");
class Index extends View {
    constructor(compilerAssignedUniqueChildId, parent, params) {
        super(compilerAssignedUniqueChildId, parent);
        this.__quantity = new ObservedPropertySimple(Const_1.default.IMAGES_MIN, this, "quantity");
        this.__axis = new ObservedPropertyObject(new AxisModel_1.AxisModel(Const_1.default.OFFSET_RADIUS, this.quantity), this, "axis");
        this.__iconModel = new ObservedPropertyObject(new IconsModel_1.IconsModel(this.quantity), this, "iconModel");
        this.updateWithValueParams(params);
    }
    updateWithValueParams(params) {
        if (params.quantity !== undefined) {
            this.quantity = params.quantity;
        }
        if (params.axis !== undefined) {
            this.axis = params.axis;
        }
        if (params.iconModel !== undefined) {
            this.iconModel = params.iconModel;
        }
    }
    aboutToBeDeleted() {
        this.__quantity.aboutToBeDeleted();
        this.__axis.aboutToBeDeleted();
        this.__iconModel.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id());
    }
    get quantity() {
        return this.__quantity.get();
    }
    set quantity(newValue) {
        this.__quantity.set(newValue);
    }
    get axis() {
        return this.__axis.get();
    }
    set axis(newValue) {
        this.__axis.set(newValue);
    }
    get iconModel() {
        return this.__iconModel.get();
    }
    set iconModel(newValue) {
        this.__iconModel.set(newValue);
    }
    render() {
        Column.create();
        Column.width(Const_1.default.DEFAULT_FULL_WIDTH);
        Column.height(Const_1.default.DEFAULT_FULL_HEIGHT);
        Column.backgroundColor({ "id": 16777223, "type": 10001, params: [], "bundleName": "com.example.animation", "moduleName": "entry" });
        let earlierCreatedChild_2 = (this && this.findChildById) ? this.findChildById("2") : undefined;
        if (earlierCreatedChild_2 == undefined) {
            View.create(new AnimationWidgets_1.AnimationWidgets("2", this, {
                quantity: this.__quantity,
                axis: this.axis,
                iconModel: this.iconModel
            }));
        }
        else {
            earlierCreatedChild_2.updateWithValueParams({
                axis: this.axis,
                iconModel: this.iconModel
            });
            View.create(earlierCreatedChild_2);
        }
        let earlierCreatedChild_3 = (this && this.findChildById) ? this.findChildById("3") : undefined;
        if (earlierCreatedChild_3 == undefined) {
            View.create(new CountController_1.CountController("3", this, {
                quantity: this.__quantity
            }));
        }
        else {
            earlierCreatedChild_3.updateWithValueParams({});
            View.create(earlierCreatedChild_3);
        }
        Column.pop();
    }
}
loadDocument(new Index("1", undefined, {}));


/***/ }),

/***/ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/view/AnimationWidgets.ets":
/*!************************************************************************************************************!*\
  !*** ../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/view/AnimationWidgets.ets ***!
  \************************************************************************************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {


var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
exports.AnimationWidgets = void 0;
let __generate__Id = 0;
function generateId() {
    return "AnimationWidgets_" + ++__generate__Id;
}
/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
__webpack_require__(/*! ../viewmodel/AxisModel */ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/viewmodel/AxisModel.ets");
__webpack_require__(/*! ../viewmodel/IconsModel */ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/viewmodel/IconsModel.ets");
const IconAnimation_1 = __webpack_require__(/*! ./IconAnimation */ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/view/IconAnimation.ets");
const Const_1 = __importDefault(__webpack_require__(/*! ../common/constants/Const */ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/common/constants/Const.ets"));
__webpack_require__(/*! ../common/bean/IconItem */ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/common/bean/IconItem.ets");
class AnimationWidgets extends View {
    constructor(compilerAssignedUniqueChildId, parent, params) {
        super(compilerAssignedUniqueChildId, parent);
        this.__mainFlag = new ObservedPropertySimple(false, this, "mainFlag");
        this.__quantity = new SynchedPropertySimpleTwoWay(params.quantity, this, "quantity");
        this.__axis = new SynchedPropertyNesedObject(params.axis, this, "axis");
        this.__iconModel = new SynchedPropertyNesedObject(params.iconModel, this, "iconModel");
        this.declareWatch("quantity", this.onQuantityChange);
        this.updateWithValueParams(params);
    }
    updateWithValueParams(params) {
        if (params.mainFlag !== undefined) {
            this.mainFlag = params.mainFlag;
        }
        this.__axis.set(params.axis);
        this.__iconModel.set(params.iconModel);
    }
    aboutToBeDeleted() {
        this.__mainFlag.aboutToBeDeleted();
        this.__quantity.aboutToBeDeleted();
        this.__axis.aboutToBeDeleted();
        this.__iconModel.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id());
    }
    get mainFlag() {
        return this.__mainFlag.get();
    }
    set mainFlag(newValue) {
        this.__mainFlag.set(newValue);
    }
    get quantity() {
        return this.__quantity.get();
    }
    set quantity(newValue) {
        this.__quantity.set(newValue);
    }
    get axis() {
        return this.__axis.get();
    }
    get iconModel() {
        return this.__iconModel.get();
    }
    onQuantityChange() {
        this.iconModel.addImage(this.quantity);
        this.axis.addPoints(this.quantity);
    }
    aboutToAppear() {
        this.onQuantityChange();
    }
    animate() {
        Context.animateTo({
            delay: Const_1.default.DELAY_10,
            tempo: Const_1.default.TEMPO,
            iterations: 1,
            duration: Const_1.default.DURATION_500,
            curve: Curve.Smooth,
            playMode: PlayMode.Normal
        }, () => {
            this.mainFlag = !this.mainFlag;
        });
    }
    render() {
        Stack.create();
        Stack.width(Const_1.default.DEFAULT_FULL_WIDTH);
        Stack.layoutWeight(1);
        Stack.create();
        Stack.rotate({
            x: 0,
            y: 0,
            z: 1,
            angle: this.mainFlag ? Const_1.default.ROTATE_ANGLE_360 : 0
        });
        ForEach.create("2", this, ObservedObject.GetRawObject(this.iconModel.imagerArr), (item) => {
            let earlierCreatedChild_1 = (this && this.findChildById) ? this.findChildById("1") : undefined;
            if (earlierCreatedChild_1 == undefined) {
                View.create(new IconAnimation_1.IconAnimation("1", this, {
                    item: item,
                    point: this.axis.points[item.index],
                    mainFlag: this.__mainFlag
                }));
            }
            else {
                earlierCreatedChild_1.updateWithValueParams({
                    item: item,
                    point: this.axis.points[item.index]
                });
                View.create(earlierCreatedChild_1);
            }
        }, item => JSON.stringify(item));
        ForEach.pop();
        Stack.pop();
        Image.create(this.mainFlag
            ? { "id": 16777245, "type": 20000, params: [], "bundleName": "com.example.animation", "moduleName": "entry" } : { "id": 16777246, "type": 20000, params: [], "bundleName": "com.example.animation", "moduleName": "entry" });
        Image.width({ "id": 16777237, "type": 10002, params: [], "bundleName": "com.example.animation", "moduleName": "entry" });
        Image.height({ "id": 16777237, "type": 10002, params: [], "bundleName": "com.example.animation", "moduleName": "entry" });
        Image.objectFit(ImageFit.Contain);
        Image.scale({
            x: this.mainFlag ? Const_1.default.INIT_SCALE : 1,
            y: this.mainFlag ? Const_1.default.INIT_SCALE : 1
        });
        Image.onClick(() => {
            this.iconModel.reset();
            this.animate();
        });
        Text.create({ "id": 16777222, "type": 10003, params: [], "bundleName": "com.example.animation", "moduleName": "entry" });
        Text.fontSize({ "id": 16777231, "type": 10002, params: [], "bundleName": "com.example.animation", "moduleName": "entry" });
        Text.opacity(Const_1.default.OPACITY_06);
        Text.fontColor({ "id": 16777224, "type": 10001, params: [], "bundleName": "com.example.animation", "moduleName": "entry" });
        Text.fontWeight(Const_1.default.FONT_WEIGHT_500);
        Text.margin({
            top: { "id": 16777227, "type": 10002, params: [], "bundleName": "com.example.animation", "moduleName": "entry" }
        });
        Text.pop();
        Stack.pop();
    }
}
exports.AnimationWidgets = AnimationWidgets;


/***/ }),

/***/ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/view/CountController.ets":
/*!***********************************************************************************************************!*\
  !*** ../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/view/CountController.ets ***!
  \***********************************************************************************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {


var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
exports.CountController = void 0;
let __generate__Id = 0;
function generateId() {
    return "CountController_" + ++__generate__Id;
}
const Const_1 = __importDefault(__webpack_require__(/*! ../common/constants/Const */ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/common/constants/Const.ets"));
function __Text__textStyle() {
    Text.fontSize({ "id": 16777231, "type": 10002, params: [], "bundleName": "com.example.animation", "moduleName": "entry" });
    Text.fontWeight(Const_1.default.FONT_WEIGHT_500);
}
class CountController extends View {
    constructor(compilerAssignedUniqueChildId, parent, params) {
        super(compilerAssignedUniqueChildId, parent);
        this.__quantity = new SynchedPropertySimpleTwoWay(params.quantity, this, "quantity");
        this.updateWithValueParams(params);
    }
    updateWithValueParams(params) {
    }
    aboutToBeDeleted() {
        this.__quantity.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id());
    }
    get quantity() {
        return this.__quantity.get();
    }
    set quantity(newValue) {
        this.__quantity.set(newValue);
    }
    render() {
        Column.create();
        Column.height(Const_1.default.CONTROLLER_WIDTH);
        Column.padding({
            top: { "id": 16777228, "type": 10002, params: [], "bundleName": "com.example.animation", "moduleName": "entry" },
            bottom: { "id": 16777228, "type": 10002, params: [], "bundleName": "com.example.animation", "moduleName": "entry" },
            left: { "id": 16777231, "type": 10002, params: [], "bundleName": "com.example.animation", "moduleName": "entry" },
            right: { "id": 16777231, "type": 10002, params: [], "bundleName": "com.example.animation", "moduleName": "entry" }
        });
        Column.margin({
            bottom: { "id": 16777235, "type": 10002, params: [], "bundleName": "com.example.animation", "moduleName": "entry" }
        });
        Column.width(Const_1.default.CONTROLLER_HEIGHT);
        Column.borderRadius({ "id": 16777233, "type": 10002, params: [], "bundleName": "com.example.animation", "moduleName": "entry" });
        Column.backgroundColor({ "id": 16777226, "type": 10001, params: [], "bundleName": "com.example.animation", "moduleName": "entry" });
        Row.create();
        Row.justifyContent(FlexAlign.SpaceBetween);
        Row.width(Const_1.default.DEFAULT_FULL_WIDTH);
        Row.margin({
            top: { "id": 16777234, "type": 10002, params: [], "bundleName": "com.example.animation", "moduleName": "entry" }
        });
        Text.create({ "id": 16777218, "type": 10003, params: [], "bundleName": "com.example.animation", "moduleName": "entry" });
        __Text__textStyle();
        Text.pop();
        Text.create(this.quantity.toFixed(0));
        __Text__textStyle();
        Text.pop();
        Row.pop();
        Slider.create({
            value: this.quantity,
            min: Const_1.default.IMAGES_MIN,
            max: Const_1.default.IMAGES_TOTAL,
            step: 1,
            style: SliderStyle.InSet
        });
        Slider.blockColor(Color.White);
        Slider.selectedColor('#007DFF');
        Slider.margin({
            top: { "id": 16777236, "type": 10002, params: [], "bundleName": "com.example.animation", "moduleName": "entry" }
        });
        Slider.showSteps(true);
        Slider.trackThickness({ "id": 16777232, "type": 10002, params: [], "bundleName": "com.example.animation", "moduleName": "entry" });
        Slider.onChange((value) => {
            this.quantity = value;
        });
        Column.pop();
    }
}
exports.CountController = CountController;


/***/ }),

/***/ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/view/IconAnimation.ets":
/*!*********************************************************************************************************!*\
  !*** ../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/view/IconAnimation.ets ***!
  \*********************************************************************************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {


var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
exports.IconAnimation = void 0;
let __generate__Id = 0;
function generateId() {
    return "IconAnimation_" + ++__generate__Id;
}
/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
const IconItem_1 = __importDefault(__webpack_require__(/*! ../common/bean/IconItem */ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/common/bean/IconItem.ets"));
const Point_1 = __importDefault(__webpack_require__(/*! ../common/bean/Point */ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/common/bean/Point.ets"));
const Const_1 = __importDefault(__webpack_require__(/*! ../common/constants/Const */ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/common/constants/Const.ets"));
class IconAnimation extends View {
    constructor(compilerAssignedUniqueChildId, parent, params) {
        super(compilerAssignedUniqueChildId, parent);
        this.__mainFlag = new SynchedPropertySimpleTwoWay(params.mainFlag, this, "mainFlag");
        this.__point = new ObservedPropertyObject(new Point_1.default(0, 0), this, "point");
        this.__item = new ObservedPropertyObject(new IconItem_1.default(0, { "id": 16777238, "type": 20000, params: [], "bundleName": "com.example.animation", "moduleName": "entry" }, false), this, "item");
        this.updateWithValueParams(params);
    }
    updateWithValueParams(params) {
        if (params.point !== undefined) {
            this.point = params.point;
        }
        if (params.item !== undefined) {
            this.item = params.item;
        }
    }
    aboutToBeDeleted() {
        this.__mainFlag.aboutToBeDeleted();
        this.__point.aboutToBeDeleted();
        this.__item.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id());
    }
    get mainFlag() {
        return this.__mainFlag.get();
    }
    set mainFlag(newValue) {
        this.__mainFlag.set(newValue);
    }
    get point() {
        return this.__point.get();
    }
    set point(newValue) {
        this.__point.set(newValue);
    }
    get item() {
        return this.__item.get();
    }
    set item(newValue) {
        this.__item.set(newValue);
    }
    render() {
        Image.create(this.item.image);
        Context.animation({
            delay: Const_1.default.DELAY_10,
            duration: Const_1.default.DURATION_1000,
            iterations: 1,
            curve: Curve.Smooth,
            playMode: PlayMode.Normal
        });
        Image.width(Const_1.default.ICON_WIDTH);
        Image.height(Const_1.default.ICON_HEIGHT);
        Image.objectFit(ImageFit.Contain);
        Image.translate(this.mainFlag
            ? { x: this.point.x, y: this.point.y }
            : { x: 0, y: 0 });
        Image.rotate({
            x: 0,
            y: 1,
            z: 0,
            angle: this.item.clicked ? Const_1.default.ROTATE_ANGLE_360 : 0
        });
        Image.scale(this.item.clicked
            ? { x: Const_1.default.SCALE_RATIO, y: Const_1.default.SCALE_RATIO }
            : { x: 1, y: 1 });
        Image.opacity(this.item.clicked ? Const_1.default.OPACITY_06 : 1);
        Image.onClick(() => {
            this.item.clicked = !this.item.clicked;
        });
        Context.animation(null);
    }
}
exports.IconAnimation = IconAnimation;


/***/ }),

/***/ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/viewmodel/AxisModel.ets":
/*!**********************************************************************************************************!*\
  !*** ../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/viewmodel/AxisModel.ets ***!
  \**********************************************************************************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {


var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
exports.AxisModel = void 0;
let __generate__Id = 0;
function generateId() {
    return "AxisModel_" + ++__generate__Id;
}
/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
const Point_1 = __importDefault(__webpack_require__(/*! ../common/bean/Point */ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/common/bean/Point.ets"));
const TWO_PI = 2 * Math.PI;
let AxisModel = class AxisModel {
    constructor(radius, num) {
        this.points = [];
        this.radius = radius;
        this.addPoints(num);
    }
    addPoints(num) {
        if (num <= 0) {
            return;
        }
        this.points = [];
        this.num = num;
        for (let i = 0; i < num; i++) {
            let x = this.radius * Math.cos(TWO_PI * i / this.num);
            let y = this.radius * Math.sin(TWO_PI * i / this.num);
            this.points.push(new Point_1.default(x, y));
        }
    }
};
AxisModel = __decorate([
    Observed
], AxisModel);
exports.AxisModel = AxisModel;


/***/ }),

/***/ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/viewmodel/IconsModel.ets":
/*!***********************************************************************************************************!*\
  !*** ../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/viewmodel/IconsModel.ets ***!
  \***********************************************************************************************************/
/***/ (function(__unused_webpack_module, exports, __webpack_require__) {


var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", ({ value: true }));
exports.IconsModel = void 0;
let __generate__Id = 0;
function generateId() {
    return "IconsModel_" + ++__generate__Id;
}
/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
const Const_1 = __importDefault(__webpack_require__(/*! ../common/constants/Const */ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/common/constants/Const.ets"));
const IconItem_1 = __importDefault(__webpack_require__(/*! ../common/bean/IconItem */ "../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/common/bean/IconItem.ets"));
let IconsModel = class IconsModel {
    constructor(num) {
        this.imagerArr = [];
        this.num = Const_1.default.IMAGES_MIN;
        this.addImage(num);
    }
    addImage(num) {
        this.imagerArr = [];
        this.num = num;
        for (let i = 0; i < num; i++) {
            this.imagerArr.push(new IconItem_1.default(i, Const_1.default.IMAGE_RESOURCE[i], false));
        }
    }
    reset() {
        for (let i = 0; i < this.num; i++) {
            if (this.imagerArr[i].clicked) {
                this.imagerArr[i].clicked = false;
            }
        }
    }
};
IconsModel = __decorate([
    Observed
], IconsModel);
exports.IconsModel = IconsModel;


/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		var commonCachedModule = globalThis["__common_module_cache___ed5f3d8eeddb64db6d429a154213e514"] ? globalThis["__common_module_cache___ed5f3d8eeddb64db6d429a154213e514"][moduleId]: null;
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
/******/ 		function isCommonModue(moduleId) {
/******/ 		                if (globalThis["webpackChunk_ed5f3d8eeddb64db6d429a154213e514"]) {
/******/ 		                  const length = globalThis["webpackChunk_ed5f3d8eeddb64db6d429a154213e514"].length;
/******/ 		                  switch (length) {
/******/ 		                    case 1:
/******/ 		                      return globalThis["webpackChunk_ed5f3d8eeddb64db6d429a154213e514"][0][1][moduleId];
/******/ 		                    case 2:
/******/ 		                      return globalThis["webpackChunk_ed5f3d8eeddb64db6d429a154213e514"][0][1][moduleId] ||
/******/ 		                      globalThis["webpackChunk_ed5f3d8eeddb64db6d429a154213e514"][1][1][moduleId];
/******/ 		                  }
/******/ 		                }
/******/ 		                return undefined;
/******/ 		              }
/******/ 		if (globalThis["__common_module_cache___ed5f3d8eeddb64db6d429a154213e514"] && String(moduleId).indexOf("?name=") < 0 && isCommonModue(moduleId)) {
/******/ 		  globalThis["__common_module_cache___ed5f3d8eeddb64db6d429a154213e514"][moduleId] = module;
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
/******/ 	var __webpack_exports__ = __webpack_require__("../../../../../../../codeHub/930/930HarmonyOS/Animation/entry/src/main/ets/pages/Index.ets?entry");
/******/ 	_ed5f3d8eeddb64db6d429a154213e514 = __webpack_exports__;
/******/ 	
/******/ })()
;
//# sourceMappingURL=Index.js.map