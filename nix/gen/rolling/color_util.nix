{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    color_util = substituteSource {
      src = fetchgit {
        name = "color_util-source";
        url = "https://github.com/ros2-gbp/color_util-release.git";
        rev = "c019b9fb4d30287b9eb4c251ce749fb12a821a27";
        hash = "sha256-vHOcY7emyuuqZ06vo77SGvGnnV/T+wv1Va/tHUIGXIs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "color_util";
  version = "1.0.0-3";
  src = sources.color_util;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
