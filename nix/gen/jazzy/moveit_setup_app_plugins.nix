{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_configs_utils,
  moveit_ros_visualization,
  moveit_setup_framework,
  pluginlib,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    moveit_setup_app_plugins = substituteSource {
      src = fetchgit {
        name = "moveit_setup_app_plugins-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "621950b42f943bddfebe7be7a13e56c73f6a8a13";
        hash = "sha256-v3WYe91IjpNTCrgyLUKfw1KhEM8py0v0i46Np9JzSEo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_setup_app_plugins";
  version = "2.10.0-1";
  src = sources.moveit_setup_app_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp moveit_configs_utils moveit_ros_visualization moveit_setup_framework pluginlib rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}