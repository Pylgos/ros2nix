{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    ament_cpplint = substituteSource {
      src = fetchgit {
        name = "ament_cpplint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "6e924c83eca136bf06c573c43b259d8442e0c659";
        hash = "sha256-9aF9/uR+46EMMq8hwEZRnam9Qq5v96ZvDbYCweXZzXA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cpplint";
  version = "0.14.3-1";
  src = sources.ament_cpplint;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
