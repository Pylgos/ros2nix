{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  builtin_interfaces,
  diagnostic_msgs,
  diagnostic_updater,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic_msgs,
  geographiclib,
  geometry_msgs,
  launch_ros,
  launch_testing_ament_cmake,
  message_filters,
  nav_msgs,
  python3Packages,
  rclcpp,
  rmw_implementation,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  tf2_ros,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    robot_localization = substituteSource {
      src = fetchgit {
        name = "robot_localization-source";
        url = "https://github.com/ros2-gbp/robot_localization-release.git";
        rev = "b8edfccec623e605ee5615956804e63bbb59c0b5";
        hash = "sha256-3bMlmjhi1vqqAubEmcgo2PiKdLsySBGT6WreedvtZJ8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "robot_localization";
  version = "3.5.3-1";
  src = sources.robot_localization;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ builtin_interfaces ];
  propagatedBuildInputs = [ angles diagnostic_msgs diagnostic_updater eigen geographic_msgs geographiclib geometry_msgs message_filters nav_msgs python3Packages.boost rclcpp rmw_implementation rosidl_default_runtime sensor_msgs std_msgs std_srvs tf2 tf2_eigen tf2_geometry_msgs tf2_ros yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
