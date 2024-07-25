{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  irobot_create_msgs,
  nav_msgs,
  rclcpp,
  rclcpp_action,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    create3_republisher = substituteSource {
      src = fetchgit {
        name = "create3_republisher-source";
        url = "https://github.com/ros2-gbp/create3_examples-release.git";
        rev = "477a9ad96f296d6f71a361418851163ceb0c94ee";
        hash = "sha256-ApcELf6T+8U1nErvCdzq4DNtHI3QTKhMIYU1xVsKcnY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "create3_republisher";
  version = "0.0.5-1";
  src = sources.create3_republisher;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs irobot_create_msgs nav_msgs rclcpp rclcpp_action sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
