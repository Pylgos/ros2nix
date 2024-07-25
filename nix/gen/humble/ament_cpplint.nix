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
        rev = "cb0a3c5373a4ec756f23b03d1bb782caec4c4851";
        hash = "sha256-w9qpSXIgsQWAXFc4yqv1tLpr2YoRGG+NSyWZ1jFh6d0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cpplint";
  version = "0.12.11-1";
  src = sources.ament_cpplint;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
