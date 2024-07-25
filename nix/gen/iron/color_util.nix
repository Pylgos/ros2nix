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
        rev = "e95230b6125246a7d311b9b0e6f8d9f996ecfd65";
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
