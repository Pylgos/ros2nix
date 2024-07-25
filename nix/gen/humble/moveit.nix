{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_core,
  moveit_planners,
  moveit_plugins,
  moveit_ros,
  moveit_setup_assistant,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit = substituteSource {
      src = fetchgit {
        name = "moveit-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "eb62dca94321b76f42855b2c7772c95670ec174c";
        hash = "sha256-V7rKq3YiehHdtDdumOw4Vy5W8eXMwzvjvosWmjQdl80=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit";
  version = "2.5.5-1";
  src = sources.moveit;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_core moveit_planners moveit_plugins moveit_ros moveit_setup_assistant ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
