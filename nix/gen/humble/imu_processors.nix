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
        rev = "e15ad4a314144bddf68dc4142b9ff3ca4c964547";
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
