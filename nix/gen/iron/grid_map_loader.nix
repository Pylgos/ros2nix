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
  grid_map_msgs,
  grid_map_ros,
  substituteSource,
}:
let
  sources = rec {
    grid_map_loader = substituteSource {
      src = fetchgit {
        name = "grid_map_loader-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "34f6ff07f9cdd5efcce468ce7887303f10db382f";
        hash = "sha256-6AFEWr01PYrqkieF9g5VkeJ9/rPlgxql8tLMY7MkeHs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_loader";
  version = "2.1.0-1";
  src = sources.grid_map_loader;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ grid_map_cmake_helpers grid_map_msgs grid_map_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
