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
        rev = "0d08bd16634f40486393fe2f1b53aab780a63b41";
        hash = "sha256-VbZw6iMxEqBNvpXZolxBtNplo5UoYE8MowxERhToOPs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_planners_ompl";
  version = "2.8.0-1";
  src = sources.moveit_planners_ompl;
  nativeBuildInputs = [ ament_cmake eigen3_cmake_module wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ llvmPackages.openmp moveit_common moveit_core moveit_msgs moveit_ros_planning ompl pluginlib rclcpp tf2_eigen tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
