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
        rev = "795f3ba38f4939861c9c451ca32c75478e8c8407";
        hash = "sha256-/C6kPAlXt/d41U0oKCvys/M+AGH7qWqpkiK5hjgpbp8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gazebo_ros2_control";
  version = "0.4.9-1";
  src = sources.gazebo_ros2_control;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles control_toolbox controller_manager gazebo_dev gazebo_ros hardware_interface pluginlib rclcpp std_msgs yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
