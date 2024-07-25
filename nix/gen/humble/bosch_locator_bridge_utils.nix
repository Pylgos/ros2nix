{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_util,
  nav_msgs,
  pcl_conversions,
  rclcpp,
  std_srvs,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    bosch_locator_bridge_utils = substituteSource {
      src = fetchgit {
        name = "bosch_locator_bridge_utils-source";
        url = "https://github.com/ros2-gbp/locator_ros_bridge-release.git";
        rev = "0543ae8ef9ded71c7934ac76fac06db56d664145";
        hash = "sha256-KAf4AaaYzx0YW9GP0Iua0bq19A3zfFoIuVT+K6VnPjM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "bosch_locator_bridge_utils";
  version = "2.1.11-1";
  src = sources.bosch_locator_bridge_utils;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav2_util nav_msgs pcl_conversions rclcpp std_srvs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
