{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  libyamlcpp,
  message_filters,
  pcl,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_ros,
  velodyne_msgs,
}:
let
  sources = rec {
    velodyne_pointcloud = substituteSource {
      src = fetchgit {
        name = "velodyne_pointcloud-source";
        url = "https://github.com/ros2-gbp/velodyne-release.git";
        rev = "35739a33f8f260a755e03a4dfb6e170fca09b01e";
        hash = "sha256-hkvzuZw8cF8+XSVnSmlVOPLOTlg7vhtPoqd1gNK0mo8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velodyne_pointcloud";
  version = "2.3.0-4";
  src = sources.velodyne_pointcloud;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles diagnostic_updater geometry_msgs libyamlcpp message_filters pcl rclcpp rclcpp_components sensor_msgs tf2 tf2_ros velodyne_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
