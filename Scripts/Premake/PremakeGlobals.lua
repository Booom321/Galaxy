function DirectoryExists(DirPath)
    local Ok, Error, Code = os.rename(DirPath, DirPath)
    if not Ok then
        if Code == 13 then 
            return true
        end
        return false
    end
    return true
end

WorkspaceSettings = {}
WorkspaceSettings.Name = "Galaxy"
WorkspaceSettings.OutputDir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
---------------------------------------------------------------------------------
VULKAN_SDK = os.getenv("VULKAN_SDK")

EngineFeatures = {}
EngineFeatures.SupportVulkan = false

if (VULKAN_SDK == nil or VULKAN_SDK == '') then
    print("Environment variable not found: VULKAN_SDK")
else
    print("VULKAN_SDK environment varible is: ".. VULKAN_SDK)
    if (DirectoryExists(VULKAN_SDK)) then
        EngineFeatures.SupportVulkan = true
    else
        print(VULKAN_SDK.." doesn't exist.")
    end
end
---------------------------------------------------------------------------------
SourceLocation = "%{wks.location}/Engine/Source"
ThirdPartyLocation = "%{wks.location}/Engine/ThirdParty"

IncludeDirs = {}
IncludeDirs["glfw"] = "%{ThirdPartyLocation}/glfw/include"
IncludeDirs["glslang"] = "%{ThirdPartyLocation}/glslang"
IncludeDirs["imgui"] = "%{ThirdPartyLocation}/imgui"
IncludeDirs["SPIRVCross"] = "%{ThirdPartyLocation}/SPIRV-Cross"
IncludeDirs["xxHash"] = "%{ThirdPartyLocation}/xxHash"

if (EngineFeatures.SupportVulkan) then
    IncludeDirs["Vulkan"] = "%{VULKAN_SDK}/Include"
end
---------------------------------------------------------------------------------
LibDirs = {}

if (EngineFeatures.SupportVulkan) then
    LibDirs["Vulkan"] = VULKAN_SDK.."/Lib"
end