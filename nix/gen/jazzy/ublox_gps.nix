{
  ament_cmake_ros,
  asio,
  buildRosPackage,
  diagnostic_msgs,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rcl_interfaces,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2,
  ublox_msgs,
  ublox_serialization,
}:
let
  sources = rec {
    ublox_gps = substituteSource {
      src = fetchgit {
        name = "ublox_gps-source";
        url = "https://github.com/ros2-gbp/ublox-release.git";
        rev = "f5d7776b5a2919a6764491726d07c5370b2488a2";
        hash = "sha256-reZXChxPuNCtJNjWaATs7ozW63ldzYenGz4KQv8rJ1M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ublox_gps";
  version = "2.3.0-4";
  src = sources.ublox_gps;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ asio diagnostic_msgs diagnostic_updater geometry_msgs rcl_interfaces rclcpp rclcpp_components sensor_msgs std_msgs tf2 ublox_msgs ublox_serialization ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}