{
  ackermann_steering_controller,
  admittance_controller,
  ament_cmake,
  bicycle_steering_controller,
  buildRosPackage,
  diff_drive_controller,
  effort_controllers,
  fetchgit,
  fetchurl,
  fetchzip,
  force_torque_sensor_broadcaster,
  forward_command_controller,
  imu_sensor_broadcaster,
  joint_state_broadcaster,
  joint_trajectory_controller,
  pid_controller,
  position_controllers,
  range_sensor_broadcaster,
  steering_controllers_library,
  substituteSource,
  tricycle_controller,
  tricycle_steering_controller,
  velocity_controllers,
}:
let
  sources = rec {
    ros2_controllers = substituteSource {
      src = fetchgit {
        name = "ros2_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "f1775c3b26455b3016b4bc9aaed40691e64b7a76";
        hash = "sha256-L9iisg5OecdStdu+zib0b2RxSeDlCc+BJMp+ZvNR0cg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2_controllers";
  version = "4.10.0-1";
  src = sources.ros2_controllers;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ackermann_steering_controller admittance_controller bicycle_steering_controller diff_drive_controller effort_controllers force_torque_sensor_broadcaster forward_command_controller imu_sensor_broadcaster joint_state_broadcaster joint_trajectory_controller pid_controller position_controllers range_sensor_broadcaster steering_controllers_library tricycle_controller tricycle_steering_controller velocity_controllers ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
