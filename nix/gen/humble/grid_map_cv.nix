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
        rev = "2c235251fc87a70d3b2e91c70a2c679cd6bcde48";
        hash = "sha256-NnSg1dMyvqKLJ8oiYWFH2X54sL8YmHGD47D67jXsr24=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_cv";
  version = "2.0.0-1";
  src = sources.grid_map_cv;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge filters grid_map_cmake_helpers grid_map_core pluginlib rclcpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
