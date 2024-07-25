{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  llvmPackages,
  moveit_common,
  moveit_core,
  moveit_msgs,
  moveit_resources_fanuc_moveit_config,
  moveit_resources_panda_moveit_config,
  moveit_resources_pr2_description,
  moveit_ros_planning,
  ompl,
  pluginlib,
  rclcpp,
  substituteSource,
  tf2_eigen,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_planners_ompl = substituteSource {
      src = fetchgit {
        name = "moveit_planners_ompl-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "b74a004ec21aea6d86d8b1a0eaea75ce4b5ca6ce";
        hash = "sha256-QVQqUwQ1UHxRGwDpv+4yocNCAI5+RIDeMJQUdEGH4P8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_planners_ompl";
  version = "2.5.5-1";
  src = sources.moveit_planners_ompl;
  nativeBuildInputs = [ ament_cmake eigen3_cmake_module wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ llvmPackages.openmp moveit_common moveit_core moveit_msgs moveit_ros_planning ompl pluginlib rclcpp tf2_eigen tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
