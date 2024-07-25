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
  rcutils,
  rmw,
  rmw_implementation,
  rmw_implementation_cmake,
  rosidl_runtime_c,
  rosidl_runtime_cpp,
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
        rev = "d572d850c7ecb1998ed91034bf92c99967d584cd";
        hash = "sha256-RMe+Hx8ckiui1U7hhfDB7c8gQRDeJv7CFhIfodMk9Ms=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl";
  version = "9.4.0-1";
  src = sources.rcl;
  nativeBuildInputs = [ ament_cmake_gen_version_h ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libyaml libyaml_vendor rcl_interfaces rcl_logging_interface rcl_logging_noop rcl_logging_spdlog rcl_yaml_param_parser rcutils rmw rmw_implementation rosidl_runtime_c service_msgs tracetools type_description_interfaces ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
