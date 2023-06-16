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
#include <hilog/log.h>
#include "napi/native_api.h"
#include "math.h"
#include "./common/common.h"

static napi_value MyHypot(napi_env env, napi_callback_info info)
{
    if ((nullptr == env) || (nullptr == info)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MyHypot", "env or exports is null");
        return nullptr;
    }

    // Number of parameters.
    size_t argc = PARAMETER_COUNT;

    // Declare parameter array.
    napi_value args[PARAMETER_COUNT] = { nullptr };

    // Gets the arguments passed in and puts them in the argument array.
    if (napi_ok != napi_get_cb_info(env, info, &argc, args, nullptr, nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MyHypot", "api_get_cb_info failed");
        return nullptr;
    }

    // Converts arguments passed in to type double.
    double valueX = 0.0;
    double valueY = 0.0;
    if (napi_ok != napi_get_value_double(env, args[0], &valueX) ||
        napi_ok != napi_get_value_double(env, args[1], &valueY)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MyHypot", "napi_get_value_double failed");
        return nullptr;
    }

    // The hypot method of the C standard library is called to perform the calculation.
    double result = hypot(valueX, valueY);

    napi_value napiResult;
    if (napi_ok != napi_create_double(env, result, &napiResult)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MyHypot", "napi_create_double failed");
        return nullptr;
    }
    return napiResult;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    if ((nullptr == env) || (nullptr == exports)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return exports;
    }

    napi_property_descriptor desc[] = {
        { "myHypot", nullptr, MyHypot, nullptr, nullptr, nullptr, napi_default, nullptr }
    };
    if (napi_ok != napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "napi_define_properties failed");
        return nullptr;
    }
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "hello",
    .nm_priv = ((void *)0),
    .reserved = { 0 }
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}