project "yaml-cpp"
	kind "StaticLib"
	language "C++"
	
	--location "%{prj.name}"
	targetdir ("%{wks.location}/" .. TargetDirBase .. OutputDir .. "%{prj.name}")
    objdir ("%{wks.location}/" .. ObjDirBase .. OutputDir .. "%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.cpp",
		
		"include/**.h"
	}

	includedirs
	{
		"include"
	}
	
	defines
	{
		"YAML_CPP_STATIC_DEFINE",
	}

	filter "system:windows"
		systemversion "latest"

		staticruntime "On"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		staticruntime "On"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
