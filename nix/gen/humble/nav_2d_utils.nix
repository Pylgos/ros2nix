{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_common,
  nav2_msgs,
  nav2_util,
  nav_2d_msgs,
  nav_msgs,
  std_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
}:
let
  sources = rec {
    nav_2d_utils = substituteSource {
      src = fetchgit {
        name = "nav_2d_utils-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "c5eaaf5061b5f7df47142799707a5abac8b6a731";
        hash = "sha256-C94mpZGwLU/haW0bQeag+6zKmF1MmMDYh0tT0mVsEos=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav_2d_utils";
  version = "1.1.15-1";
  src = sources.nav_2d_utils;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav2_common nav2_msgs nav2_util nav_2d_msgs nav_msgs std_msgs tf2 tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
