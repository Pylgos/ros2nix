{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot_create_msgs,
  libgpiod,
  rclcpp,
  rclcpp_action,
  rcutils,
  sensor_msgs,
  std_msgs,
  substituteSource,
  turtlebot4_msgs,
  turtlebot4_node,
}:
let
  sources = rec {
    turtlebot4_base = substituteSource {
      src = fetchgit {
        name = "turtlebot4_base-source";
        url = "https://github.com/ros2-gbp/turtlebot4_robot-release.git";
        rev = "07ee2882210d45d19ec5685400a5c388cf20ca21";
        hash = "sha256-qt4bIeJc6lLlD2uybFeJtqH+RI5LfQ6kDfyx3o+uIpw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_base";
  version = "1.0.3-1";
  src = sources.turtlebot4_base;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ irobot_create_msgs libgpiod rclcpp rclcpp_action rcutils sensor_msgs std_msgs turtlebot4_msgs turtlebot4_node ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
