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
        rev = "00f897848b122523aad09b8c55942f91374d40f1";
        hash = "sha256-LgqxKIlXgMo7GShi1/RuKfNIv32YSu24pfUvWthrIFg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_loader";
  version = "2.0.0-1";
  src = sources.grid_map_loader;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ grid_map_cmake_helpers grid_map_msgs grid_map_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
