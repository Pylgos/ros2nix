{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pal_gazebo_worlds,
  pal_gripper_controller_configuration,
  pal_gripper_description,
  pal_urdf_utils,
  robot_state_publisher,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    pal_gripper_simulation = substituteSource {
      src = fetchgit {
        name = "pal_gripper_simulation-source";
        url = "https://github.com/pal-gbp/pal_gripper-release.git";
        rev = "faeee4b3c8a626e890d0d2667396b586604728bd";
        hash = "sha256-8UJZrlQLAaT/cMcv/aVH+DBvZauVoBVZpz5wRs3Of2o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pal_gripper_simulation";
  version = "3.2.0-1";
  src = sources.pal_gripper_simulation;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pal_gazebo_worlds pal_gripper_controller_configuration pal_gripper_description pal_urdf_utils robot_state_publisher xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
