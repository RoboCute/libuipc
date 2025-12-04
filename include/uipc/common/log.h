#pragma once
#include <uipc/common/logger.h>
#include <uipc/common/string.h>
#include <uipc/common/config.h>
#include <uipc/common/abort.h>
#include <luisa/core/logging.h>

#define UIPC_LOG_WITH_LOCATION(level, ...)                                                          \
    {                                                                                               \
        ::uipc::string msg = ::uipc::logger::format(__VA_ARGS__);                                   \
        ::uipc::logger::log((level), ::uipc::logger::format("{} {}({})", msg, __FILE__, __LINE__)); \
    }

#define UIPC_INFO_WITH_LOCATION(...)                                           \
    UIPC_LOG_WITH_LOCATION(spdlog::level::info, __VA_ARGS__)

#define UIPC_WARN_WITH_LOCATION(...)                                           \
    UIPC_LOG_WITH_LOCATION(spdlog::level::warn, __VA_ARGS__)

#define UIPC_ERROR_WITH_LOCATION(...)                                          \
    UIPC_LOG_WITH_LOCATION(spdlog::level::err, __VA_ARGS__)

#define UIPC_ASSERT(...) LUISA_ASSERT(__VA_ARGS__)
//            ::uipc::string msg = ::fmt::format(__VA_ARGS__);                                   \
    //         ::uipc::logger::my_log(spdlog::level::err, fmt::format("{} {}({})", assert_msg, __FILE__, __LINE__)); \
    //         ::uipc::abort();                                                                   \
    //     }                                                                                      \
    // }
