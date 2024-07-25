{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  point_cloud_interfaces,
  point_cloud_transport,
  rclcpp,
  rcpputils,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    draco_point_cloud_transport = substituteSource {
      src = fetchgit {
        name = "draco_point_cloud_transport-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport_plugins-release.git";
        rev = "7dd0851461414f4eafe8708e7f311bd4f8baf9b0";
        hash = "sha256-X7t/miHMx/uHoXVgyjDiBU3iM8PVkWuqulHuuHIeg/U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "draco_point_cloud_transport";
  version = "1.0.11-1";
  src = sources.draco_point_cloud_transport;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib point_cloud_interfaces point_cloud_transport rclcpp rcpputils sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
