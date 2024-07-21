{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch,
  launch_ros,
  ouster_msgs,
  pcl,
  pcl_conversions,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  sensor_msgs,
  std_srvs,
  substituteSource,
  tf2_geometry_msgs,
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    ros2_ouster = substituteSource {
      src = fetchgit {
        name = "ros2_ouster-source";
        url = "https://github.com/ros2-gbp/ros2_ouster_drivers-release.git";
        rev = "37b090d16b2ee85344d291abc8524b70f79b2a6c";
        hash = "sha256-J10TOgX5uVLswW2+O6EN/NNITTTF3PLHYm1NxHBoinw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2_ouster";
  version = "0.5.1-5";
  src = sources.ros2_ouster;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs launch_ros ouster_msgs pcl pcl_conversions rclcpp rclcpp_components rclcpp_lifecycle sensor_msgs std_srvs tf2_geometry_msgs tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
