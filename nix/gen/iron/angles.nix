{
  ament_cmake,
  ament_cmake_python,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    angles = substituteSource {
      src = fetchgit {
        name = "angles-source";
        url = "https://github.com/ros2-gbp/angles-release.git";
        rev = "bd5019fb28405dc473aeff387bc7282c9603d50f";
        hash = "sha256-l4xIXnIMoWmTEkIubTtt1g/NZdI+H9zvYXd0izyPAKw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "angles";
  version = "1.16.0-4";
  src = sources.angles;
  nativeBuildInputs = [ ament_cmake_python buildPackages.python3Packages.setuptools ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
