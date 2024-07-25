{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_common,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    nav2_voxel_grid = substituteSource {
      src = fetchgit {
        name = "nav2_voxel_grid-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "06c81a15e794ee70d715977bb9234430db2a5b6a";
        hash = "sha256-CPwDdpzrHF2KEMEgm7wGfYquJ8ayzkK/DM0l0Xn8gQY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_voxel_grid";
  version = "1.2.9-1";
  src = sources.nav2_voxel_grid;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nav2_common rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
