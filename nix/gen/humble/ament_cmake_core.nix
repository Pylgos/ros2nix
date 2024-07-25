{
  ament_package,
  buildPackages,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_core = substituteSource {
      src = fetchgit {
        name = "ament_cmake_core-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "f424975044b8ff312dee75334e58a3aa1a7325e4";
        hash = "sha256-V3mYh46GhYeRYVsjc2xvWTWguTT8SSTEKPLvBj4bvUo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_core";
  version = "1.3.9-1";
  src = sources.ament_cmake_core;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_package cmake buildPackages.python3Packages.catkin-pkg ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_package cmake python3Packages.catkin-pkg ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
