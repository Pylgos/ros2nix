{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pal_urdf_utils,
  substituteSource,
  urdf_test,
  xacro,
}:
let
  sources = rec {
    pal_gripper_description = substituteSource {
      src = fetchgit {
        name = "pal_gripper_description-source";
        url = "https://github.com/pal-gbp/pal_gripper-release.git";
        rev = "916cc01eedd2416b723b33b4debeb3018f2b6919";
        hash = "sha256-/st4aqAax93Bm6gtQn5BK+u6sfI2VfLDq2Ea4OoglR0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pal_gripper_description";
  version = "3.2.0-1";
  src = sources.pal_gripper_description;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pal_urdf_utils xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
