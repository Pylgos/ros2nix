{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_testing,
  launch_testing_ament_cmake,
  mimick_vendor,
  osrf_testing_tools_cpp,
  rcl_interfaces,
  rcl_logging_interface,
  rcl_logging_noop,
  rcl_logging_spdlog,
  rcl_yaml_param_parser,
  rcpputils,
  rcutils,
  rmw,
  rmw_implementation,
  rmw_implementation_cmake,
  rosidl_runtime_c,
  substituteSource,
  test_msgs,
  tracetools,
}:
let
  sources = rec {
    rcl = substituteSource {
      src = fetchgit {
        name = "rcl-source";
        url = "https://github.com/ros2-gbp/rcl-release.git";
        rev = "72cb6ebf60bda358f7a960a80a00a1599ded1e9b";
        hash = "sha256-Mw2iEL+cNG8L9qKRhxXLy14IqDy1pL0O1dn+++SsC4Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl";
  version = "5.3.8-1";
  src = sources.rcl;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcl_interfaces rcl_logging_interface rcl_logging_noop rcl_logging_spdlog rcl_yaml_param_parser rcutils rmw_implementation rosidl_runtime_c tracetools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
