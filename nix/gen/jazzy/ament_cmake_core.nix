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
        rev = "65ace2e56e472ed3b69364bd4fd7c652d752b15c";
        hash = "sha256-czHzCWezSznFjt0r10mEYbLNbFkZ1CoUf8QbjrZfsMM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_core";
  version = "2.5.2-1";
  src = sources.ament_cmake_core;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_package cmake buildPackages.python3Packages.catkin-pkg ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_package cmake python3Packages.catkin-pkg ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
