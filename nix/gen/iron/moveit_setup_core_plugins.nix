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
  moveit_ros_visualization,
  moveit_setup_framework,
  pluginlib,
  rclcpp,
  srdfdom,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_setup_core_plugins = substituteSource {
      src = fetchgit {
        name = "moveit_setup_core_plugins-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "a0332e323ef3a640399d6e9865444d0bb240e9d2";
        hash = "sha256-HCrpiQP2p1lO6+/1NlNmJRbZ7x0PFKcbEVmQlVfCf+k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_setup_core_plugins";
  version = "2.8.0-1";
  src = sources.moveit_setup_core_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_ros_visualization moveit_setup_framework pluginlib rclcpp srdfdom urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
