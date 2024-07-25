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
        rev = "21e5e7847134f2f8f09be4ba61e04f1bb628a857";
        hash = "sha256-9iK9Xj2cGXRcamsAp0sOOyUt4yFW4qD7K/tfU9CDqyI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav_2d_utils";
  version = "1.2.9-1";
  src = sources.nav_2d_utils;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav2_common nav2_msgs nav2_util nav_2d_msgs nav_msgs std_msgs tf2 tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
