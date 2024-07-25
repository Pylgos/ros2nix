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
    mrpt_sensor_gnss_novatel = substituteSource {
      src = fetchgit {
        name = "mrpt_sensor_gnss_novatel-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "19eafca1c1196148346586a93d491ee278460e5d";
        hash = "sha256-kfTZUskPw7eSeJvzTitjr8QYA4pk6v0kaBlody3LDMA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_sensor_gnss_novatel";
  version = "0.2.1-1";
  src = sources.mrpt_sensor_gnss_novatel;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint_auto ament_lint_common mrpt2 mrpt_msgs mrpt_sensorlib rclcpp rclcpp_components tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
