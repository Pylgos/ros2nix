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
        rev = "03305af055a6072358fc3ecd51328f7a43979ec1";
        hash = "sha256-WtCzxsAiX8q+jCvftF+oE6e2sr41b8HLUnj7r1UFAK4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velodyne_pointcloud";
  version = "2.4.0-1";
  src = sources.velodyne_pointcloud;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles diagnostic_updater geometry_msgs libyamlcpp message_filters pcl rclcpp rclcpp_components sensor_msgs tf2 tf2_ros velodyne_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
