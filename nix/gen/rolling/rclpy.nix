{
  action_msgs,
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildPackages,
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
        rev = "299b4577b1558734fb8d18ad072992094e412abd";
        hash = "sha256-LhjKoLN1lz93RQx//sYvjR/G89IaMGwsYDhgdQ0nxKk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclpy";
  version = "7.4.0-1";
  src = sources.rclpy;
  nativeBuildInputs = [ ament_cmake python_cmake_module ];
  propagatedNativeBuildInputs = [ ament_index_python buildPackages.python3Packages.pyyaml rmw_implementation_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs builtin_interfaces lifecycle_msgs pybind11_vendor rcl rcl_action rcl_interfaces rcl_lifecycle rcl_logging_interface rcl_yaml_param_parser rcpputils rcutils rmw rmw_implementation rosgraph_msgs rosidl_runtime_c rpyutils unique_identifier_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
