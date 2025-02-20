project "imgui"
    kind "StaticLib"
    language "C++"
    staticruntime "Off"

    targetdir ("%{wks.location}/BinOutput/" .. WorkspaceSettings.OutputDir .. "/%{prj.name}")
	objdir ("%{wks.location}/BinIntermediate/" .. WorkspaceSettings.OutputDir .. "/%{prj.name}")

    includedirs
    {
        "%{prj.location}"
    }

    files
    {
        "imgui.h",
        "imguiconfig.h",
        "imgui_internal.h",
        "imstb_rectpack.h",
        "imstb_textedit.h",
        "imstb_truetype.h",

        "imgui.cpp",
        "imgui_demo.cpp",
        "imgui_draw.cpp",
        "imgui_tables.cpp",
        "imgui_widgets.cpp",
    }

    filter "system:windows"
        systemversion "latest"

    filter "system:linux"
		pic "On"
		systemversion "latest"

    filter "system:macosx"
        systemversion "latest"

	filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"
