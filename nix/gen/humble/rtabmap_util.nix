{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  grid_map_ros,
  image_transport,
  laser_geometry,
  message_filters,
  nav_msgs,
  octomap_msgs,
  pcl_conversions,
  pcl_ros,
  rclcpp,
  rclcpp_components,
  rtabmap_conversions,
  rtabmap_msgs,
  sensor_msgs,
  std_msgs,
  stereo_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rtabmap_util = substituteSource {
      src = fetchgit {
        name = "rtabmap_util-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "8ac52af7fa8ba2a1f8b57757e9f3dcd2568d2263";
        hash = "sha256-GyWO389pW9f9l+6NOn2r+/zTfPXV0R4uJWlOOkQj9GY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rtabmap_util";
  version = "0.21.5-1";
  src = sources.rtabmap_util;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge grid_map_ros image_transport laser_geometry message_filters nav_msgs octomap_msgs pcl_conversions pcl_ros rclcpp rclcpp_components rtabmap_conversions rtabmap_msgs sensor_msgs std_msgs stereo_msgs tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
