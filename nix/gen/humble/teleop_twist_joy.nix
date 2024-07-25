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
        rev = "4fa7f22414950ddd64a9ea33b8801ef17ab59d02";
        hash = "sha256-ziTT1uPdxsJPd8QJZ4B1tilHSer2LPag9OchrjExBh8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "teleop_twist_joy";
  version = "2.4.6-1";
  src = sources.teleop_twist_joy;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs joy rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
