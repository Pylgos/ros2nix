{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_param_builder,
  moveit_common,
  moveit_configs_utils,
  moveit_core,
  moveit_ros_planning,
  moveit_ros_warehouse,
  pluginlib,
  python3Packages,
  rclcpp,
  substituteSource,
  tf2_eigen,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_benchmarks = substituteSource {
      src = fetchgit {
        name = "moveit_ros_benchmarks-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "313e8465eed8014d144e700d916d45cdd2f2c059";
        hash = "sha256-UC7ZPoQHig1Ohn0FXcRz6bCJPwagnAXbCOLUzNzzW+c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_benchmarks";
  version = "2.5.5-1";
  src = sources.moveit_ros_benchmarks;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_param_builder moveit_common moveit_configs_utils moveit_core moveit_ros_planning moveit_ros_warehouse pluginlib python3Packages.boost rclcpp tf2_eigen ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
