{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  ros_environment,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  tf2_sensor_msgs,
}:
let
  sources = rec {
    message_tf_frame_transformer = substituteSource {
      src = fetchgit {
        name = "message_tf_frame_transformer-source";
        url = "https://github.com/ros2-gbp/message_tf_frame_transformer-release.git";
        rev = "1889c3d8b4e37aa30c1839ac94c717f2864d8bad";
        hash = "sha256-lYSUvKIMjeyVNRJsf7Qj8XGausPw6UVLCKmHL7D1St8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "message_tf_frame_transformer";
  version = "1.1.1-1";
  src = sources.message_tf_frame_transformer;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rclcpp sensor_msgs tf2 tf2_geometry_msgs tf2_ros tf2_sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
