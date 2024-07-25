{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  class_loader,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometric_shapes,
  interactive_markers,
  moveit_common,
  moveit_ros_planning_interface,
  moveit_ros_robot_interaction,
  moveit_ros_warehouse,
  object_recognition_msgs,
  pkg-config,
  pluginlib,
  qt5,
  rclcpp,
  rclpy,
  rviz2,
  substituteSource,
  tf2_eigen,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_visualization = substituteSource {
      src = fetchgit {
        name = "moveit_ros_visualization-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "eeb9bc8f9639d314e4e5850d23a64450d1a3676a";
        hash = "sha256-9DZ+eHZEt0Tsu5RJ++RQMEpnutYk0CW9yqgXOcgaP50=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_visualization";
  version = "2.8.0-1";
  src = sources.moveit_ros_visualization;
  nativeBuildInputs = [ ament_cmake pkg-config wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ class_loader eigen geometric_shapes interactive_markers moveit_common moveit_ros_planning_interface moveit_ros_robot_interaction moveit_ros_warehouse object_recognition_msgs pluginlib qt5.qtbase rclcpp rclpy rviz2 tf2_eigen ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
