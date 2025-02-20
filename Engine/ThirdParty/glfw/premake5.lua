project "glfw"
    kind "StaticLib"
    language "C"
    removeplatforms "emscripten"
    staticruntime "Off"

    targetdir ("%{wks.location}/BinOutput/" .. WorkspaceSettings.OutputDir .. "/%{prj.name}")
	objdir ("%{wks.location}/BinIntermediate/" .. WorkspaceSettings.OutputDir .. "/%{prj.name}")

    files 
    {
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",

        "src/context.c",
        "src/monitor.c",
        "src/window.c",
        "src/vulkan.c",
        "src/input.c",
        "src/init.c",
    }

    includedirs 
    {
        "include"  
    }

    if EngineFeatures.SupportVulkan == true then
        includedirs
        {
            "%{IncludeDirs.Vulkan}"
        }
    end

    filter "system:windows"
		systemversion "latest"

		defines 
		{ 
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}

        files
        {
            "src/win32_platform.h",
            "src/win32_joystick.h",
            "src/wgl_context.h",
            "src/egl_context.h",
            "src/osmesa_context.h",
            "src/win32_init.c",
            "src/win32_joystick.c",
            "src/win32_monitor.c",
            "src/win32_time.c",
            "src/win32_window.c",
            "src/win32_thread.c",
            "src/wgl_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c"
        }


    filter "system:linux"
		pic "On"
		systemversion "latest"

		defines
		{
			"_GLFW_X11"
		}

        files 
        {
            "src/egl_context.h",
            "src/egl_context.c",
            "src/glx_context.h",
            "src/glx_context.c",
            "src/linux_joystick.h",
            "src/linux_joystick.c",
            "src/posix_time.h",
            "src/posix_time.c",
            "src/x11_init.c",
            "src/x11_platform.h",
            "src/x11_monitor.c",
            "src/x11_window.c",
            "src/xkb_unicode.h",
            "src/xkb_unicode.c",
            "src/posix_thread.h",
            "src/posix_thread.c",
            "src/osmesa_context.c",
            "src/osmesa_context.h"
        }

	filter "system:macosx"
		defines 
		{
			"_GLFW_COCOA",
			"_GLFW_USE_RETINA"
		}

        files 
        {
            "src/cocoa_platform.h",
            "src/cocoa_joystick.h",
            "src/nsgl_context.h",
            "src/cocoa_init.m",
            "src/cocoa_joystick.m",
            "src/cocoa_monitor.m",
            "src/cocoa_window.m",
            "src/cocoa_time.c",
            "src/nsgl_context.m",
            "src/posix_thread.h",
            "src/posix_thread.c",
            "src/egl_context.h",
            "src/egl_context.c",
            "src/osmesa_context.h",
            "src/osmesa_context.c"
        }

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		runtime "Release"
		optimize "On"