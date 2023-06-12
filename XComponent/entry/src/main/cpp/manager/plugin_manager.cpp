/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
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

#include <stdint.h>
#include <string>
#include <stdio.h>

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <hilog/log.h>

#include "plugin_manager.h"
#include "../common/common.h"

PluginManager PluginManager::m_pluginManager;

napi_value PluginManager::GetContext(napi_env env, napi_callback_info info)
{
    size_t argCnt = GET_CONTEXT_PARAM_CNT;
    napi_value args[GET_CONTEXT_PARAM_CNT] = {nullptr};
    napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr);
    if (GET_CONTEXT_PARAM_CNT != argCnt) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }

    napi_valuetype valuetype;
    if (napi_ok != napi_typeof(env, args[0], &valuetype)) {
        return nullptr;
    }

    if (napi_number != valuetype) {
        napi_throw_type_error(env, NULL, "Wrong type of arguments");
        return nullptr;
    }

    int64_t value;
    if (napi_ok != napi_get_value_int64(env, args[0], &value)) {
        return nullptr;
    }

    napi_value exports;
    if (napi_ok != napi_create_object(env, &exports)) {
        return nullptr;
    }

    switch (value) {
        case APP_LIFECYCLE: {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, "PluginManager", "getContext: APP_LIFECYCLE");
            /* ****  Register App Lifecycle  **** */
            napi_property_descriptor desc[] = {
                {"onCreate", nullptr, PluginManager::NapiOnCreate, nullptr, nullptr, nullptr, napi_default, nullptr},
                {"onShow", nullptr, PluginManager::NapiOnShow, nullptr, nullptr, nullptr, napi_default, nullptr},
                {"onHide", nullptr, PluginManager::NapiOnHide, nullptr, nullptr, nullptr, napi_default, nullptr},
                {"onDestroy", nullptr, PluginManager::NapiOnDestroy, nullptr, nullptr, nullptr, napi_default, nullptr}
            };
            napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
        } break;
        case JS_PAGE_LIFECYCLE: {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, "PluginManager", "getContext: JS_PAGE_LIFECYCLE");
            /* ****  Register JS Page Lifecycle  **** */
            napi_property_descriptor desc[] = {
                {"aboutToAppear", nullptr, PluginManager::NapiToAppear, nullptr, nullptr, nullptr, napi_default, nullptr},
                {"aboutToDisappear", nullptr, PluginManager::NapiToDisappear, nullptr, nullptr, nullptr, napi_default, nullptr},
                {"onPageShow", nullptr, PluginManager::NapiOnPageShow, nullptr, nullptr, nullptr, napi_default, nullptr},
                {"onPageHide", nullptr, PluginManager::NapiOnPageHide, nullptr, nullptr, nullptr, napi_default, nullptr}
            };
            napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
        } break;
        default:
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, "PluginManager", "getContext: wrong type of arguments");
    }
    return exports;
}

bool PluginManager::Export(napi_env env, napi_value exports)
{
    napi_value exportInstance = nullptr;
    if (napi_ok != napi_get_named_property(env, exports, OH_NATIVE_XCOMPONENT_OBJ, &exportInstance)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "Export: napi_get_named_property fail");
        return false;
    }

    OH_NativeXComponent *nativeXComponent = nullptr;
    if (napi_ok != napi_unwrap(env, exportInstance, reinterpret_cast<void **>(&nativeXComponent))) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "Export: napi_unwrap fail");
        return false;
    }

    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    if (OH_NATIVEXCOMPONENT_RESULT_SUCCESS != OH_NativeXComponent_GetXComponentId(nativeXComponent, idStr, &idSize)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager",
            "Export: OH_NativeXComponent_GetXComponentId fail");
        return false;
    }

    std::string id(idStr);
    auto context = PluginManager::GetInstance();
    if (nullptr != context) {
        context->SetNativeXComponent(id, nativeXComponent);
        auto render = context->GetRender(id);
        OH_NativeXComponent_RegisterCallback(nativeXComponent, &PluginRender::m_callback);
        if (nullptr != render) {
            render->Export(env, exports);
        }
        return true;
    }
    return false;
}

void PluginManager::SetNativeXComponent(std::string &id, OH_NativeXComponent *nativeXComponent)
{
    if (m_nativeXComponentMap.find(id) == m_nativeXComponentMap.end()) {
        m_nativeXComponentMap[id] = nativeXComponent;
    } else {
        if (m_nativeXComponentMap[id] != nativeXComponent) {
            m_nativeXComponentMap[id] = nativeXComponent;
        }
    }
}

PluginRender *PluginManager::GetRender(std::string &id)
{
    if (m_pluginRenderMap.find(id) == m_pluginRenderMap.end()) {
        PluginRender *instance = PluginRender::GetInstance(id);
        m_pluginRenderMap[id] = instance;
        return instance;
    } else {
        return m_pluginRenderMap[id];
    }
}

napi_value PluginManager::NapiOnCreate(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, "PluginManager", "NapiOnCreate");
    // do something
    return nullptr;
}

napi_value PluginManager::NapiOnShow(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, "PluginManager", "NapiOnShow");
    // do something
    return nullptr;
}

napi_value PluginManager::NapiOnHide(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, "PluginManager", "NapiOnHide");
    // do something
    return nullptr;
}

napi_value PluginManager::NapiOnDestroy(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, "PluginManager", "NapiOnDestroy");
    PluginRender::ReleaseEgl();
    // do something
    return nullptr;
}

napi_value PluginManager::NapiToAppear(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, "PluginManager", "NapiToAppear");
    // do something
    return nullptr;
}

napi_value PluginManager::NapiToDisappear(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, "PluginManager", "NapiToDisappear");
    // do something
    return nullptr;
}

napi_value PluginManager::NapiOnPageShow(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, "PluginManager", "NapiOnPageShow");
    // do something
    return nullptr;
}

napi_value PluginManager::NapiOnPageHide(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, "PluginManager", "NapiOnPageHide");
    // do something
    return nullptr;
}
