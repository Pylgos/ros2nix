{
  action_msgs,
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  diagnostic_msgs,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  image_transport,
  kdl_parser,
  naoqi_bridge_msgs,
  naoqi_libqi,
  naoqi_libqicore,
  python3Packages,
  rclcpp,
  rclcpp_action,
  robot_state_publisher,
  rosidl_default_generators,
  sensor_msgs,
  substituteSource,
  tf2_geometry_msgs,
  tf2_msgs,
  tf2_ros,
}:
let
  sources = rec {
    naoqi_driver = substituteSource {
      src = fetchgit {
        name = "naoqi_driver-source";
        url = "https://github.com/ros-naoqi/naoqi_driver2-release.git";
        rev = "b7a486d8009c46f800cde7a6db3b536339fdb172";
        hash = "sha256-trLN3h2MQ0/1ooMgCSBmpLIFjrbwKzjN1t0grI54doY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "naoqi_driver";
  version = "2.1.1-1";
  src = sources.naoqi_driver;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs cv_bridge diagnostic_msgs diagnostic_updater geometry_msgs image_transport kdl_parser naoqi_bridge_msgs naoqi_libqi naoqi_libqicore python3Packages.boost rclcpp rclcpp_action robot_state_publisher sensor_msgs tf2_geometry_msgs tf2_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
