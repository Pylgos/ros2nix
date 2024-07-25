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
        rev = "2bb4e3dab5b2b456afd757ee109827f233202cac";
        hash = "sha256-yVIZ7Ug7555u6M7F1custYfNfFF2JRNH/SwfXbLdrgo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "draco_point_cloud_transport";
  version = "2.0.5-1";
  src = sources.draco_point_cloud_transport;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib point_cloud_interfaces point_cloud_transport rclcpp rcpputils sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
