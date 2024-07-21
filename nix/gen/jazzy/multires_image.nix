{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  gps_msgs,
  mapviz,
  pluginlib,
  qt5,
  rclcpp,
  rclpy,
  substituteSource,
  swri_math_util,
  swri_transform_util,
  tf2,
}:
let
  sources = rec {
    multires_image = substituteSource {
      src = fetchgit {
        name = "multires_image-source";
        url = "https://github.com/ros2-gbp/mapviz-release.git";
        rev = "1fd376251a241780b6b1b7f891c9c27eec819b07";
        hash = "sha256-KvU020VAzmWVhBEWe4vfhtWwK375EA3fBv8Ss5DwgR8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "multires_image";
  version = "2.3.0-3";
  src = sources.multires_image;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ qt5.qtbase ];
  propagatedBuildInputs = [ cv_bridge geometry_msgs gps_msgs mapviz pluginlib qt5.qtbase rclcpp rclpy swri_math_util swri_transform_util tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
