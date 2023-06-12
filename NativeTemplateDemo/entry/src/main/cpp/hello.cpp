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
#include "napi/native_api.h"
#include "math.h"

static napi_value MyHypot(napi_env env, napi_callback_info info) {
    // Number of parameters.
    size_t argc = 2;

    // Declare parameter array.
    napi_value args[2] = {nullptr};

    // Gets the arguments passed in and puts them in the argument array.
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    // Converts the first argument passed in to type double.
    double value0;
    napi_get_value_double(env, args[0], &value0);

    // Converts the second argument passed in to type double.
    double value1;
    napi_get_value_double(env, args[1], &value1);

    // The hypot method of the C standard library is called to perform the calculation.
    double result = hypot(value0, value1);

    napi_value sum;
    napi_create_double(env, result, &sum);
    return sum;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"myHypot", nullptr, MyHypot, nullptr, nullptr, nullptr, napi_default, nullptr}
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
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
    .reserved = {0}
};

extern "C" __attribute__((constructor)) void RegisterModule(void) {
    napi_module_register(&demoModule);
}
