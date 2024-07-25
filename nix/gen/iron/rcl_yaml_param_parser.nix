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
        rev = "13c04e8007ca5c5360d2ac6c5fde839284b35a50";
        hash = "sha256-v1NgH6h4dFa+7VpkV0xwaN1HH9Wb36fHAx5fe17Gd/w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_yaml_param_parser";
  version = "6.0.5-1";
  src = sources.rcl_yaml_param_parser;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libyaml libyaml_vendor rcutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
