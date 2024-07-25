{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mrpt_msgs,
  mrpt_sensorlib,
  rclcpp,
  rclcpp_components,
  ros_environment,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    mrpt_generic_sensor = substituteSource {
      src = fetchgit {
        name = "mrpt_generic_sensor-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "0b2f01cf0ebe09f5a0dd139d1432cc0067a38064";
        hash = "sha256-J9XEAT75hKBBLE2nIcuLM4QCxoFaIryQkceta1uceJk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_generic_sensor";
  version = "0.2.1-1";
  src = sources.mrpt_generic_sensor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint_common mrpt_msgs mrpt_sensorlib rclcpp rclcpp_components sensor_msgs tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
