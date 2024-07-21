{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  sensor_msgs,
  substituteSource,
  tf2_geometry_msgs,
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    imu_filter_madgwick = substituteSource {
      src = fetchgit {
        name = "imu_filter_madgwick-source";
        url = "https://github.com/ros2-gbp/imu_tools-release.git";
        rev = "59e949934d499233cb04ebd9050138423fae2962";
        hash = "sha256-w1yVzPSVadsRmFRs1oZ8HEZ6DXYiezID3dunE9J6VUY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "imu_filter_madgwick";
  version = "2.1.3-4";
  src = sources.imu_filter_madgwick;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs nav_msgs rclcpp rclcpp_action rclcpp_lifecycle sensor_msgs tf2_geometry_msgs tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
