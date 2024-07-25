{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  buildRosPackage,
  class_loader,
  fetchgit,
  fetchurl,
  fetchzip,
  rcpputils,
  rcutils,
  substituteSource,
  tinyxml2_vendor,
}:
let
  sources = rec {
    pluginlib = substituteSource {
      src = fetchgit {
        name = "pluginlib-source";
        url = "https://github.com/ros2-gbp/pluginlib-release.git";
        rev = "e0e100b408972964cc3e4d9bc3ce9e51e6bad59b";
        hash = "sha256-mGaxBfvti56QtGOLIstxwSBWUOMvTED08/q2MTyxYiA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pluginlib";
  version = "5.5.0-1";
  src = sources.pluginlib;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp class_loader rcpputils rcutils tinyxml2_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
