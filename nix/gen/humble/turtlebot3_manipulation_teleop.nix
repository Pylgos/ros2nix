{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  control_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rclcpp,
  sensor_msgs,
  substituteSource,
  turtlebot3_manipulation_bringup,
  turtlebot3_manipulation_description,
  turtlebot3_manipulation_moveit_config,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot3_manipulation_teleop = substituteSource {
      src = fetchgit {
        name = "turtlebot3_manipulation_teleop-source";
        url = "https://github.com/ros2-gbp/turtlebot3_manipulation-release.git";
        rev = "f45fbbf3bd5ca2c067f66a37361bb090231546e1";
        hash = "sha256-DF0sViAcAWRpmhd2XL3/1zpRe7aaLBoz51PLAByGEzM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3_manipulation_teleop";
  version = "2.1.1-1";
  src = sources.turtlebot3_manipulation_teleop;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_msgs geometry_msgs nav_msgs rclcpp sensor_msgs turtlebot3_manipulation_bringup turtlebot3_manipulation_description turtlebot3_manipulation_moveit_config ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
