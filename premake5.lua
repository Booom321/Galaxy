Include "Scripts/Premake/PremakeGlobals"

WorkspaceSettings.RootDirectory = os.getcwd()

__ROOT_DIRECTORY__ = "\""..WorkspaceSettings.RootDirectory.."\""

print("Root directory: "..WorkspaceSettings.RootDirectory)

workspace(WorkspaceSettings.Name)
    architecture "x64"
   	configurations { "Debug", "Release" }
    flags { "MultiProcessorCompile" }
    ---------------------------------------------------------------------------------
    group "ThirdParty"
        include "Engine/ThirdParty/glfw/premake5"
        include "Engine/ThirdParty/glslang/premake5"
        include "Engine/ThirdParty/imgui/premake5"
        include "Engine/ThirdParty/SPIRV-Cross/premake5"
    group ""
    ---------------------------------------------------------------------------------