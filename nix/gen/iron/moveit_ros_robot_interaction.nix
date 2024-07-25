{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  interactive_markers,
  moveit_common,
  moveit_core,
  moveit_ros_planning,
  rclcpp,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_robot_interaction = substituteSource {
      src = fetchgit {
        name = "moveit_ros_robot_interaction-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "c6ed8c84d045f69770765f3cc61ee176430de4c5";
        hash = "sha256-b54yWhMi69xy4aGvtfLQLNzxV8wMsZasXiCL3Z8ZFoI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_robot_interaction";
  version = "2.8.0-1";
  src = sources.moveit_ros_robot_interaction;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ interactive_markers moveit_common moveit_core moveit_ros_planning rclcpp tf2 tf2_eigen tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
