{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  imu_sensor_broadcaster,
  joint_state_broadcaster,
  ros2controlcli,
  substituteSource,
}:
let
  sources = rec {
    omni_base_controller_configuration = substituteSource {
      src = fetchgit {
        name = "omni_base_controller_configuration-source";
        url = "https://github.com/pal-gbp/omni_base_robot-release.git";
        rev = "65d80485afe0bc496b0b02e392cda87be1ab7b39";
        hash = "sha256-QQsCGKCQ/lqGIHZfMo24CP81s8mkNWCyeIoHD5JVq5E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "omni_base_controller_configuration";
  version = "2.0.18-1";
  src = sources.omni_base_controller_configuration;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager imu_sensor_broadcaster joint_state_broadcaster ros2controlcli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
