{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_python,
  ament_lint_auto,
  backward_ros,
  buildRosPackage,
  ceres-solver,
  fast_gicp,
  fetchgit,
  fetchurl,
  fetchzip,
  geodesy,
  geographic_msgs,
  geometry_msgs,
  libg2o,
  message_filters,
  nav_msgs,
  ndt_omp,
  nmea_msgs,
  pcl_ros,
  rclcpp,
  rclpy,
  rviz_visual_tools,
  sensor_msgs,
  situational_graphs_msgs,
  situational_graphs_reasoning,
  situational_graphs_reasoning_msgs,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_ros,
  tf2_sensor_msgs,
  visualization_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    lidar_situational_graphs = substituteSource {
      src = fetchgit {
        name = "lidar_situational_graphs-source";
        url = "https://github.com/ros2-gbp/lidar_situational_graphs-release.git";
        rev = "42ab951eaac6921473ad8e85a20faec0799fc616";
        hash = "sha256-Aub/JED7qeD6syo4xIlL0+hVUUXotVR8HeBoy+WOlkg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lidar_situational_graphs";
  version = "0.0.1-1";
  src = sources.lidar_situational_graphs;
  nativeBuildInputs = [ ament_cmake ament_cmake_python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_cmake_gtest ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros ceres-solver fast_gicp geodesy geographic_msgs geometry_msgs libg2o message_filters nav_msgs ndt_omp nmea_msgs pcl_ros rclcpp rclpy rviz_visual_tools sensor_msgs situational_graphs_msgs situational_graphs_reasoning situational_graphs_reasoning_msgs tf2 tf2_eigen tf2_ros tf2_sensor_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
