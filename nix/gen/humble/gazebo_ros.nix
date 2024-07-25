{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_dev,
  gazebo_msgs,
  geometry_msgs,
  launch_ros,
  launch_testing_ament_cmake,
  python3Packages,
  rcl,
  rclcpp,
  rclpy,
  rmw,
  ros2run,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tinyxml_vendor,
}:
let
  sources = rec {
    gazebo_ros = substituteSource {
      src = fetchgit {
        name = "gazebo_ros-source";
        url = "https://github.com/ros2-gbp/gazebo_ros_pkgs-release.git";
        rev = "dbc0fcb5202c48c98c7dd25043757e168aa19c6b";
        hash = "sha256-UNmsqu6Ze0LnEV7B9vv751AnDxri5MEcMDx7AAiBwOE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gazebo_ros";
  version = "3.7.0-1";
  src = sources.gazebo_ros;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces gazebo_dev gazebo_msgs geometry_msgs launch_ros python3Packages.lxml rcl rclcpp rclpy sensor_msgs std_srvs tinyxml_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
