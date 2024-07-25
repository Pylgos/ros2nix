{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing,
  nav2_common,
  navigation2,
  slam_toolbox,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    nav2_bringup = substituteSource {
      src = fetchgit {
        name = "nav2_bringup-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "ef5b75cd3a28db0f17b306c4caff73285cb8b6a0";
        hash = "sha256-wjK6KfvjYi4i+RV9F8rq1wUdsNCJoM3EoW/Ysp5c3aw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_bringup";
  version = "1.1.15-1";
  src = sources.nav2_bringup;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros nav2_common navigation2 slam_toolbox ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
