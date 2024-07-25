{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  irobot_create_common_bringup,
  irobot_create_description,
  irobot_create_ignition_bringup,
  irobot_create_ignition_toolbox,
  irobot_create_msgs,
  irobot_create_nodes,
  irobot_create_toolbox,
  ros_ign_bridge,
  ros_ign_gazebo,
  ros_ign_interfaces,
  std_msgs,
  substituteSource,
  turtlebot4_description,
  turtlebot4_ignition_gui_plugins,
  turtlebot4_ignition_toolbox,
  turtlebot4_msgs,
  turtlebot4_navigation,
  turtlebot4_node,
  turtlebot4_viz,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot4_ignition_bringup = substituteSource {
      src = fetchgit {
        name = "turtlebot4_ignition_bringup-source";
        url = "https://github.com/ros2-gbp/turtlebot4_simulator-release.git";
        rev = "87f3ff17339f7012013bf65dc3f6f3eaabfe06b7";
        hash = "sha256-8qQtwjx+xmwSDLqhXr7dSsjgz4Er9fHJnx3Q1T2k2A4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_ignition_bringup";
  version = "1.0.2-1";
  src = sources.turtlebot4_ignition_bringup;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs irobot_create_common_bringup irobot_create_description irobot_create_ignition_bringup irobot_create_ignition_toolbox irobot_create_msgs irobot_create_nodes irobot_create_toolbox ros_ign_bridge ros_ign_gazebo ros_ign_interfaces std_msgs turtlebot4_description turtlebot4_ignition_gui_plugins turtlebot4_ignition_toolbox turtlebot4_msgs turtlebot4_navigation turtlebot4_node turtlebot4_viz ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
