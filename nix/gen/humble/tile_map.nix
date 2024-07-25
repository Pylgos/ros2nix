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
        rev = "86733d71c56e0bb5428dd6137599d3f3713cdceb";
        hash = "sha256-mo2ls9btcS+HUr6+286zz+B9JZMXlQMYtAPIM29RHOU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tile_map";
  version = "2.2.1-1";
  src = sources.tile_map;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ qt5.qtbase ];
  propagatedBuildInputs = [ glew jsoncpp libyamlcpp mapviz pluginlib qt5.qtbase rclcpp swri_math_util swri_transform_util tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
