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
        rev = "4429fdde46f6170c6935cd73935456aaba08fbfd";
        hash = "sha256-ExcgrVUfCvlsZPSG3gQlk130AGk6BGVjXdOPxjadUDs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_mypy";
  version = "0.14.3-1";
  src = sources.ament_mypy;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.mypy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.mypy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
