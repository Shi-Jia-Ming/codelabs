#include "napi/native_api.h"
#include <string>

static napi_value NativeCheck(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);

    char type[64] = {0};
    size_t bufSize = 63;
    size_t accountLength = 0;
    napi_get_value_string_utf8(env, args[0], type, bufSize, &accountLength);

    if (accountLength == 0) {
        napi_value result;
        std::string words = "Please input the account";
        napi_create_string_utf8(env, words.c_str(), words.length(), &result);
        return result;
    }

    size_t passwordLength = 0;
    napi_get_value_string_utf8(env, args[1], type, bufSize, &passwordLength);

    if (passwordLength == 0) {
        napi_value result;
        std::string words = "Please input the password";
        napi_create_string_utf8(env, words.c_str(), words.length(), &result);
        return result;
    }

    napi_value pass;
    std::string words = "login";
    napi_create_string_utf8(env, words.c_str(), words.length(), &pass);

    return pass;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "nativeCheck", nullptr, NativeCheck, nullptr, nullptr, nullptr, napi_default, nullptr }
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
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
