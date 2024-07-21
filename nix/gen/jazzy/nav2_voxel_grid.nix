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
        rev = "5c8cba2a54c9f2c60adadf2ecb419431c0a0e945";
        hash = "sha256-HPdXr4wG6JuQ0WG3bTp4rhWpedD2dG1Rwyv/6dhuZOE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_voxel_grid";
  version = "1.3.1-1";
  src = sources.nav2_voxel_grid;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ nav2_common ];
  propagatedBuildInputs = [ rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
