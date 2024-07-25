{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gbenchmark,
  geometry_msgs,
  llvmPackages,
  nav2_common,
  nav2_core,
  nav2_costmap_2d,
  nav2_msgs,
  nav2_util,
  pluginlib,
  rclcpp,
  std_msgs,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    nav2_mppi_controller = substituteSource {
      src = fetchgit {
        name = "nav2_mppi_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "bbd9c92ce77f74f1f89a4a109d594113f1de9a5b";
        hash = "sha256-ojjNwUHWTMJ0HhqB6IAxoiDCcTItbb/tVyJfpe0gd+s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_mppi_controller";
  version = "1.2.9-1";
  src = sources.nav2_mppi_controller;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros ];
  propagatedNativeBuildInputs = [ gbenchmark ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs llvmPackages.openmp nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util pluginlib rclcpp std_msgs tf2 tf2_eigen tf2_geometry_msgs tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
