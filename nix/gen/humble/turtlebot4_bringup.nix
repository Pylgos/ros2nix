{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  create3_republisher,
  depthai_bridge,
  depthai_examples,
  depthai_ros_driver,
  depthai_ros_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  joy_linux,
  nav2_common,
  rplidar_ros,
  substituteSource,
  teleop_twist_joy,
  tf2_ros,
  turtlebot4_description,
  turtlebot4_diagnostics,
  turtlebot4_node,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot4_bringup = substituteSource {
      src = fetchgit {
        name = "turtlebot4_bringup-source";
        url = "https://github.com/ros2-gbp/turtlebot4_robot-release.git";
        rev = "04a802835be8966efd9213f49d9dfe445abb043f";
        hash = "sha256-a2tAJO35Negd9/Gg3op7DyVT1goIlRMG3J+ACKdi4bI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_bringup";
  version = "1.0.3-1";
  src = sources.turtlebot4_bringup;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ create3_republisher depthai_bridge depthai_examples depthai_ros_driver depthai_ros_msgs joy_linux nav2_common rplidar_ros teleop_twist_joy tf2_ros turtlebot4_description turtlebot4_diagnostics turtlebot4_node ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
