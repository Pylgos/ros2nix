{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  chomp_motion_planner,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_common,
  moveit_core,
  pluginlib,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_chomp_optimizer_adapter = substituteSource {
      src = fetchgit {
        name = "moveit_chomp_optimizer_adapter-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "043ad57ed8a1cf34df4fd08f1bdc5c44dbf40358";
        hash = "sha256-X4yvzbD6Rr0jgdoo0z000UivrRgHrAV9qw6FdbZqU2w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_chomp_optimizer_adapter";
  version = "2.5.5-1";
  src = sources.moveit_chomp_optimizer_adapter;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ chomp_motion_planner moveit_common moveit_core pluginlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
