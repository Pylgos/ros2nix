{
  ament_cmake,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  libyamlcpp,
  pluginlib,
  python_cmake_module,
  rclcpp,
  rclpy,
  ros_environment,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2_geometry_msgs,
  tf2_ros,
  tinyxml2_vendor,
  vision_msgs,
  webots_ros2_importer,
  webots_ros2_msgs,
}:
let
  sources = rec {
    webots_ros2_driver = substituteSource {
      src = fetchgit {
        name = "webots_ros2_driver-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "2e39b01b752b7cea44e2c74884e8911d9db2d816";
        hash = "sha256-jqW+Ul7u0gR5/P17vrbPrr8sdA1JMNrwXLDrQ2A/qCU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "webots_ros2_driver";
  version = "2023.1.2-1";
  src = sources.webots_ros2_driver;
  nativeBuildInputs = [ ament_cmake ament_cmake_python python_cmake_module ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs libyamlcpp pluginlib rclcpp rclpy sensor_msgs std_msgs tf2_geometry_msgs tf2_ros tinyxml2_vendor vision_msgs webots_ros2_importer webots_ros2_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}