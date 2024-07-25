{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  image_geometry,
  laser_geometry,
  pcl_conversions,
  rclcpp,
  rclcpp_components,
  ros_environment,
  rtabmap,
  rtabmap_msgs,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rtabmap_conversions = substituteSource {
      src = fetchgit {
        name = "rtabmap_conversions-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "e271f13c6d29d3a5feeae2f3174a75049c989c70";
        hash = "sha256-dEGeaZyM+ar3xkk16/dwV+D6Ms6mJyf8IFNTI1wDkMY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rtabmap_conversions";
  version = "0.21.5-1";
  src = sources.rtabmap_conversions;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge geometry_msgs image_geometry laser_geometry pcl_conversions rclcpp rclcpp_components rtabmap rtabmap_msgs sensor_msgs std_msgs tf2 tf2_eigen tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
