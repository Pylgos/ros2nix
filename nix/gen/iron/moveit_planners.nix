{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_planners_ompl,
  moveit_planners_stomp,
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
        rev = "c2db95ec07e55136989f21fa8033f0647e7944f2";
        hash = "sha256-K5RMSdrUJZQBekhedzD6755m3sVa9xXKQ7LNz4jK5Ok=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_planners";
  version = "2.8.0-1";
  src = sources.moveit_planners;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_planners_ompl moveit_planners_stomp pilz_industrial_motion_planner ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
