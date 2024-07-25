{
  ament_flake8,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    ament_mypy = substituteSource {
      src = fetchgit {
        name = "ament_mypy-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "584bdb5b58279f2a4d5346254af1d0eecfd90087";
        hash = "sha256-VqCA1gmUlWAL5jHTNEBhckBvLaYjMEgr+g5EEF2VSx8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_mypy";
  version = "0.12.11-1";
  src = sources.ament_mypy;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.mypy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.mypy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
