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
        rev = "a72f6a79f5535d926eb485000cc5be2aeb80a43d";
        hash = "sha256-q5YNbGJlSOBSEDxB29kq5y4oyMVgShZZyprVLOtHpEY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "bosch_locator_bridge";
  version = "2.1.11-1";
  src = sources.bosch_locator_bridge;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ launch_xml rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav_msgs pcl_conversions poco rclcpp rosidl_default_runtime sensor_msgs std_srvs tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
