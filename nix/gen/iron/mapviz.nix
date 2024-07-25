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
        rev = "d6f50708d14b084bf7e2d868bbd86ca0b9b99ef5";
        hash = "sha256-07oLc25wmLImPJUNq+iVKDTHfhXbfC5c2wJJMj4dMXA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mapviz";
  version = "2.2.2-1";
  src = sources.mapviz;
  nativeBuildInputs = [ ament_cmake pkg-config wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch_xml ros_environment ];
  buildInputs = [ qt5.qtbase ];
  propagatedBuildInputs = [ cv_bridge freeglut geometry_msgs glew image_transport libyamlcpp mapviz_interfaces marti_common_msgs pluginlib qt5.qtbase rclcpp rqt_gui rqt_gui_cpp std_srvs swri_math_util swri_transform_util tf2 tf2_geometry_msgs tf2_ros xorg.libXi xorg.libXmu ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
