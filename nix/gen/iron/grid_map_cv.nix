{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  filters,
  grid_map_cmake_helpers,
  grid_map_core,
  pluginlib,
  rclcpp,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    grid_map_cv = substituteSource {
      src = fetchgit {
        name = "grid_map_cv-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "7c99a8afcf8cfd8a917e40e3b40275f8a859289c";
        hash = "sha256-qCZWQ974P1xAgwLtcQie+I5tyVsjjEUQ3bL7yDrGFmY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_cv";
  version = "2.1.0-1";
  src = sources.grid_map_cv;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge filters grid_map_cmake_helpers grid_map_core pluginlib rclcpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
