{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  grid_map_cmake_helpers,
  grid_map_core,
  grid_map_cv,
  grid_map_msgs,
  nav2_msgs,
  nav_msgs,
  rclcpp,
  rcutils,
  rosbag2_cpp,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2,
  visualization_msgs,
}:
let
  sources = rec {
    grid_map_ros = substituteSource {
      src = fetchgit {
        name = "grid_map_ros-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "b655ddb6b5009715afa08d95b573b10c6e03649c";
        hash = "sha256-9WMBaISHZ5MWbGBPgRAHppqkISHjnbKpx/zzTOA9Axc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_ros";
  version = "2.1.0-1";
  src = sources.grid_map_ros;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge geometry_msgs grid_map_cmake_helpers grid_map_core grid_map_cv grid_map_msgs nav2_msgs nav_msgs rclcpp rcutils rosbag2_cpp sensor_msgs std_msgs tf2 visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
