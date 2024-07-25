{
  ament_clang_format,
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_index_cpp,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fmt,
  moveit_common,
  moveit_core,
  moveit_ros_planning,
  moveit_ros_visualization,
  pluginlib,
  rclcpp,
  rviz_common,
  rviz_rendering,
  srdfdom,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_setup_framework = substituteSource {
      src = fetchgit {
        name = "moveit_setup_framework-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "8b1aa7c31d32bed8cd2de6b5231f1abcb5ad1351";
        hash = "sha256-ijk1KBAysfbBl9smjCkQi6+qcbYaXZ5mXFP0y8bX80I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_setup_framework";
  version = "2.8.0-1";
  src = sources.moveit_setup_framework;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fmt moveit_common moveit_core moveit_ros_planning moveit_ros_visualization pluginlib rclcpp rviz_common rviz_rendering srdfdom urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
