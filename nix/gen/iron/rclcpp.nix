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
  rcl_yaml_param_parser,
  rcpputils,
  rcutils,
  rmw,
  rmw_implementation_cmake,
  rosgraph_msgs,
  rosidl_default_generators,
  rosidl_dynamic_typesupport,
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
        rev = "58cfd5fab3f5c51754cc19ac8d3af7b278afb001";
        hash = "sha256-gcF9ImvPjc2yryWlHc4IEoIZ9uooIUAaZxrvrb2HY3o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclcpp";
  version = "21.0.6-1";
  src = sources.rclcpp;
  nativeBuildInputs = [ ament_cmake_gen_version_h ament_cmake_ros python3 ];
  propagatedNativeBuildInputs = [ ament_index_cpp rmw rosidl_dynamic_typesupport ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces libstatistics_collector rcl rcl_interfaces rcl_yaml_param_parser rcpputils rcutils rosgraph_msgs rosidl_runtime_cpp rosidl_typesupport_c rosidl_typesupport_cpp statistics_msgs tracetools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
