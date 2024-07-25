{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_google_benchmark,
  ament_cmake_gtest,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  angles,
  assimp,
  buildRosPackage,
  bullet,
  common_interfaces,
  eigen,
  eigen3_cmake_module,
  eigen_stl_containers,
  fcl,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  geometric_shapes,
  geometry_msgs,
  google_benchmark_vendor,
  kdl_parser,
  moveit_common,
  moveit_msgs,
  moveit_resources_panda_moveit_config,
  moveit_resources_pr2_description,
  octomap,
  octomap_msgs,
  orocos_kdl_vendor,
  pkg-config,
  pluginlib,
  pybind11_vendor,
  python3Packages,
  random_numbers,
  rclcpp,
  ruckig,
  sensor_msgs,
  shape_msgs,
  srdfdom,
  std_msgs,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  tf2_kdl,
  trajectory_msgs,
  urdf,
  urdfdom,
  urdfdom_headers,
  visualization_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_core = substituteSource {
      src = fetchgit {
        name = "moveit_core-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "a9e60dc8c850399396f0a0fb7783512f91427a68";
        hash = "sha256-gUwHJ4cr+MTjeBA9fTtTRinu9A5BwSJkBLChlMmB+Pk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_core";
  version = "2.8.0-1";
  src = sources.moveit_core;
  nativeBuildInputs = [ ament_cmake pkg-config wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module google_benchmark_vendor ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles assimp bullet common_interfaces eigen eigen_stl_containers fcl generate_parameter_library geometric_shapes geometry_msgs kdl_parser moveit_common moveit_msgs octomap octomap_msgs pluginlib pybind11_vendor python3Packages.boost random_numbers rclcpp ruckig sensor_msgs shape_msgs srdfdom std_msgs tf2 tf2_eigen tf2_geometry_msgs tf2_kdl trajectory_msgs urdf urdfdom urdfdom_headers visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
