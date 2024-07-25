{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  off_highway_premium_radar_sample,
  off_highway_radar,
  pcl_ros,
  rclcpp,
  rclcpp_components,
  substituteSource,
}:
let
  sources = rec {
    off_highway_sensor_drivers_examples = substituteSource {
      src = fetchgit {
        name = "off_highway_sensor_drivers_examples-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "9cfa5f370fadd7369749fe3d65e406f70c061039";
        hash = "sha256-wry5qfda/MfufgW3iNvLoO30TMbBLADSiFxYebwlzPk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "off_highway_sensor_drivers_examples";
  version = "0.6.2-1";
  src = sources.off_highway_sensor_drivers_examples;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav_msgs off_highway_premium_radar_sample off_highway_radar pcl_ros rclcpp rclcpp_components ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
