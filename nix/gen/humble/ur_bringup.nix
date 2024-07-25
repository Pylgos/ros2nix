{
  ament_cmake,
  ament_cmake_python,
  buildRosPackage,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  force_torque_sensor_broadcaster,
  joint_state_broadcaster,
  joint_state_publisher,
  joint_trajectory_controller,
  launch,
  launch_ros,
  position_controllers,
  rclpy,
  robot_state_publisher,
  ros2_controllers_test_nodes,
  rviz2,
  substituteSource,
  ur_controllers,
  ur_description,
  urdf,
  velocity_controllers,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    ur_bringup = substituteSource {
      src = fetchgit {
        name = "ur_bringup-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "4d56ca11d28ec1e6c0e419f5b543aaac801a24e6";
        hash = "sha256-/eRxtel0nvkhRQpfTQeOFMlic4SvDC2rMfptzB2Pgy8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_bringup";
  version = "2.2.14-1";
  src = sources.ur_bringup;
  nativeBuildInputs = [ ament_cmake ament_cmake_python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager force_torque_sensor_broadcaster joint_state_broadcaster joint_state_publisher joint_trajectory_controller launch_ros position_controllers rclpy robot_state_publisher ros2_controllers_test_nodes rviz2 ur_controllers ur_description urdf velocity_controllers xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
