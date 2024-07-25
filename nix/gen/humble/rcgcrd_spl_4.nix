{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    rcgcrd_spl_4 = substituteSource {
      src = fetchgit {
        name = "rcgcrd_spl_4-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "25c1cd38109723ec17cdbcc1245b02366ea7443e";
        hash = "sha256-0PU90iwMgI2SHSjz7Ktesjxlgl342yvFbQjjDUx1CXE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcgcrd_spl_4";
  version = "2.1.0-1";
  src = sources.rcgcrd_spl_4;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
