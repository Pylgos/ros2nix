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
        rev = "dcf5a4450d5b48fe1597387017837179d14a588e";
        hash = "sha256-qMc/M/ZW88zXpMUQLTsmadUeDREQ+ysQm2q7XwJieiw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_setup_framework";
  version = "2.5.5-1";
  src = sources.moveit_setup_framework;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_common moveit_core moveit_ros_planning moveit_ros_visualization pluginlib rclcpp rviz_common rviz_rendering srdfdom urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
