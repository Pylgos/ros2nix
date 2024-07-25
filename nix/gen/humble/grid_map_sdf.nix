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
  pcl,
  substituteSource,
}:
let
  sources = rec {
    grid_map_sdf = substituteSource {
      src = fetchgit {
        name = "grid_map_sdf-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "cebad462ccfc54949dca6a3d7a1e081d76e5adca";
        hash = "sha256-82MTHWQOoxPauktwbwzrp/Rw8nc/kGgLG5jUevQQAF0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_sdf";
  version = "2.0.0-1";
  src = sources.grid_map_sdf;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ grid_map_cmake_helpers grid_map_core pcl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
