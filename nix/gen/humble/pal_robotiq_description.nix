{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    pal_robotiq_description = substituteSource {
      src = fetchgit {
        name = "pal_robotiq_description-source";
        url = "https://github.com/pal-gbp/pal_robotiq_gripper-release.git";
        rev = "4781fa3cd446baf1754751da448d1e2ffb1c2967";
        hash = "sha256-6YGFhccOoEdvssg4vZf+mmpangW6VIrZl5wMA6lWzJE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pal_robotiq_description";
  version = "2.0.3-1";
  src = sources.pal_robotiq_description;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
