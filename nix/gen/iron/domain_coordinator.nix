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
    domain_coordinator = substituteSource {
      src = fetchgit {
        name = "domain_coordinator-source";
        url = "https://github.com/ros2-gbp/ament_cmake_ros-release.git";
        rev = "e12d5e00415761ce94b21de7dea73d96276071a6";
        hash = "sha256-ydg9Yw1O9MT+BCp0BujC3A77Fa+du6HELb76q54wg3U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "domain_coordinator";
  version = "0.11.2-4";
  src = sources.domain_coordinator;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
