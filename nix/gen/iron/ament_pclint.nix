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
        rev = "2af4d1938a5dc928a7fb0e47da4eca3f4ab96219";
        hash = "sha256-Mb3YPaMumwriT3J60AIzUI6jm3LCqsLjywurN5IuFTE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_pclint";
  version = "0.14.3-1";
  src = sources.ament_pclint;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
