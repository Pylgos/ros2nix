{
  ament_cmake_auto,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_pal,
  launch_param_builder,
  launch_ros,
  launch_testing_ament_cmake,
  omni_base_description,
  pal_gripper_description,
  pal_hey5_description,
  pal_robotiq_description,
  pal_urdf_utils,
  pmb2_description,
  robot_state_publisher,
  substituteSource,
  urdf_test,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    tiago_description = substituteSource {
      src = fetchgit {
        name = "tiago_description-source";
        url = "https://github.com/pal-gbp/tiago_robot-release.git";
        rev = "706416ba3b52a4e36917c53d36c0778f79fadd76";
        hash = "sha256-12djwNOjoTJKo6pwyx6KQBV/4lMhOjeJFdvRxthd0O8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tiago_description";
  version = "4.2.16-1";
  src = sources.tiago_description;
  nativeBuildInputs = [ ament_cmake_auto ament_cmake_python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_pal launch_param_builder launch_ros omni_base_description pal_gripper_description pal_hey5_description pal_robotiq_description pal_urdf_utils pmb2_description robot_state_publisher xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
