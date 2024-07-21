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
        rev = "1a8356ff2ee1bc5a03aa2c3ab5bbdc6f85786a20";
        hash = "sha256-xwkPZBm3cKtKEe7pNLUfiL6oKZgjX5cLiIvMsB55dUs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "teleop_twist_joy";
  version = "2.6.0-3";
  src = sources.teleop_twist_joy;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs joy rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
