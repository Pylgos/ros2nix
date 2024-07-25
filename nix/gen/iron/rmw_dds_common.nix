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
        rev = "0167f4e89d4241703205d283213c35d6d4418122";
        hash = "sha256-2cbOi4SFRb13dNGkx/RTLCgrJVhJd2UUWLTxKIu5/RM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_dds_common";
  version = "2.0.1-2";
  src = sources.rmw_dds_common;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [ rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcpputils rcutils rosidl_default_runtime rosidl_runtime_c rosidl_runtime_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
