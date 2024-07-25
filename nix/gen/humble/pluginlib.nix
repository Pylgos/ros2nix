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
        rev = "551fbde0b9cdfac2c557dc154054c61e54d1f78b";
        hash = "sha256-txbFscz7qeuMKOxpw/C+ELr9fl7vIE695EM5tzcJ9xM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pluginlib";
  version = "5.1.0-3";
  src = sources.pluginlib;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ class_loader rcpputils rcutils tinyxml2_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
