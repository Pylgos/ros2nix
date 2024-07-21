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
}:
let
  sources = rec {
    moveit_visual_tools = substituteSource {
      src = fetchgit {
        name = "moveit_visual_tools-source";
        url = "https://github.com/ros2-gbp/moveit_visual_tools-release.git";
        rev = "6d23bf6d6d79f31f79218e55b81b9e9c53ce90b7";
        hash = "sha256-OsgJs0kV7m3GzRlDL1x8i5hG03piwA+9f+Mbpx+dOmw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_visual_tools";
  version = "4.1.0-4";
  src = sources.moveit_visual_tools;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs graph_msgs moveit_common moveit_core moveit_ros_planning rclcpp rviz_visual_tools std_msgs tf2_eigen tf2_ros trajectory_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}