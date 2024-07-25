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
        rev = "8a45ef36b182be7061f15d0325bc1e9654eacd71";
        hash = "sha256-FPaVY9aM5Uty1nP68/i+mmwjekUpLNHjB/h+yxaGUn8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_core";
  version = "2.7.0-1";
  src = sources.ament_cmake_core;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_package cmake buildPackages.python3Packages.catkin-pkg ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_package cmake python3Packages.catkin-pkg ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
