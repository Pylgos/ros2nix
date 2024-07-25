{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fmt,
  moveit_common,
  moveit_core,
  moveit_ros_planning,
  rclcpp,
  substituteSource,
  tf2_eigen,
  tf2_ros,
  warehouse_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_warehouse = substituteSource {
      src = fetchgit {
        name = "moveit_ros_warehouse-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "0ff1f783f63c2a04f66f10890743607c66921261";
        hash = "sha256-24bKiD0D+tRhYH7AhG/3oPZxdBDrCONwhHFkhOFpU08=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_warehouse";
  version = "2.8.0-1";
  src = sources.moveit_ros_warehouse;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fmt moveit_common moveit_core moveit_ros_planning rclcpp tf2_eigen tf2_ros warehouse_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
