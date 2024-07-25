{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pal_robotiq_controller_configuration,
  pal_robotiq_description,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    pal_robotiq_gripper = substituteSource {
      src = fetchgit {
        name = "pal_robotiq_gripper-source";
        url = "https://github.com/pal-gbp/pal_robotiq_gripper-release.git";
        rev = "038978f2bc5317aa4f8bd17b7f04a695559142f5";
        hash = "sha256-nhUrkbZvKlllnwJzEqdM/vEmtdquM+fRV9xREEo6g3c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pal_robotiq_gripper";
  version = "2.0.3-1";
  src = sources.pal_robotiq_gripper;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pal_robotiq_controller_configuration pal_robotiq_description rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
