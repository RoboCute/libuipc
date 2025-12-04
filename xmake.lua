set_xmakever("2.9.8")
set_policy("check.auto_ignore_flags", false)
add_rules("mode.release", "mode.debug", "mode.releasedbg")

option("uipc_app", {default = true})
-- option("gui", {default = false})
option("uipc_pybind", {default = false, description = "Build pyuipc"})
-- option("torch", {default = false, description = "Build pytorch extension"})
option("uipc_examples", {default = true})
option("uipc_tests", {default = true})
option("uipc_benchmarks", {default = false})
option("uipc_dev", {default = true, description = "Enable developer mode"})
option("uipc_github_actions", {default = false})
option("uipc_backend", {default = "cuda", description = "Build with CUDA backend"})
option("uipc_projectdir")
set_default(false)
set_showmenu(false)
after_check(function(option)
    option:set_value(os.scriptdir())
end)
option_end()

-- option("python_version", {default = "3.11.x", description = "Specify python version"})
-- option("python_system", {default = false, description = "Use system python"})


if has_config('uipc_app') then
    includes("apps")
end
includes("src", "xmake/*.lua")


set_languages("c++20")

if is_plat("windows") then
    add_cxflags("/FC")
    add_cxflags("/wd4068", "/wd4068")
else
    add_cxflags("-fmacro-prefix-map==" .. os.projectdir(), {force = true})
end

if is_plat("linux") then
    add_rpathdirs("$ORIGIN")
end

set_version("0.9.0")

if has_config("uipc_dev") then
    set_policy("compatibility.version", "3.0")
    set_policy("build.ccache", true)

    -- if is_plat("windows") then
    --     set_runtimes("MD")
    -- end
end
