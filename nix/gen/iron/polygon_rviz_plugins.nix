{
  ament_cmake,
  buildRosPackage,
  color_util,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  pluginlib,
  polygon_msgs,
  polygon_utils,
  rviz_common,
  std_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    polygon_rviz_plugins = substituteSource {
      src = fetchgit {
        name = "polygon_rviz_plugins-source";
        url = "https://github.com/ros2-gbp/polygon_ros-release.git";
        rev = "af7f47bce576e68823948e58921b8358033e1dad";
        hash = "sha256-KMmv93mqtxZNcLSOVHhFfJMCuQI8fP6NKp7mEnY5O18=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "polygon_rviz_plugins";
  version = "1.0.2-2";
  src = sources.polygon_rviz_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ color_util geometry_msgs pluginlib polygon_msgs polygon_utils rviz_common std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
