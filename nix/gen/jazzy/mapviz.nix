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
  libyamlcpp,
  mapviz_interfaces,
  marti_common_msgs,
  pkg-config,
  pluginlib,
  qt5,
  rclcpp,
  ros_environment,
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
        rev = "4530d80eb34d0350971485ca44740c07f0ce00cd";
        hash = "sha256-QOavYJZ21V7PB+K2MI7j0uEWX1GmRRIocdvdSs2ZfP0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mapviz";
  version = "2.3.0-3";
  src = sources.mapviz;
  nativeBuildInputs = [ ament_cmake pkg-config ros_environment wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ qt5.qtbase ];
  propagatedBuildInputs = [ cv_bridge freeglut geometry_msgs glew image_transport libyamlcpp mapviz_interfaces marti_common_msgs pluginlib qt5.qtbase rclcpp rqt_gui rqt_gui_cpp std_srvs swri_math_util swri_transform_util tf2 tf2_geometry_msgs tf2_ros xorg.libXi xorg.libXmu ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
