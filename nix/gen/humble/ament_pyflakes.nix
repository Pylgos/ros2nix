{
  ament_pycodestyle,
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
    ament_pyflakes = substituteSource {
      src = fetchgit {
        name = "ament_pyflakes-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "21631b4169dfa18485525474fd0ca65fd17f73c8";
        hash = "sha256-bu4cK/K3fNMJ+hY40H9DARmVK8aUHYT+DKWsnX+PwNo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_pyflakes";
  version = "0.12.11-1";
  src = sources.ament_pyflakes;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pyflakes ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.pyflakes ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
