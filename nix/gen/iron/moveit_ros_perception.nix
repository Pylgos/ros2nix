{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  freeglut,
  glew,
  image_transport,
  libGL,
  libGLU,
  llvmPackages,
  message_filters,
  moveit_common,
  moveit_core,
  moveit_msgs,
  moveit_ros_occupancy_map_monitor,
  moveit_ros_planning,
  object_recognition_msgs,
  pluginlib,
  rclcpp,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  tf2_ros,
  urdf,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_perception = substituteSource {
      src = fetchgit {
        name = "moveit_ros_perception-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "ebb389d0190e0ae68288f7f89338a1c1212bec01";
        hash = "sha256-krSEFZPFENFUm9yC9ZrEbyFMWxZiu6TPVvuFN/WuHU8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_perception";
  version = "2.8.0-1";
  src = sources.moveit_ros_perception;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge eigen freeglut glew image_transport libGL libGLU llvmPackages.openmp message_filters moveit_common moveit_core moveit_msgs moveit_ros_occupancy_map_monitor moveit_ros_planning object_recognition_msgs pluginlib rclcpp sensor_msgs tf2 tf2_eigen tf2_geometry_msgs tf2_ros urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
