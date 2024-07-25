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
    pal_robotiq_controller_configuration = substituteSource {
      src = fetchgit {
        name = "pal_robotiq_controller_configuration-source";
        url = "https://github.com/pal-gbp/pal_robotiq_gripper-release.git";
        rev = "ab7ddc642baf6e4c35f20e06f9fda41e4c736274";
        hash = "sha256-TWoDO5hwXlMKKx7Eo9oUhSXe+rJ5/+q2+oeQxi2zsb8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pal_robotiq_controller_configuration";
  version = "2.0.3-1";
  src = sources.pal_robotiq_controller_configuration;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager joint_trajectory_controller position_controllers ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
