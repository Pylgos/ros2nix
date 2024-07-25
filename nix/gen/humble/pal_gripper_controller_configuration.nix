{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_trajectory_controller,
  position_controllers,
  substituteSource,
}:
let
  sources = rec {
    pal_gripper_controller_configuration = substituteSource {
      src = fetchgit {
        name = "pal_gripper_controller_configuration-source";
        url = "https://github.com/pal-gbp/pal_gripper-release.git";
        rev = "15fa6fa0b6ad3c6611d746147b8128bdd3c5870a";
        hash = "sha256-w+TuF+E039odM1bjgLmrXLwgJ4j3b1izwDZL7UEEMsU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pal_gripper_controller_configuration";
  version = "3.2.0-1";
  src = sources.pal_gripper_controller_configuration;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager joint_trajectory_controller position_controllers ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
