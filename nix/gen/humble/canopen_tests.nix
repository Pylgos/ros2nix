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
        rev = "d7078eab01e0e8b361efb563590483dccc82223b";
        hash = "sha256-FYopJXwYaid4m+OrpFgzAGb7aM/cM77XxSxiRDOhL74=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_tests";
  version = "0.2.11-2";
  src = sources.canopen_tests;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ canopen_402_driver canopen_core canopen_fake_slaves canopen_proxy_driver canopen_ros2_controllers controller_manager forward_command_controller joint_state_broadcaster joint_trajectory_controller lely_core_libraries robot_state_publisher xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}