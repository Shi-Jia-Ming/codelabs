/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import webView from '@ohos:web.webview';
import http from '@ohos:net.http';
import promptAction from '@ohos:promptAction';
import httpGet from '@bundle:com.example.httpsrequest/entry/ets/common/utils/HttpUtil';
import StyleConstant from '@bundle:com.example.httpsrequest/entry/ets/common/constant/StyleConstant';
import CommonConstant from '@bundle:com.example.httpsrequest/entry/ets/common/constant/CommonConstants';
class WebPage extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1) {
        super(parent, __localStorage, elmtId);
        this.controller = new webView.WebviewController();
        this.__buttonName = new ObservedPropertyObjectPU({ "id": 16777224, "type": 10003, params: [], "bundleName": "com.example.httpsrequest", "moduleName": "entry" }, this, "buttonName");
        this.__webVisibility = new ObservedPropertySimplePU(Visibility.Hidden, this, "webVisibility");
        this.__webSrc = new ObservedPropertySimplePU(CommonConstant.SERVER, this, "webSrc");
        this.setInitiallyProvidedValue(params);
    }
    setInitiallyProvidedValue(params) {
        if (params.controller !== undefined) {
            this.controller = params.controller;
        }
        if (params.buttonName !== undefined) {
            this.buttonName = params.buttonName;
        }
        if (params.webVisibility !== undefined) {
            this.webVisibility = params.webVisibility;
        }
        if (params.webSrc !== undefined) {
            this.webSrc = params.webSrc;
        }
    }
    updateStateVars(params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
        this.__buttonName.purgeDependencyOnElmtId(rmElmtId);
        this.__webVisibility.purgeDependencyOnElmtId(rmElmtId);
        this.__webSrc.purgeDependencyOnElmtId(rmElmtId);
    }
    aboutToBeDeleted() {
        this.__buttonName.aboutToBeDeleted();
        this.__webVisibility.aboutToBeDeleted();
        this.__webSrc.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id__());
        this.aboutToBeDeletedInternal();
    }
    get buttonName() {
        return this.__buttonName.get();
    }
    set buttonName(newValue) {
        this.__buttonName.set(newValue);
    }
    get webVisibility() {
        return this.__webVisibility.get();
    }
    set webVisibility(newValue) {
        this.__webVisibility.set(newValue);
    }
    get webSrc() {
        return this.__webSrc.get();
    }
    set webSrc(newValue) {
        this.__webSrc.set(newValue);
    }
    initialRender() {
        this.observeComponentCreation((elmtId, isInitialRender) => {
            ViewStackProcessor.StartGetAccessRecordingFor(elmtId);
            Column.create();
            Column.width(StyleConstant.FULL_WIDTH);
            Column.height(StyleConstant.FULL_HEIGHT);
            Column.backgroundImage({ "id": 16777238, "type": 20000, params: [ImageRepeat.NoRepeat], "bundleName": "com.example.httpsrequest", "moduleName": "entry" });
            Column.backgroundImageSize(ImageSize.Cover);
            if (!isInitialRender) {
                Column.pop();
            }
            ViewStackProcessor.StopGetAccessRecording();
        });
        this.observeComponentCreation((elmtId, isInitialRender) => {
            ViewStackProcessor.StartGetAccessRecordingFor(elmtId);
            Row.create();
            Row.margin({
                top: { "id": 16777231, "type": 10002, params: [], "bundleName": "com.example.httpsrequest", "moduleName": "entry" },
                left: { "id": 16777231, "type": 10002, params: [], "bundleName": "com.example.httpsrequest", "moduleName": "entry" },
                right: { "id": 16777231, "type": 10002, params: [], "bundleName": "com.example.httpsrequest", "moduleName": "entry" }
            });
            Row.height({ "id": 16777233, "type": 10002, params: [], "bundleName": "com.example.httpsrequest", "moduleName": "entry" });
            Row.backgroundColor(Color.White);
            Row.borderRadius({ "id": 16777227, "type": 10002, params: [], "bundleName": "com.example.httpsrequest", "moduleName": "entry" });
            Row.padding({
                left: { "id": 16777232, "type": 10002, params: [], "bundleName": "com.example.httpsrequest", "moduleName": "entry" },
                right: { "id": 16777232, "type": 10002, params: [], "bundleName": "com.example.httpsrequest", "moduleName": "entry" }
            });
            if (!isInitialRender) {
                Row.pop();
            }
            ViewStackProcessor.StopGetAccessRecording();
        });
        this.observeComponentCreation((elmtId, isInitialRender) => {
            ViewStackProcessor.StartGetAccessRecordingFor(elmtId);
            Image.create({ "id": 16777239, "type": 20000, params: [], "bundleName": "com.example.httpsrequest", "moduleName": "entry" });
            Image.height({ "id": 16777234, "type": 10002, params: [], "bundleName": "com.example.httpsrequest", "moduleName": "entry" });
            Image.width({ "id": 16777235, "type": 10002, params: [], "bundleName": "com.example.httpsrequest", "moduleName": "entry" });
            if (!isInitialRender) {
                Image.pop();
            }
            ViewStackProcessor.StopGetAccessRecording();
        });
        this.observeComponentCreation((elmtId, isInitialRender) => {
            ViewStackProcessor.StartGetAccessRecordingFor(elmtId);
            TextInput.create({ placeholder: { "id": 16777222, "type": 10003, params: [], "bundleName": "com.example.httpsrequest", "moduleName": "entry" }, text: this.webSrc });
            TextInput.height({ "id": 16777236, "type": 10002, params: [], "bundleName": "com.example.httpsrequest", "moduleName": "entry" });
            TextInput.layoutWeight(1);
            TextInput.backgroundColor(Color.White);
            TextInput.onChange((value) => {
                this.webSrc = value;
            });
            if (!isInitialRender) {
                TextInput.pop();
            }
            ViewStackProcessor.StopGetAccessRecording();
        });
        Row.pop();
        this.observeComponentCreation((elmtId, isInitialRender) => {
            ViewStackProcessor.StartGetAccessRecordingFor(elmtId);
            Row.create();
            Row.visibility(this.webVisibility);
            Row.height(StyleConstant.WEB_HEIGHT);
            Row.width(StyleConstant.FULL_WIDTH);
            Row.align(Alignment.Top);
            if (!isInitialRender) {
                Row.pop();
            }
            ViewStackProcessor.StopGetAccessRecording();
        });
        this.observeComponentCreation((elmtId, isInitialRender) => {
            ViewStackProcessor.StartGetAccessRecordingFor(elmtId);
            Web.create({ src: this.webSrc, controller: this.controller });
            Web.zoomAccess(true);
            Web.height(StyleConstant.FULL_HEIGHT);
            Web.width(StyleConstant.FULL_WIDTH);
            if (!isInitialRender) {
                Web.pop();
            }
            ViewStackProcessor.StopGetAccessRecording();
        });
        Row.pop();
        this.observeComponentCreation((elmtId, isInitialRender) => {
            ViewStackProcessor.StartGetAccessRecordingFor(elmtId);
            Row.create();
            Row.height({ "id": 16777233, "type": 10002, params: [], "bundleName": "com.example.httpsrequest", "moduleName": "entry" });
            if (!isInitialRender) {
                Row.pop();
            }
            ViewStackProcessor.StopGetAccessRecording();
        });
        this.observeComponentCreation((elmtId, isInitialRender) => {
            ViewStackProcessor.StartGetAccessRecordingFor(elmtId);
            Button.createWithLabel(this.buttonName);
            Button.fontSize({ "id": 16777228, "type": 10002, params: [], "bundleName": "com.example.httpsrequest", "moduleName": "entry" });
            Button.width(StyleConstant.BUTTON_WIDTH);
            Button.height({ "id": 16777229, "type": 10002, params: [], "bundleName": "com.example.httpsrequest", "moduleName": "entry" });
            Button.fontWeight(FontWeight.Bold);
            Button.onClick(() => {
                this.onRequest();
            });
            if (!isInitialRender) {
                Button.pop();
            }
            ViewStackProcessor.StopGetAccessRecording();
        });
        Button.pop();
        Row.pop();
        Column.pop();
    }
    async onRequest() {
        if (this.webVisibility === Visibility.Hidden) {
            this.webVisibility = Visibility.Visible;
            try {
                let result = await httpGet(this.webSrc);
                if (result && result.responseCode === http.ResponseCode.OK) {
                    this.controller.clearHistory();
                    this.controller.loadUrl(this.webSrc);
                }
            }
            catch (error) {
                promptAction.showToast({
                    message: { "id": 16777221, "type": 10003, params: [], "bundleName": "com.example.httpsrequest", "moduleName": "entry" }
                });
            }
        }
        else {
            this.webVisibility = Visibility.Hidden;
        }
    }
    rerender() {
        this.updateDirtyElements();
    }
}
ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent());
loadDocument(new WebPage(undefined, {}));
ViewStackProcessor.StopGetAccessRecording();
//# sourceMappingURL=WebPage.js.map