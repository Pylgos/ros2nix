{
  ament_clang_format,
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_index_cpp,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_resources_panda_moveit_config,
  moveit_setup_app_plugins,
  moveit_setup_controllers,
  moveit_setup_core_plugins,
  moveit_setup_framework,
  moveit_setup_srdf_plugins,
  pluginlib,
  qt5,
  rclcpp,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_setup_assistant = substituteSource {
      src = fetchgit {
        name = "moveit_setup_assistant-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "3bdbff686e4a2d430668dc5ec5f6043a0a89bcf4";
        hash = "sha256-pvUA97RkuBS/p3rII56eG+ZxsyKmuUnna0YpP68EF6c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_setup_assistant";
  version = "2.8.0-1";
  src = sources.moveit_setup_assistant;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_setup_app_plugins moveit_setup_controllers moveit_setup_core_plugins moveit_setup_framework moveit_setup_srdf_plugins pluginlib qt5.qtbase rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
