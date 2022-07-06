/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
#include <stdint.h>
#include <string>

#include <js_native_api.h>
#include <js_native_api_types.h>
#include <hilog/log.h>

#include "plugin_render.h"
#include "../manager/plugin_manager.h"

#ifdef __cplusplus
extern "C" {
#endif


std::unordered_map<std::string, PluginRender*> PluginRender::instance_;
OH_NativeXComponent_Callback PluginRender::callback_;


void OnSurfaceCreatedCB(OH_NativeXComponent* component, void* window)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Callback", "OnSurfaceCreatedCB");

    int32_t xID;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    xID = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);

    if (xID != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "Callback", "OnSurfaceCreatedCB: Unable to get XComponent id");
        return;
    }

    std::string id(idStr);
    auto render = PluginRender::getInstance(id);
    int32_t xSize = OH_NativeXComponent_GetXComponentSize(component, window, &render->width_, &render->height_);
    if (xSize == OH_NATIVEXCOMPONENT_RESULT_SUCCESS && render) {
        render->eglCore_->eglContextInit(window, render->width_, render->height_);
    }
}


void OnSurfaceChangedCB(OH_NativeXComponent* component, void* window)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Callback", "OnSurfaceChangedCB");

    int32_t xID;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    xID = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);

    if (xID != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "Callback", "OnSurfaceChangedCB: Unable to get XComponent id");
        return;
    }

    std::string id(idStr);
    auto render = PluginRender::getInstance(id);
    if (render) {
        // do something
    }
}


void OnSurfaceDestroyedCB(OH_NativeXComponent* component, void* window)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Callback", "OnSurfaceDestroyedCB");

    int32_t xID;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    xID = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);

    if (xID != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "Callback", "OnSurfaceDestroyedCB: Unable to get XComponent id");
        return;
    }

    std::string id(idStr);
    auto render = PluginRender::getInstance(id);
    if (render) {
        // do something
    }
}


void DispatchTouchEventCB(OH_NativeXComponent* component, void* window)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Callback", "DispatchTouchEventCB");

    int32_t xID;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    xID = OH_NativeXComponent_GetXComponentId(component, idStr, &idSize);

    if (xID != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "Callback", "DispatchTouchEventCB: Unable to get XComponent id");
        return;
    }

    std::string id(idStr);
    auto render = PluginRender::getInstance(id);
    if (render) {
        render->eglCore_->changeColor();
    }
}


PluginRender::PluginRender(std::string& id) : id_(id)
{
    eglCore_ = new EGLCore(id);
    auto renderCallback = &PluginRender::callback_;
    renderCallback->OnSurfaceCreated = OnSurfaceCreatedCB;
    renderCallback->OnSurfaceChanged = OnSurfaceChangedCB;
    renderCallback->OnSurfaceDestroyed = OnSurfaceDestroyedCB;
    renderCallback->DispatchTouchEvent = DispatchTouchEventCB;
}


PluginRender* PluginRender::getInstance(std::string& id)
{
    if (instance_.find(id) == instance_.end()) {
        PluginRender* instance = new PluginRender(id);
        instance_[id] = instance;
        return instance;
    } else {
        return instance_[id];
    }
}


napi_value PluginRender::Export(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "drawTriangle", nullptr, PluginRender::NapiDrawRectangle, nullptr, nullptr, nullptr, napi_default, nullptr}
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}


napi_value PluginRender::NapiDrawRectangle(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "PluginRender", "NapiDrawRectangle");
    napi_value exportInstance;
    napi_value thisArg;
    napi_status status;
    OH_NativeXComponent *nativeXComponent = nullptr;

    int32_t xID;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;

    napi_get_cb_info(env, info, nullptr, nullptr, &thisArg, nullptr);

    status = napi_get_named_property(env, thisArg, OH_NATIVE_XCOMPONENT_OBJ, &exportInstance);
    if (status != napi_ok) {
        return nullptr;
    };

    status = napi_unwrap(env, exportInstance, reinterpret_cast<void**>(&nativeXComponent));
    if (status != napi_ok) {
        return nullptr;
    }

    xID = OH_NativeXComponent_GetXComponentId(nativeXComponent, idStr, &idSize);
    if (xID != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "PluginRender", "NapiDrawRectangle: Unable to get XComponent id");
        return nullptr;
    }

    std::string id(idStr);
    PluginRender* render = PluginRender::getInstance(id);
    if (render) {
        render->eglCore_->draw();
    }
    return nullptr;
}


#ifdef __cplusplus
}
#endif