{
  ament_cmake,
  ament_cmake_uncrustify,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  rclcpp_components,
  rmf_obstacle_msgs,
  rmf_utils,
  rmf_visualization_msgs,
  substituteSource,
  vision_msgs,
  visualization_msgs,
}:
let
  sources = rec {
    rmf_visualization_obstacles = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_obstacles-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "e8c64bd94de535cae6e6ba8690440e4d4d86a762";
        hash = "sha256-VoEDcOuvB2Pm477M/xSRos2pW35xyLxFnL9DjfTM0YM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_obstacles";
  version = "2.1.2-1";
  src = sources.rmf_visualization_obstacles;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rclcpp rclcpp_components rmf_obstacle_msgs rmf_visualization_msgs vision_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
