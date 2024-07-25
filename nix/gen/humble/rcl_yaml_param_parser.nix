{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libyaml,
  libyaml_vendor,
  mimick_vendor,
  osrf_testing_tools_cpp,
  performance_test_fixture,
  rcpputils,
  rcutils,
  rmw,
  substituteSource,
}:
let
  sources = rec {
    rcl_yaml_param_parser = substituteSource {
      src = fetchgit {
        name = "rcl_yaml_param_parser-source";
        url = "https://github.com/ros2-gbp/rcl-release.git";
        rev = "ed94823a8426e3bc5bceea3dbbf4fe49883f1019";
        hash = "sha256-vw8Yv8qaLNeJi24fi9BFu04a0o3+P7C7okyQv9QG8HU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_yaml_param_parser";
  version = "5.3.8-1";
  src = sources.rcl_yaml_param_parser;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libyaml libyaml_vendor rcutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
