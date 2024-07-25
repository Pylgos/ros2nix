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
  rosidl_runtime_cpp,
  substituteSource,
}:
let
  sources = rec {
    rmw_dds_common = substituteSource {
      src = fetchgit {
        name = "rmw_dds_common-source";
        url = "https://github.com/ros2-gbp/rmw_dds_common-release.git";
        rev = "eb132be25c7d578317738dff094d37f10587e676";
        hash = "sha256-Q4i60TiYXYrxyZG2wPLEOe4KNP6iZSgL2Ygnv54zwTM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_dds_common";
  version = "1.6.0-2";
  src = sources.rmw_dds_common;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [ rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcpputils rcutils rosidl_default_runtime rosidl_runtime_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
