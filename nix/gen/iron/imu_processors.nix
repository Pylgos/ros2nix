{
  ament_cmake,
  ament_cmake_cpplint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    imu_processors = substituteSource {
      src = fetchgit {
        name = "imu_processors-source";
        url = "https://github.com/ros2-gbp/imu_pipeline-release.git";
        rev = "ef48bf7e5ed2a1ceecd2e39c29c489b88831ab87";
        hash = "sha256-7hZIdvNGKgABU4l3MJMBcVsTWfj/ER23SmC2sJH1ork=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "imu_processors";
  version = "0.4.1-1";
  src = sources.imu_processors;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav_msgs rclcpp rclcpp_components sensor_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
