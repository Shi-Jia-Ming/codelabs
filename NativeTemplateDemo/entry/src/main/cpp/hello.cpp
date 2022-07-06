/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

static napi_value hyPotC(napi_env env, napi_callback_info info)
{
    // 参数数量
    size_t argc = 2;
    // 声明参数数组
    napi_value args[2] = {nullptr};
    // 获取传入的参数并依次放入参数数组中
    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);
    // 对第一个js参数类型进行判定
    napi_valuetype valueType0;
    napi_typeof(env, args[0], &valueType0);
    // 对第二个js参数类型进行判定
    napi_valuetype valueType1;
    napi_typeof(env, args[1], &valueType1);
    // 将第一个传入参数转化为double类型
    double value0;
    napi_get_value_double(env, args[0], &value0);
    // 将第二个传入参数转化为double类型
    double value1;
    napi_get_value_double(env, args[1], &value1);
    // 声明返回结果字段，并调用C标准库的hypot方法进行计算
    napi_value sum;
    double result = hypot(value0,value1);
    napi_create_double(env, result, &sum);
    return sum;
}



EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "hyPot", nullptr, hyPotC, nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
.nm_version =1,
.nm_flags = 0,
.nm_filename = nullptr,
.nm_register_func = Init,
.nm_modname = "libhello",
.nm_priv = ((void*)0),
.reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
napi_module_register(&demoModule);
}
