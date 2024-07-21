{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  buildRosPackage,
  curl,
  fetchgit,
  fetchurl,
  fetchzip,
  gflags,
  gz_cmake_vendor,
  gz_common_vendor,
  gz_math_vendor,
  gz_msgs_vendor,
  gz_tools_vendor,
  gz_utils_vendor,
  jsoncpp,
  libyaml,
  substituteSource,
  tinyxml-2,
}:
let
  sources = rec {
    gz_fuel_tools_vendor = substituteSource {
      src = fetchgit {
        name = "gz_fuel_tools_vendor-source";
        url = "https://github.com/ros2-gbp/gz_fuel_tools_vendor-release.git";
        rev = "40c733ff8578ea9beecb0a461c5d7919c675a599";
        hash = "sha256-gjBPA5xiLQJS07+JRJQfPo03SE0lzKNCX+KcBcyGmyY=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_fuel_tools_vendor-vendor_source-gz-fuel-tools-0}";
        }
      ];
    };
    gz_fuel_tools_vendor-vendor_source-gz-fuel-tools-0 = substituteSource {
      src = fetchgit {
        name = "gz_fuel_tools_vendor-vendor_source-gz-fuel-tools-0-source";
        url = "https://github.com/gazebosim/gz-fuel-tools.git";
        rev = "c7cd3dd6580db102bbaabfcf4835ae68be9ff66e";
        hash = "sha256-36WwY3YUeCAUDBY8N+Mbw7FuNRn1fQUifLZvoGhXtcc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_fuel_tools_vendor";
  version = "0.0.3-1";
  src = sources.gz_fuel_tools_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ curl gflags gz_cmake_vendor gz_common_vendor gz_math_vendor gz_msgs_vendor gz_tools_vendor gz_utils_vendor jsoncpp libyaml tinyxml-2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
