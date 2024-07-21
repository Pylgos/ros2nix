{
  ament_cmake,
  ament_lint_auto,
  buildRosPackage,
  canopen_402_driver,
  canopen_core,
  canopen_fake_slaves,
  canopen_proxy_driver,
  canopen_ros2_controllers,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  forward_command_controller,
  joint_state_broadcaster,
  joint_trajectory_controller,
  lely_core_libraries,
  robot_state_publisher,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    canopen_tests = substituteSource {
      src = fetchgit {
        name = "canopen_tests-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "245f785040107d7d95abbf1f3939c2638ec8024e";
        hash = "sha256-lDdU44SmHu7qBWcilveZZLNdZmMRX/PIjsuqOfDy0V8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_tests";
  version = "0.2.9-2";
  src = sources.canopen_tests;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ canopen_402_driver canopen_core canopen_fake_slaves canopen_proxy_driver canopen_ros2_controllers controller_manager forward_command_controller joint_state_broadcaster joint_trajectory_controller lely_core_libraries robot_state_publisher xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
