{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  control_toolbox,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_dev,
  gazebo_ros,
  hardware_interface,
  pluginlib,
  rclcpp,
  std_msgs,
  substituteSource,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    gazebo_ros2_control = substituteSource {
      src = fetchgit {
        name = "gazebo_ros2_control-source";
        url = "https://github.com/ros2-gbp/gazebo_ros2_control-release.git";
        rev = "dbf660e7d4cf087f8946a3494d174adfabf332ac";
        hash = "sha256-dKtKfc5bPVrJYHUbH2eBR8JRirlKqlBPxZcxrdXPn+A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gazebo_ros2_control";
  version = "0.6.7-1";
  src = sources.gazebo_ros2_control;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles control_toolbox controller_manager gazebo_dev gazebo_ros hardware_interface pluginlib rclcpp std_msgs yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
