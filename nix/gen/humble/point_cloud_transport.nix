{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  message_filters,
  pluginlib,
  rclcpp,
  rclcpp_components,
  rcpputils,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    point_cloud_transport = substituteSource {
      src = fetchgit {
        name = "point_cloud_transport-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport-release.git";
        rev = "622a9160b7e8362cc458000282c025a6bc2ec747";
        hash = "sha256-vxipXZgDno1mAhZkswdERq5lATI7DubYkuqbtsmv9Uk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "point_cloud_transport";
  version = "1.0.18-1";
  src = sources.point_cloud_transport;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ message_filters pluginlib rclcpp rclcpp_components rcpputils sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
