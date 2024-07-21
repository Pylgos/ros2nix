{
  ament_cmake,
  ament_cmake_gmock,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  osrf_testing_tools_cpp,
  performance_test_fixture,
  rcpputils,
  rcutils,
  rmw,
  rosidl_default_generators,
  rosidl_default_runtime,
  rosidl_runtime_c,
  rosidl_runtime_cpp,
  substituteSource,
}:
let
  sources = rec {
    rmw_dds_common = substituteSource {
      src = fetchgit {
        name = "rmw_dds_common-source";
        url = "https://github.com/ros2-gbp/rmw_dds_common-release.git";
        rev = "8d736a951300b342b1d672e7923ad9c50f04f726";
        hash = "sha256-wc3HbuwzxNPLut+Q0TPcQI5xPIZd1euV/y2t3Acat8k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_dds_common";
  version = "3.1.0-2";
  src = sources.rmw_dds_common;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake rmw rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcpputils rcutils rosidl_default_runtime rosidl_runtime_c rosidl_runtime_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
