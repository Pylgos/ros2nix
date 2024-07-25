{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  grid_map_cmake_helpers,
  grid_map_core,
  grid_map_msgs,
  grid_map_ros,
  libyamlcpp,
  pcl,
  rclcpp,
  rcutils,
  substituteSource,
}:
let
  sources = rec {
    grid_map_pcl = substituteSource {
      src = fetchgit {
        name = "grid_map_pcl-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "eebe7f87183ae900ca424235b28714c6c0223f93";
        hash = "sha256-3bmXo+fjh7m96ZWDZm9cgjIdbiZvlwX5lA/itxg/hik=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_pcl";
  version = "2.0.0-1";
  src = sources.grid_map_pcl;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ grid_map_cmake_helpers grid_map_core grid_map_msgs grid_map_ros libyamlcpp pcl rclcpp rcutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
