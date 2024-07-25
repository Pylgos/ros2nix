{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  polygon_msgs,
  substituteSource,
}:
let
  sources = rec {
    polygon_utils = substituteSource {
      src = fetchgit {
        name = "polygon_utils-source";
        url = "https://github.com/ros2-gbp/polygon_ros-release.git";
        rev = "9f13c71a3abad7c294bbdb474d07b537f2086c0f";
        hash = "sha256-0deQK1zVECzgKwBQrLq3CbvDnZaRlnSpT1XOqhV1h58=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "polygon_utils";
  version = "1.0.2-1";
  src = sources.polygon_utils;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs polygon_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}