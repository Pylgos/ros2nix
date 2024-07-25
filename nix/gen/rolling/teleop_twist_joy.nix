{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  joy,
  launch_ros,
  launch_testing_ament_cmake,
  launch_testing_ros,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    teleop_twist_joy = substituteSource {
      src = fetchgit {
        name = "teleop_twist_joy-source";
        url = "https://github.com/ros2-gbp/teleop_twist_joy-release.git";
        rev = "3f10c9a70f5e94e38b6880d630efcd330bb71a1b";
        hash = "sha256-N3JJWiFU+t6a2ZlcYTVD5RUqa6rci24N5eA0uZX2gjs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "teleop_twist_joy";
  version = "2.6.1-1";
  src = sources.teleop_twist_joy;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs joy rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}