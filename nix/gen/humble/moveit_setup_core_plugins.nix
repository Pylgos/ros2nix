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
        rev = "b711ef4dab2196bf907fa3e25b0cf4f13176e88e";
        hash = "sha256-hvt8u548nL3wFxoJyh0t0ckPw75/ZMkrkJFW3S7kGG0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_setup_core_plugins";
  version = "2.5.5-1";
  src = sources.moveit_setup_core_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_ros_visualization moveit_setup_framework pluginlib rclcpp srdfdom urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
