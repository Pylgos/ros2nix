{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  message_filters,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
  tf2_geometry_msgs,
  tf2_ros,
  tf2_sensor_msgs,
}:
let
  sources = rec {
    imu_transformer = substituteSource {
      src = fetchgit {
        name = "imu_transformer-source";
        url = "https://github.com/ros2-gbp/imu_pipeline-release.git";
        rev = "4d7b20bdcf0ea89957e1f9cb6e9e1862f5b009a4";
        hash = "sha256-Plc1rKMYGndrBouRWUfznacsiOj7HXIpMkeOhQhYFjk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "imu_transformer";
  version = "0.4.1-1";
  src = sources.imu_transformer;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ message_filters rclcpp rclcpp_components sensor_msgs tf2_ros tf2_sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
