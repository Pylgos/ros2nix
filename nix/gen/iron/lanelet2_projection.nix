{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geographiclib,
  gtest,
  lanelet2_io,
  mrt_cmake_modules,
  substituteSource,
}:
let
  sources = rec {
    lanelet2_projection = substituteSource {
      src = fetchgit {
        name = "lanelet2_projection-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "67cafffb0b57ce831e7f124a32b1a8e37a719a04";
        hash = "sha256-g7mKXEdhoZS5qv8iio+6QG27tM/nleTmGWeaw66I+bU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2_projection";
  version = "1.1.1-5";
  src = sources.lanelet2_projection;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ mrt_cmake_modules ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geographiclib lanelet2_io ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
