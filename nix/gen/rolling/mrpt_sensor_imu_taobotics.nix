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
  rclcpp,
  rclcpp_components,
  ros_environment,
  substituteSource,
  tf2,
  tf2_ros,
}:
let
  sources = rec {
    mrpt_sensor_imu_taobotics = substituteSource {
      src = fetchgit {
        name = "mrpt_sensor_imu_taobotics-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "ab307ca0433db8b8a5c143685b60a227e3b81080";
        hash = "sha256-sjubEiMgr6tJqNLbWu+hbPcqNd90lwaZQrktj2UKBCE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_sensor_imu_taobotics";
  version = "0.2.1-1";
  src = sources.mrpt_sensor_imu_taobotics;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint_common mrpt2 mrpt_msgs mrpt_sensorlib rclcpp rclcpp_components tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}