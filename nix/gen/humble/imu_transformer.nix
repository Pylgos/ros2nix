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
        rev = "62f2924d56ec9c4e21459073705a1f23e7711118";
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
