{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_action,
  rcutils,
  ros_ign_interfaces,
  sensor_msgs,
  std_msgs,
  substituteSource,
  turtlebot4_msgs,
}:
let
  sources = rec {
    turtlebot4_ignition_toolbox = substituteSource {
      src = fetchgit {
        name = "turtlebot4_ignition_toolbox-source";
        url = "https://github.com/ros2-gbp/turtlebot4_simulator-release.git";
        rev = "2a71aa1ba5cb7b7d0eb35005eef787924837a459";
        hash = "sha256-x2oxcDYThD3CK/+yAP+dmz1E2plbUh7hbKwQYJFvH8E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_ignition_toolbox";
  version = "1.0.2-1";
  src = sources.turtlebot4_ignition_toolbox;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_action rcutils ros_ign_interfaces sensor_msgs std_msgs turtlebot4_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
