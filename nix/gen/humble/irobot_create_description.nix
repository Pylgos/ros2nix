{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  urdf,
}:
let
  sources = rec {
    irobot_create_description = substituteSource {
      src = fetchgit {
        name = "irobot_create_description-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "64db3547c71f928563ffefd1d697eeaa3ef92024";
        hash = "sha256-GzpENHZJ/Re1cp3OGpYapAwbpPt3H33wloBw4Sag0EM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "irobot_create_description";
  version = "2.1.0-1";
  src = sources.irobot_create_description;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
