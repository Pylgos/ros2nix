{
  action_msgs,
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  pybind11_vendor,
  python3Packages,
  python_cmake_module,
  rcl,
  rcl_action,
  rcl_interfaces,
  rcl_lifecycle,
  rcl_logging_interface,
  rcl_yaml_param_parser,
  rcpputils,
  rcutils,
  rmw,
  rmw_implementation,
  rmw_implementation_cmake,
  rosgraph_msgs,
  rosidl_generator_py,
  rosidl_runtime_c,
  rpyutils,
  substituteSource,
  test_msgs,
  unique_identifier_msgs,
}:
let
  sources = rec {
    rclpy = substituteSource {
      src = fetchgit {
        name = "rclpy-source";
        url = "https://github.com/ros2-gbp/rclpy-release.git";
        rev = "86e79c2365a965cfc80eb32d41016cf69bccc41b";
        hash = "sha256-YqQotpqJPy4HdDmF87RHAAd1lDzrQpgj6TJE038DF8I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclpy";
  version = "4.1.5-1";
  src = sources.rclpy;
  nativeBuildInputs = [ ament_cmake python_cmake_module ];
  propagatedNativeBuildInputs = [ ament_index_python rmw rmw_implementation_cmake rpyutils ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs builtin_interfaces lifecycle_msgs pybind11_vendor rcl rcl_action rcl_interfaces rcl_lifecycle rcl_logging_interface rcl_yaml_param_parser rcpputils rcutils rmw_implementation rosgraph_msgs rosidl_runtime_c unique_identifier_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
