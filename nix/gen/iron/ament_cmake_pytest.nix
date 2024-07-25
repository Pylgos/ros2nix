{
  ament_cmake_core,
  ament_cmake_test,
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
    ament_cmake_pytest = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pytest-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "d7f5c07dc26fcd8b4898523ee1d256c2f1ee56cf";
        hash = "sha256-db2A5/xYMGpFiYgSEiC6bvwDDk3rTVESTFwwo6riAsQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_pytest";
  version = "2.0.5-1";
  src = sources.ament_cmake_pytest;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_test buildPackages.python3Packages.pytest ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_test python3Packages.pytest ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
