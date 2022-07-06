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
#ifndef PLUGIN_RENDER_H
#define PLUGIN_RENDER_H

#include <string>
#include <unordered_map>

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <napi/native_api.h>

#include "egl_core.h"


class PluginRender {
public:
    explicit PluginRender(std::string& id);
    ~PluginRender() {}
    static PluginRender* getInstance(std::string& id);

public:
    napi_value Export(napi_env env, napi_value exports);

    // Exposed to JS developers by NAPI
    static napi_value NapiDrawRectangle(napi_env env, napi_callback_info info);

public:
    static std::unordered_map<std::string, PluginRender*> instance_;
    static OH_NativeXComponent_Callback callback_;

    EGLCore* eglCore_;

    std::string id_;
    uint64_t width_;
    uint64_t height_;

    double x_;
    double y_;
    OH_NativeXComponent_TouchEvent touchEvent_;
};

#endif
