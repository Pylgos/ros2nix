{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  controller_manager,
  diff_drive_controller,
  fetchgit,
  fetchurl,
  fetchzip,
  force_torque_sensor_broadcaster,
  imu_sensor_broadcaster,
  joint_state_broadcaster,
  joint_trajectory_controller,
  launch,
  launch_pal,
  pal_gripper_controller_configuration,
  pal_hey5_controller_configuration,
  pal_robotiq_controller_configuration,
  ros2controlcli,
  substituteSource,
}:
let
  sources = rec {
    tiago_controller_configuration = substituteSource {
      src = fetchgit {
        name = "tiago_controller_configuration-source";
        url = "https://github.com/pal-gbp/tiago_robot-release.git";
        rev = "65563101f24c6da2e2f76ac670519a446c21872e";
        hash = "sha256-oU6VxVxrZTrIO3EdCxfjRUjoYr0T4wMYMwByK9Jgchk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tiago_controller_configuration";
  version = "4.2.16-1";
  src = sources.tiago_controller_configuration;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager diff_drive_controller force_torque_sensor_broadcaster imu_sensor_broadcaster joint_state_broadcaster joint_trajectory_controller launch_pal pal_gripper_controller_configuration pal_hey5_controller_configuration pal_robotiq_controller_configuration ros2controlcli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
