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
        rev = "948c35f0834fed25bab9e41553e1fff32fe7b122";
        hash = "sha256-7MShf1oOmc60JWa2ZSyD/MnOn14Yh14xK7sUoUYp+xE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_voxel_grid";
  version = "1.1.15-1";
  src = sources.nav2_voxel_grid;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nav2_common rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
