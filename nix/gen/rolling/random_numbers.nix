{
  ament_cmake,
  ament_lint_auto,
  ament_lint_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    random_numbers = substituteSource {
      src = fetchgit {
        name = "random_numbers-source";
        url = "https://github.com/ros2-gbp/random_numbers-release.git";
        rev = "76e3073d3b6ff781466beaad1449c578e124efb0";
        hash = "sha256-hQN9n+tLK1rKA+wXOXW/TfT4RzrXxvaIfDlzgV+LJnU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "random_numbers";
  version = "2.0.1-4";
  src = sources.random_numbers;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
