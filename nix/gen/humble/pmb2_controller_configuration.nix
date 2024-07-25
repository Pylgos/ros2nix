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
  imu_sensor_broadcaster,
  joint_state_broadcaster,
  launch,
  launch_pal,
  ros2controlcli,
  substituteSource,
}:
let
  sources = rec {
    pmb2_controller_configuration = substituteSource {
      src = fetchgit {
        name = "pmb2_controller_configuration-source";
        url = "https://github.com/pal-gbp/pmb2_robot-gbp.git";
        rev = "84f9d4578f2502ae8ca64df39c64d59401358fad";
        hash = "sha256-5DUvuZrGS6FRdK47SV8tSkQtVKtWvEn7j6g5TetA0jI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pmb2_controller_configuration";
  version = "5.0.25-1";
  src = sources.pmb2_controller_configuration;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager diff_drive_controller imu_sensor_broadcaster joint_state_broadcaster launch_pal ros2controlcli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
