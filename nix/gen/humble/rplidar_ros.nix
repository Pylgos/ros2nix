{
  ament_cmake_auto,
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    rplidar_ros = substituteSource {
      src = fetchgit {
        name = "rplidar_ros-source";
        url = "https://github.com/ros2-gbp/rplidar_ros-release.git";
        rev = "a143a58fe1d9d193dd58dc64b24403aa6cc6d6f2";
        hash = "sha256-dcLVgW6m/bK+BIzVO44Tn6zPaq5W18bw3U11JGZqrCU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rplidar_ros";
  version = "2.1.4-1";
  src = sources.rplidar_ros;
  nativeBuildInputs = [ ament_cmake_auto ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components sensor_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
