{
  buildRosPackage,
  cppcheck,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cppcheck = substituteSource {
      src = fetchgit {
        name = "ament_cppcheck-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "815b37badd6ff44e4843851673ae2984882b88dc";
        hash = "sha256-mloKsvPcptZIrsmWjCGiNNQeR17JaM9ficNhAGt6dJw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cppcheck";
  version = "0.12.11-1";
  src = sources.ament_cppcheck;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ cppcheck ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cppcheck ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
