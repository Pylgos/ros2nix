{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_planners_ompl,
  pilz_industrial_motion_planner,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_planners = substituteSource {
      src = fetchgit {
        name = "moveit_planners-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "6ec6fb830b54aaec75992189e5c5b22fc858e944";
        hash = "sha256-qhaue5UVYZuU2nWItOluOHvQdtLTJ6bgYaGI2xxf6hU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_planners";
  version = "2.5.5-1";
  src = sources.moveit_planners;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_planners_ompl pilz_industrial_motion_planner ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
