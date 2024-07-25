{
  ament_cmake_core,
  ament_cmake_test,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_nose = substituteSource {
      src = fetchgit {
        name = "ament_cmake_nose-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "e1ae4e72406477fae99bd6554dd50d804a163419";
        hash = "sha256-Jp36Tx22FGEXymGbLP22S4+YBWrCBKTbFwonpVEH05Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_nose";
  version = "1.3.9-1";
  src = sources.ament_cmake_nose;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_test buildPackages.python3Packages.nose ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
