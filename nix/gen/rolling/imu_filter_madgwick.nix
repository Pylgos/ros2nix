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
        rev = "7ee0d1935761f893a2886fa63bab087357798c86";
        hash = "sha256-9xtHq3mg21RtWQYIhMsY0cbBWAiBh4WzSO3jZvFDaJc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "imu_filter_madgwick";
  version = "2.1.4-1";
  src = sources.imu_filter_madgwick;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs nav_msgs rclcpp rclcpp_action rclcpp_lifecycle sensor_msgs tf2_geometry_msgs tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
