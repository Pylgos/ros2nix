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
        rev = "d318949743d9ba09db0d044eef38f75523531d35";
        hash = "sha256-X0Y5Unm/dLC3XKQHGo2FyD5mMlYLYm65IQMrDhFHnMg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pluginlib";
  version = "5.2.2-3";
  src = sources.pluginlib;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ class_loader rcpputils rcutils tinyxml2_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
