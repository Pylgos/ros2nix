{
  ament_cmake,
  ament_cmake_gmock,
  backward_ros,
  buildRosPackage,
  control_msgs,
  control_toolbox,
  controller_interface,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  filters,
  generate_parameter_library,
  geometry_msgs,
  hardware_interface,
  hardware_interface_testing,
  joint_trajectory_controller,
  kinematics_interface,
  kinematics_interface_kdl,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  realtime_tools,
  ros2_control_test_assets,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  tf2_kdl,
  tf2_ros,
  trajectory_msgs,
}:
let
  sources = rec {
    admittance_controller = substituteSource {
      src = fetchgit {
        name = "admittance_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "683a9a5de64e923de4a9211da03d321ec66464e7";
        hash = "sha256-aucDuay1HbtHxixnjpcBxk7GuwrZvEp+6AEmidT6LmU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "admittance_controller";
  version = "4.9.0-1";
  src = sources.admittance_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros control_msgs control_toolbox controller_interface filters generate_parameter_library geometry_msgs hardware_interface joint_trajectory_controller kinematics_interface pluginlib rclcpp rclcpp_lifecycle realtime_tools tf2 tf2_eigen tf2_geometry_msgs tf2_kdl tf2_ros trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
