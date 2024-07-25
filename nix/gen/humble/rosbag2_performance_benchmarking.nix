{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rmw,
  rosbag2_compression,
  rosbag2_cpp,
  rosbag2_storage,
  std_msgs,
  substituteSource,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    rosbag2_performance_benchmarking = substituteSource {
      src = fetchgit {
        name = "rosbag2_performance_benchmarking-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "0656fc091c50d6c828b60178af0f0078957ba287";
        hash = "sha256-8LAZHr2LGbQ3A0eU9RlTCiAQFIVqfeoPQWmINPUyH8U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_performance_benchmarking";
  version = "0.15.11-1";
  src = sources.rosbag2_performance_benchmarking;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rosbag2_compression rosbag2_cpp rosbag2_storage std_msgs yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
