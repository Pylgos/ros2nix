{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ros,
  pcl,
  pcl_conversions,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    pcl_ros = substituteSource {
      src = fetchgit {
        name = "pcl_ros-source";
        url = "https://github.com/ros2-gbp/perception_pcl-release.git";
        rev = "4200ad2cd0685c607ff4c420e6825f5abeb5457c";
        hash = "sha256-JYaF0rM0jptFPpMnfXIyQDMAwFXoG/ULAVW/d4/CVPs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pcl_ros";
  version = "2.6.1-4";
  src = sources.pcl_ros;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ pcl ];
  propagatedBuildInputs = [ eigen geometry_msgs pcl_conversions rclcpp rclcpp_components sensor_msgs tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
