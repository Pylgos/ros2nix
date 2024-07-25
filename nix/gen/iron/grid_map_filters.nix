{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  filters,
  grid_map_cmake_helpers,
  grid_map_core,
  grid_map_msgs,
  grid_map_ros,
  pluginlib,
  substituteSource,
  tbb,
}:
let
  sources = rec {
    grid_map_filters = substituteSource {
      src = fetchgit {
        name = "grid_map_filters-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "93ec1760711bd01f02f245c33f4a900ee47a8234";
        hash = "sha256-vCCLalozZryjOyRsfQqqHyqf/NqKnh+RFDsc0ZwsjGs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_filters";
  version = "2.1.0-1";
  src = sources.grid_map_filters;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ filters grid_map_cmake_helpers grid_map_core grid_map_msgs grid_map_ros pluginlib tbb ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}