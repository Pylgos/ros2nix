{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  glew,
  jsoncpp,
  libyamlcpp,
  mapviz,
  pluginlib,
  qt5,
  rclcpp,
  substituteSource,
  swri_math_util,
  swri_transform_util,
  tf2,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    tile_map = substituteSource {
      src = fetchgit {
        name = "tile_map-source";
        url = "https://github.com/ros2-gbp/mapviz-release.git";
        rev = "49a28ec31712f7c179106c7d67f58d525444f979";
        hash = "sha256-Wie6Oz1qi7tULGUlrI34TVWHTHcYJm17tOWIWgmLBaM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tile_map";
  version = "2.2.2-1";
  src = sources.tile_map;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ qt5.qtbase ];
  propagatedBuildInputs = [ glew jsoncpp libyamlcpp mapviz pluginlib qt5.qtbase rclcpp swri_math_util swri_transform_util tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
