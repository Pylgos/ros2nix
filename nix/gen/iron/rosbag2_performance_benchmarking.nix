{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_ros,
  rclcpp,
  rmw,
  ros2bag,
  ros2launch,
  ros_testing,
  rosbag2_compression,
  rosbag2_cpp,
  rosbag2_performance_benchmarking_msgs,
  rosbag2_py,
  rosbag2_storage,
  rosbag2_storage_default_plugins,
  rosbag2_test_common,
  sensor_msgs,
  substituteSource,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    rosbag2_performance_benchmarking = substituteSource {
      src = fetchgit {
        name = "rosbag2_performance_benchmarking-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "3918df206b980a2e1f83a484cdee09a636721860";
        hash = "sha256-E8YT1QzT5vM8CVGfsMiCfgzVhfYhEGJ61dcO886A5L8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_performance_benchmarking";
  version = "0.22.6-1";
  src = sources.rosbag2_performance_benchmarking;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rosbag2_compression rosbag2_cpp rosbag2_performance_benchmarking_msgs rosbag2_py rosbag2_storage sensor_msgs yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
