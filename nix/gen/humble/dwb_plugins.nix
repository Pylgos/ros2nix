{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  dwb_core,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_common,
  nav2_util,
  nav_2d_msgs,
  nav_2d_utils,
  pluginlib,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    dwb_plugins = substituteSource {
      src = fetchgit {
        name = "dwb_plugins-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "4e65c62bccb8aaa4c2da9ae07389ec0487f6b2eb";
        hash = "sha256-HGjXj8uoXZDjGMljic4LwyqY0ePUSM9UA031rNg/9dc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dwb_plugins";
  version = "1.1.15-1";
  src = sources.dwb_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles dwb_core nav2_common nav2_util nav_2d_msgs nav_2d_utils pluginlib rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
