{
  ament_cmake,
  ament_cmake_cpplint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  rclcpp,
  rclcpp_action,
  robot_controllers_msgs,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    robot_controllers_interface = substituteSource {
      src = fetchgit {
        name = "robot_controllers_interface-source";
        url = "https://github.com/fetchrobotics-gbp/robot_controllers-ros2-release.git";
        rev = "cc21bd5f5f6dc30ab6976b287807fd447a3b9a61";
        hash = "sha256-RnV2xz0xdp3ejwJr9rHTKXhBc3FzfCEHIJwGwqrNZ7o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "robot_controllers_interface";
  version = "0.9.3-1";
  src = sources.robot_controllers_interface;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib rclcpp rclcpp_action robot_controllers_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
