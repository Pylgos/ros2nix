{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  asio,
  asio_cmake_module,
  buildRosPackage,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  io_context,
  off_highway_premium_radar_sample_msgs,
  pcl_conversions,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
}:
let
  sources = rec {
    off_highway_premium_radar_sample = substituteSource {
      src = fetchgit {
        name = "off_highway_premium_radar_sample-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "6d20e8c36e80c461494fafacddcb7b336247f2c3";
        hash = "sha256-o6C87ylEDZi9XTvyREY9gH9YvFPDn+tM1TpqT1fNANE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "off_highway_premium_radar_sample";
  version = "0.6.2-1";
  src = sources.off_highway_premium_radar_sample;
  nativeBuildInputs = [ ament_cmake asio_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ asio diagnostic_updater io_context off_highway_premium_radar_sample_msgs pcl_conversions rclcpp rclcpp_components sensor_msgs std_msgs tf2 tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
