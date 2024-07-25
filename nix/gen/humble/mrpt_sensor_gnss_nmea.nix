{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mrpt2,
  mrpt_msgs,
  mrpt_sensorlib,
  nmea_msgs,
  rclcpp,
  rclcpp_components,
  ros_environment,
  substituteSource,
  tf2,
  tf2_ros,
}:
let
  sources = rec {
    mrpt_sensor_gnss_nmea = substituteSource {
      src = fetchgit {
        name = "mrpt_sensor_gnss_nmea-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "b7aa5089b6525e0534030c69a80c9337e43c0b64";
        hash = "sha256-bKWcG2FncxCAusKuzczI5RhkWJts1Q+3OKHmPMtpRVs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_sensor_gnss_nmea";
  version = "0.2.1-1";
  src = sources.mrpt_sensor_gnss_nmea;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint_common mrpt2 mrpt_msgs mrpt_sensorlib nmea_msgs rclcpp rclcpp_components tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
