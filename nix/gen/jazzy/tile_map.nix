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
}:
let
  sources = rec {
    tile_map = substituteSource {
      src = fetchgit {
        name = "tile_map-source";
        url = "https://github.com/ros2-gbp/mapviz-release.git";
        rev = "1b3beab509ebdbe12474ad403d078ff79bc7441a";
        hash = "sha256-0iUL8wMHfRRc8jU2qyjNoCspfh4GFBeQQhI2FwAgF9Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tile_map";
  version = "2.3.0-3";
  src = sources.tile_map;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ jsoncpp qt5.qtbase ];
  propagatedBuildInputs = [ glew jsoncpp libyamlcpp mapviz pluginlib qt5.qtbase rclcpp swri_math_util swri_transform_util tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
