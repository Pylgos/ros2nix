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
    ament_pclint = substituteSource {
      src = fetchgit {
        name = "ament_pclint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "ead4b3992102fa4fc0d83654cff4c63a7cbbd773";
        hash = "sha256-6xntqzIXUNsDn9ReWlStV4XIaiXW1wuNJGL0p5fE90E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_pclint";
  version = "0.12.11-1";
  src = sources.ament_pclint;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
