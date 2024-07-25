{
  ament_flake8,
  ament_lint,
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
    ament_pep257 = substituteSource {
      src = fetchgit {
        name = "ament_pep257-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "237890f09df4dcf3ba78feaf4ae1900a2ae4d457";
        hash = "sha256-bCVbNeprGniGmelyWY9m8hXKfwS/2IuJZSLyzeSXnUo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_pep257";
  version = "0.14.3-1";
  src = sources.ament_pep257;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_lint buildPackages.python3Packages.pydocstyle ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint python3Packages.pydocstyle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
