{
  ament_cmake_gen_version_h,
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
        rev = "c5e02aa4646bd37b57ed8764cf98334fdf8dabdc";
        hash = "sha256-6UYYXk4ojtJfsa6tHjH/mlEaOvO1Da3G8+HQL+F+YYs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_yaml_param_parser";
  version = "9.4.0-1";
  src = sources.rcl_yaml_param_parser;
  nativeBuildInputs = [ ament_cmake_gen_version_h ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libyaml libyaml_vendor rcutils rmw ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
