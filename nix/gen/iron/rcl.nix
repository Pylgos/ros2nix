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
  libyaml,
  libyaml_vendor,
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
  service_msgs,
  substituteSource,
  test_msgs,
  tracetools,
  type_description_interfaces,
}:
let
  sources = rec {
    rcl = substituteSource {
      src = fetchgit {
        name = "rcl-source";
        url = "https://github.com/ros2-gbp/rcl-release.git";
        rev = "f5c47b60588f915bd44b05c4862051ba268bd8e6";
        hash = "sha256-VTbt6Gjz5TX5pBksCBA1N3+rAlrfUsbiL4I2l9o2344=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl";
  version = "6.0.5-1";
  src = sources.rcl;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libyaml libyaml_vendor rcl_interfaces rcl_logging_interface rcl_logging_noop rcl_logging_spdlog rcl_yaml_param_parser rcutils rmw_implementation rosidl_runtime_c service_msgs tracetools type_description_interfaces ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
