{
  ament_cmake_gen_version_h,
  ament_cmake_gmock,
  ament_cmake_google_benchmark,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  libstatistics_collector,
  mimick_vendor,
  performance_test_fixture,
  python3,
  rcl,
  rcl_interfaces,
  rcl_logging_interface,
  rcl_yaml_param_parser,
  rcpputils,
  rcutils,
  rmw,
  rmw_implementation_cmake,
  rosgraph_msgs,
  rosidl_default_generators,
  rosidl_dynamic_typesupport,
  rosidl_runtime_c,
  rosidl_runtime_cpp,
  rosidl_typesupport_c,
  rosidl_typesupport_cpp,
  statistics_msgs,
  substituteSource,
  test_msgs,
  tracetools,
}:
let
  sources = rec {
    rclcpp = substituteSource {
      src = fetchgit {
        name = "rclcpp-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "40e854b39408eecda8f9f96b780518da2bd415bc";
        hash = "sha256-Rvz45CUHQZbVPgbTCFJrbL/LYFW0v+pJmX/KKfYQobk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclcpp";
  version = "28.3.1-1";
  src = sources.rclcpp;
  nativeBuildInputs = [ ament_cmake_gen_version_h ament_cmake_ros python3 ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp builtin_interfaces libstatistics_collector rcl rcl_interfaces rcl_logging_interface rcl_yaml_param_parser rcpputils rcutils rmw rosgraph_msgs rosidl_dynamic_typesupport rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_c rosidl_typesupport_cpp statistics_msgs tracetools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}