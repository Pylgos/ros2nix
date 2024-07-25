{
  ament_cmake_ros,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_msgs,
  nav_msgs,
  rclcpp,
  rclcpp_components,
  rtabmap_msgs,
  rtabmap_sync,
  rtabmap_util,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_ros,
  visualization_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rtabmap_slam = substituteSource {
      src = fetchgit {
        name = "rtabmap_slam-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "0e62624254c527155f40769d89495bb105bc941f";
        hash = "sha256-TUCsQ6jLdXSGrvPKwcXpLYaKBBbYe5yrDXHCLySNwyk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rtabmap_slam";
  version = "0.21.5-1";
  src = sources.rtabmap_slam;
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge geometry_msgs nav2_msgs nav_msgs rclcpp rclcpp_components rtabmap_msgs rtabmap_sync rtabmap_util sensor_msgs std_msgs std_srvs tf2 tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
