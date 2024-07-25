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
  rsl,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_chomp_optimizer_adapter = substituteSource {
      src = fetchgit {
        name = "moveit_chomp_optimizer_adapter-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "7750ce61725de6106b945a08a521fbe0e2405284";
        hash = "sha256-i/ZykBHSpGeC2R53LCvHuGSzd/wkfsdWKv0YH2fxpAc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_chomp_optimizer_adapter";
  version = "2.8.0-1";
  src = sources.moveit_chomp_optimizer_adapter;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ chomp_motion_planner moveit_common moveit_core pluginlib rsl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
