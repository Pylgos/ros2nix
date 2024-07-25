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
  rmw,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    point_cloud_transport = substituteSource {
      src = fetchgit {
        name = "point_cloud_transport-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport-release.git";
        rev = "8108b64966cc2babfcd6e4835215963a5351bb5f";
        hash = "sha256-mq0tSzDHryghn5wXiRjX+OsdjwBPePVEEMNIVKbeA8A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "point_cloud_transport";
  version = "5.0.2-1";
  src = sources.point_cloud_transport;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ message_filters pluginlib rclcpp rclcpp_components rcpputils rmw sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
