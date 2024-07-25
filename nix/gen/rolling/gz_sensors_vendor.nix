{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_cmake_vendor,
  gz_common_vendor,
  gz_math_vendor,
  gz_msgs_vendor,
  gz_rendering_vendor,
  gz_tools_vendor,
  gz_transport_vendor,
  sdformat_vendor,
  substituteSource,
  xorg,
}:
let
  sources = rec {
    gz_sensors_vendor = substituteSource {
      src = fetchgit {
        name = "gz_sensors_vendor-source";
        url = "https://github.com/ros2-gbp/gz_sensors_vendor-release.git";
        rev = "f7a36a873bf8f6939057fcc4ce025a74cb927c5f";
        hash = "sha256-y0gXw7fCAVIcq3wUIIJktDnjcFdsUHvzYZwZoyiOrWg=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_sensors_vendor-vendor_source-gz-sensors-0}";
        }
      ];
    };
    gz_sensors_vendor-vendor_source-gz-sensors-0 = substituteSource {
      src = fetchgit {
        name = "gz_sensors_vendor-vendor_source-gz-sensors-0-source";
        url = "https://github.com/gazebosim/gz-sensors.git";
        rev = "3275bb680a758f563b7fae5b3357714b71bf5cd1";
        hash = "sha256-ABgc5ATJZLNpmSGga2oXp0X/LdeD+FVjyUIkqPmotoo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_sensors_vendor";
  version = "0.1.1-1";
  src = sources.gz_sensors_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gz_cmake_vendor gz_common_vendor gz_math_vendor gz_msgs_vendor gz_rendering_vendor gz_tools_vendor gz_transport_vendor sdformat_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
