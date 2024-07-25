{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  freeglut,
  geometry_msgs,
  glew,
  image_transport,
  launch_xml,
  libyamlcpp,
  mapviz_interfaces,
  marti_common_msgs,
  pkg-config,
  pluginlib,
  qt5,
  rclcpp,
  rqt_gui,
  rqt_gui_cpp,
  std_srvs,
  substituteSource,
  swri_math_util,
  swri_transform_util,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  wrapRosQtAppsHook,
  xorg,
}:
let
  sources = rec {
    mapviz = substituteSource {
      src = fetchgit {
        name = "mapviz-source";
        url = "https://github.com/ros2-gbp/mapviz-release.git";
        rev = "90e1b4a522c2c24bd3b4036173aac9f70e31eecd";
        hash = "sha256-+LLtWy44B2/c6kMWH0tdG7tjgNR4C9qv1HB/gwo8f14=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mapviz";
  version = "2.2.1-1";
  src = sources.mapviz;
  nativeBuildInputs = [ ament_cmake pkg-config wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch_xml ];
  buildInputs = [ qt5.qtbase ];
  propagatedBuildInputs = [ cv_bridge freeglut geometry_msgs glew image_transport libyamlcpp mapviz_interfaces marti_common_msgs pluginlib qt5.qtbase rclcpp rqt_gui rqt_gui_cpp std_srvs swri_math_util swri_transform_util tf2 tf2_geometry_msgs tf2_ros xorg.libXi xorg.libXmu ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
