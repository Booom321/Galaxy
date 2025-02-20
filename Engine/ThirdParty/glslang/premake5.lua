project "glslang"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "Off"

    targetdir ("%{wks.location}/BinOutput/" .. WorkspaceSettings.OutputDir .. "/%{prj.name}")
	objdir ("%{wks.location}/BinIntermediate/" .. WorkspaceSettings.OutputDir .. "/%{prj.name}")

    includedirs 
    {
        "%{prj.location}"
    }

    files 
    {
         -- glslang/
        "glslang/CInterface/*.cpp",
        "glslang/GenericCodeGen/*.cpp",
        "glslang/Include/*.h",
        "glslang/MachineIndependent/**.h",
        "glslang/MachineIndependent/**.cpp",
        "glslang/Public/*.h",
        "glslang/ResourceLimits/*.cpp",
        "glslang/stub.cpp",
        "glslang/build_info.h",
        -- SPIRV/
        "SPIRV/**.h",
        "SPIRV/**.cpp"
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