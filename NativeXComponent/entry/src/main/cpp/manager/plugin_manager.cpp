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
#include <stdio.h>

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <hilog/log.h>

#include "plugin_manager.h"


enum ContextType {
    APP_LIFECYCLE,
    JS_PAGE_LIFECYCLE,
};

PluginManager PluginManager::manager_;

napi_value PluginManager::getContext(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value exports;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    if (argc != 1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }

    napi_valuetype valuetype;
    status = napi_typeof(env, args[0], &valuetype);

    if (status != napi_ok) {
        return nullptr;
    }

    if (valuetype != napi_number) {
        napi_throw_type_error(env, NULL, "Wrong type of arguments");
        return nullptr;
    }

    int64_t value;
    napi_get_value_int64(env, args[0], &value);
    napi_create_object(env, &exports);

    switch (value) {
        case JS_PAGE_LIFECYCLE: {
            /*****  声明式开发范式 JS Page 生命周期注册  *****/
            OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "PluginManager", "getContext: JS_PAGE_LIFECYCLE");
            /*****  Register JS Page Lifecycle  *****/
            napi_property_descriptor desc[] = {
                { "aboutToAppear", nullptr, PluginManager::NapiToAppear, nullptr, nullptr, nullptr, napi_default, nullptr },
                { "aboutToDisappear", nullptr, PluginManager::NapiToDisappear, nullptr, nullptr, nullptr, napi_default, nullptr },
                { "onPageShow", nullptr, PluginManager::NapiOnPageShow, nullptr, nullptr, nullptr, napi_default, nullptr },
                { "onPageHide", nullptr, PluginManager::NapiOnPageHide, nullptr, nullptr, nullptr, napi_default, nullptr }
            };
            napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
        }
            break;

        default:
            OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "PluginManager", "getContext: wrong type of arguments");
    }
    return exports;
}


bool PluginManager::Export(napi_env env, napi_value exports)
{
    napi_status status;
    napi_value exportInstance = nullptr;
    OH_NativeXComponent *nativeXComponent = nullptr;
    int32_t ret;
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;

    status = napi_get_named_property(env, exports, OH_NATIVE_XCOMPONENT_OBJ, &exportInstance);
    if (status != napi_ok) {
        return false;
    }

    status = napi_unwrap(env, exportInstance, reinterpret_cast<void**>(&nativeXComponent));
    if (status != napi_ok) {
        return false;
    }

    ret = OH_NativeXComponent_GetXComponentId(nativeXComponent, idStr, &idSize);
    if (ret != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        return false;
    }

    std::string id(idStr);
    auto context = PluginManager::GetInstance();
    if (context) {
        context->setNativeXComponent(id, nativeXComponent);
        auto render = context->GetRender(id);
        OH_NativeXComponent_RegisterCallback(nativeXComponent, &PluginRender::callback_);
        render->Export(env, exports);
        return true;
    }
    return false;
}


void PluginManager::setNativeXComponent(std::string& id, OH_NativeXComponent* nativeXComponent)
{
    if (nativeXComponentMap_.find(id) == nativeXComponentMap_.end()) {
        nativeXComponentMap_[id] = nativeXComponent;
    } else {
        if (nativeXComponentMap_[id] != nativeXComponent) {
            nativeXComponentMap_[id] = nativeXComponent;
        }
    }
}


PluginRender* PluginManager::GetRender(std::string& id)
{
    if (pluginRenderMap_.find(id) == pluginRenderMap_.end()) {
        PluginRender* instance = PluginRender::getInstance(id);
        pluginRenderMap_[id] = instance;
        return instance;
    } else {
        return pluginRenderMap_[id];
    }
}

napi_value PluginManager::NapiToAppear(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "PluginManager", "NapiToAppear");
    // do something
    return nullptr;
}

napi_value PluginManager::NapiToDisappear(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "PluginManager", "NapiToDisappear");
    // do something
    return nullptr;
}

napi_value PluginManager::NapiOnPageShow(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "PluginManager", "NapiOnPageShow");
    // do something
    return nullptr;
}


napi_value PluginManager::NapiOnPageHide(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "PluginManager", "NapiOnPageHide");
    // do something
    return nullptr;
}


