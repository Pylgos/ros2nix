{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot_create_msgs,
  rclcpp,
  rclcpp_action,
  rcutils,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  turtlebot4_msgs,
}:
let
  sources = rec {
    turtlebot4_node = substituteSource {
      src = fetchgit {
        name = "turtlebot4_node-source";
        url = "https://github.com/ros2-gbp/turtlebot4-release.git";
        rev = "470c0f58af7c422531c3034502d615dfc13a8834";
        hash = "sha256-NnKM9dm8lkzkuR4iWKL3pVwphDaN59C/HmnpZ3PK0GQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_node";
  version = "1.0.5-1";
  src = sources.turtlebot4_node;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ irobot_create_msgs rclcpp rclcpp_action rcutils sensor_msgs std_msgs std_srvs turtlebot4_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
