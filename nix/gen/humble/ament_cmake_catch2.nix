{
  ament_cmake_core,
  ament_cmake_test,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_catch2 = substituteSource {
      src = fetchgit {
        name = "ament_cmake_catch2-source";
        url = "https://github.com/ros2-gbp/ament_cmake_catch2-release.git";
        rev = "f5dbd4b8681082b3b54a9a9f51379d699827b706";
        hash = "sha256-y53GKh+qh8e5LBgz8yUQ9yHJ0BFzY1wTmu/PpxbPfAU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_catch2";
  version = "1.2.1-1";
  src = sources.ament_cmake_catch2;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
