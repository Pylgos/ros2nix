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
        rev = "0cbe5a891e51e776ae12816bbff0e9a1dc3612e9";
        hash = "sha256-knEX5GdZ4kko2klZyDn7NuURyiyssbtw/OebuSY8m7Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_core";
  version = "2.0.5-1";
  src = sources.ament_cmake_core;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_package cmake buildPackages.python3Packages.catkin-pkg ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_package cmake python3Packages.catkin-pkg ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
