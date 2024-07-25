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
        rev = "abcacf7a4a6ef16ac907ddc918e5b7b60647e536";
        hash = "sha256-5Le7L2AjjF4jfUIoNli0PZ/KV55gBbtGCu/MtSSP2Gs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "point_cloud_transport";
  version = "2.0.6-1";
  src = sources.point_cloud_transport;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ message_filters pluginlib rclcpp rclcpp_components rcpputils sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
