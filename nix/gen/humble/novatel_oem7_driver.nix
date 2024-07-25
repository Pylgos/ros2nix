{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geographiclib,
  gps_msgs,
  launch_testing,
  launch_testing_ament_cmake,
  launch_testing_ros,
  nav_msgs,
  nmea_msgs,
  novatel_oem7_msgs,
  pluginlib,
  python3Packages,
  rclcpp,
  rclcpp_components,
  rclpy,
  rosbag2,
  rosidl_runtime_py,
  sensor_msgs,
  substituteSource,
  tf2_geometry_msgs,
}:
let
  sources = rec {
    novatel_oem7_driver = substituteSource {
      src = fetchgit {
        name = "novatel_oem7_driver-source";
        url = "https://github.com/novatel-gbp/novatel_oem7_driver-release.git";
        rev = "a5676c746fc1eaee67630a306a09913f0332e30d";
        hash = "sha256-hIp5KpqNqTOsUoLX8yIotIbwzSpQX+MIBrxdsCM9NJI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "novatel_oem7_driver";
  version = "20.1.0-1";
  src = sources.novatel_oem7_driver;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geographiclib gps_msgs nav_msgs nmea_msgs novatel_oem7_msgs pluginlib python3Packages.boost rclcpp rclcpp_components sensor_msgs tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
