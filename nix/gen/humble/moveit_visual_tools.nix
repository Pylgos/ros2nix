{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  graph_msgs,
  moveit_common,
  moveit_core,
  moveit_ros_planning,
  rclcpp,
  rviz_visual_tools,
  std_msgs,
  substituteSource,
  tf2_eigen,
  tf2_ros,
  trajectory_msgs,
  visualization_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_visual_tools = substituteSource {
      src = fetchgit {
        name = "moveit_visual_tools-source";
        url = "https://github.com/ros2-gbp/moveit_visual_tools-release.git";
        rev = "adde5e2d385ca8a32468b1da8189cf72a842c611";
        hash = "sha256-OsgJs0kV7m3GzRlDL1x8i5hG03piwA+9f+Mbpx+dOmw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_visual_tools";
  version = "4.1.0-1";
  src = sources.moveit_visual_tools;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs graph_msgs moveit_common moveit_core moveit_ros_planning rclcpp rviz_visual_tools std_msgs tf2_eigen tf2_ros trajectory_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
