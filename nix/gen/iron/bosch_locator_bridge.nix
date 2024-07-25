{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch_xml,
  nav_msgs,
  pcl_conversions,
  poco,
  rclcpp,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_srvs,
  substituteSource,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    bosch_locator_bridge = substituteSource {
      src = fetchgit {
        name = "bosch_locator_bridge-source";
        url = "https://github.com/ros2-gbp/locator_ros_bridge-release.git";
        rev = "7b969b1dbf2f3e07adae6dc41632bbe49ad41d51";
        hash = "sha256-cjlg+HnDHqnkmYIATpFP96oT4wHzeRKLp3pPYjJnm3M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "bosch_locator_bridge";
  version = "2.1.9-3";
  src = sources.bosch_locator_bridge;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ launch_xml rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav_msgs pcl_conversions poco rclcpp rosidl_default_runtime sensor_msgs std_srvs tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
