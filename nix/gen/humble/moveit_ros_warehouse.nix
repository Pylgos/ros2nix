{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
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
        rev = "f04ab34d478ebd166e2f4e44585e37f941c8b5e3";
        hash = "sha256-JglUJzeiWVw5lBvJpZtY6HDog/R2TqnJrJHBZLfKGs8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_warehouse";
  version = "2.5.5-1";
  src = sources.moveit_ros_warehouse;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_common moveit_core moveit_ros_planning rclcpp tf2_eigen tf2_ros warehouse_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
